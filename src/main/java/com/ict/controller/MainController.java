package com.ict.controller;

import java.util.List;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.ict.service.RecipePaging;
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
	
	@RequestMapping("join")
	public ModelAndView goJoin() {
		return new ModelAndView("join");
	}
	
	@RequestMapping("join_ok")
	public ModelAndView getInsert(MVO mvo) {
		ModelAndView mv = new ModelAndView("redirect:/");
		dao.getJoin(mvo);
		return mv;
	}
	
	@RequestMapping(value = "m")
	public ModelAndView getAdminLogin() {
		ModelAndView mv = new ModelAndView("admin_login");
		
		return mv;
	}
	
	@RequestMapping(value = "admin", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView a_goLogin(MVO mvo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MVO r_mvo = dao.getLogin(mvo);
		if (r_mvo != null) {
			session.setAttribute("mvo", r_mvo);
			mv.setViewName("admin");
			List<MVO> list = dao.getList();
			mv.addObject("list", list);
		} else {
			mv.setViewName("loginfail");
		}
		return mv;
	}
	@RequestMapping(value = "home")
	public ModelAndView getAdmin() {
		ModelAndView mv = new ModelAndView("admin");
		List<MVO> list = dao.getList();
		mv.addObject("list", list);
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
	public ModelAndView getRecipe(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("recipe");
		String ca1 = request.getParameter("ca1");
		String ca2 = request.getParameter("ca2");
		String ca3 = request.getParameter("ca3");
		String ca4 = request.getParameter("ca4");
		String cPage = request.getParameter("cPage");
		
		if (ca1 == null) ca1 = "";
		if (ca2 == null) ca2 = "";
		if (ca3 == null) ca3 = "";
		if (ca4 == null) ca4 = "";
		if (cPage == null) cPage = "";
		
		Map<String, String> camap = new HashMap<String, String>();
		camap.put("ca1", ca1);
		camap.put("ca2", ca2);
		camap.put("ca3", ca3);
		camap.put("ca4", ca4);
		int count = dao.getCount(camap);
		RecipePaging rp = new RecipePaging(count, cPage);
		
		Map<String, Integer> pmap = new HashMap<String, Integer>();
		pmap.put("begin", rp.getBegin());
		pmap.put("end", rp.getEnd());
		
		List<RecipeVO> r_list = dao.getRecipeList(pmap);
		mv.addObject("r_list", r_list);
		mv.addObject("rp", rp);
		
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
		ModelAndView mv = new ModelAndView("redirect:recipe");
		Enumeration<String> enu = request.getParameterNames();
		List<String> paraname = new ArrayList<String>();
		List<String> packs = new ArrayList<String>();
		List<List<String>> materials = new ArrayList<List<String>>();
		List<String> orders = new ArrayList<String>();
		List<String> orderContents = new ArrayList<String>();
		List<String> finImages = new ArrayList<String>();
		while(enu.hasMoreElements()) {
			paraname.add(enu.nextElement());
		}
		for (String k : paraname) {
			if(k.matches("^ing-pack-\\d*$")) {
				packs.add(request.getParameter(k));
				materials.add(new ArrayList<String>());
			}
			if(k.matches("^order-text-.*$")) orders.add(request.getParameter(k));
			if(k.matches("^recipe-each-name-.*$")) {
				String parano = k.replace("recipe-each-name-", "");
				materials.get(Integer.parseInt(parano.substring(0,1)) - 1).add(request.getParameter(k));
			}
			if(k.matches("^comp-image-val-.*$")) finImages.add(request.getParameter(k));
		}
		for (int i = 0; i < orders.size(); i++) {
			orderContents.add("{" + request.getParameter("order-text-" + (i + 1)) + ", " + request.getParameter("order-image-" + (i + 1)) + "}");
		}
		rvo.setPack(packs.toString());
		rvo.setMaterial(materials.toString());
		rvo.setOrderContent(orderContents.toString());
		rvo.setFinImage(finImages.toString());
		
		dao.getInsert(rvo);
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
