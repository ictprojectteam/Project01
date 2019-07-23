package com.ict.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Enumeration;
import java.util.List;

import javax.imageio.IIOException;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.MVO;
import com.ict.service.RecipeVO;

@Controller
public class MainController {
	@Autowired
	private DAO dao;
	
	@RequestMapping(value = "/")
	public ModelAndView getIndex() {
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	@RequestMapping(value = "login")
	public ModelAndView getLogin() {
		ModelAndView mv = new ModelAndView("login");
		
		return mv;
	}
	
	@RequestMapping(value = "goLogin", method = RequestMethod.POST)
	public ModelAndView goLogin(MVO mvo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MVO r_mvo = dao.getLogin(mvo);
		if (r_mvo != null) {
			session.setAttribute("mvo", r_mvo);
			mv.setViewName("redirect:/");
		} else {
			mv.setViewName("loginfail");
		}
		return mv;
	}
	
	@RequestMapping(value = "admin")
	public ModelAndView getAdminLogin() {
		ModelAndView mv = new ModelAndView("admin_login");
		
		return mv;
	}
	
	@RequestMapping(value = "goAdminLogin", method = RequestMethod.POST)
	public ModelAndView goAdminLogin(MVO mvo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MVO r_mvo = dao.getLogin(mvo);
		if (r_mvo != null) {
			session.setAttribute("mvo", r_mvo);
			mv.setViewName("redirect:/");		// admin > Home 
		} else {
			mv.setViewName("loginfail");
		}
		return mv;
	}
	
	@RequestMapping("logout")
	public ModelAndView getLogout(HttpServletRequest request) {
		String str = request.getHeader("REFERER");
		str = str.substring(str.lastIndexOf("/") + 1, str.length());
		request.getSession().removeAttribute("mvo");
		if (str.equals("")) str = "/";
		return new ModelAndView("redirect:" + str);
	}
	
	@RequestMapping("recipe")
	public ModelAndView getRecipe() {
		ModelAndView mv = new ModelAndView("recipe");
		return mv;
	}
	
	@RequestMapping("write_recipe")
	public ModelAndView writeRecipe(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("mvo") != null) {
			mv.setViewName("write_recipe");
		} else {
			mv.setViewName("inappropriate");
		}
		return mv;
	}
	
	@RequestMapping(value = "save_recipe", method = RequestMethod.POST)
	public ModelAndView saveRecipe(HttpServletRequest request, RecipeVO rvo) {
		ModelAndView mv = new ModelAndView("recipe");
		System.out.println(rvo.getRecipe_title());
		System.out.println(rvo.getRecipe_introduce());
		System.out.println(rvo.getRecipe_video());
		System.out.println(rvo.getCa1());
		System.out.println(rvo.getCa2());
		System.out.println(rvo.getCa3());
		System.out.println(rvo.getCa4());
		System.out.println(rvo.getRecipe_quant());
		System.out.println(rvo.getRecipe_time());
		System.out.println(rvo.getRecipe_difficulty());
		System.out.println(rvo.getMain_image());
		List<String> pack = new ArrayList<String>();
		List<List<String>> materials = new ArrayList<List<String>>();
		Enumeration<String> enu = request.getParameterNames();
		List<String> paraname = new ArrayList<String>();
		while(enu.hasMoreElements()) {
			paraname.add(enu.nextElement());
		}
		for (String k : paraname) {
			if(k.matches("^ing-pack-\\d*$")) pack.add(request.getParameter(k));
		}
		for (int i = 0; i < pack.size(); i++) {
			materials.add(new ArrayList<String>());
		}
		for (String k : paraname) {
			if(k.matches("^recipe-each-name-.*$")) {
				String parano = k.replace("recipe-each-name-", "");
				materials.get(Integer.parseInt(parano.substring(0,1)) - 1).add(request.getParameter(k));
			}
		}
		
		String packstr = pack.toString();
		System.out.println(packstr);
		for (List<String> k : materials) {
			System.out.println(k.toString());
		}
		System.out.println(materials.toString());
		
		return mv;
	}
	
	@RequestMapping("video")
	public ModelAndView getVideo() {
		ModelAndView mv = new ModelAndView("video");
		return mv;
	}
	
	@RequestMapping("thumbnail")
	@ResponseBody
	public String getThumbnail(@RequestParam("url")String url, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("/resources/temp/test.jpg");
		try {
			URL r_url = new URL(url);
			BufferedImage img = ImageIO.read(r_url);
			File file = new File(path);
			ImageIO.write(img, "jpg", file);
			file = new File(path);
			if(file.isFile()) {
				byte[] bt = new byte[(int)file.length()];
				FileInputStream fis = new FileInputStream(file);
				fis.read(bt);
				Encoder encoder = Base64.getEncoder();
				byte[] encodebyte = encoder.encode(bt);
				String out = new String(encodebyte);
				out = "data:image/jpg;base64,"+out;
				return out;
			}
			return new String(path.getBytes());
		} catch (IIOException e){
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		}
		return null;
	}
}
