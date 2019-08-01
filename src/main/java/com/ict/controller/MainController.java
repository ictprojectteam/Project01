package com.ict.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Base64.Encoder;

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
import com.ict.service.Pageing;
import com.ict.service.RVO;
import com.ict.service.RecipeVO;

@Controller
public class MainController {
	@Autowired
	private DAO dao;
	@Autowired
	private Pageing pageing;
	
	private String wPage;
	
	public Pageing getPageing() {
		return pageing;
	}

	public void setPageing(Pageing pageing) {
		this.pageing = pageing;
	}

	
	@RequestMapping(value = "/")
	public ModelAndView getIndex() {
		ModelAndView mv = new ModelAndView("index");
		wPage = "mainbody.jsp";
		addw(mv);
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
			List<RVO> r_list = dao.getr_list();
			mv.addObject("r_list", r_list);
		} else {
			mv.setViewName("a_loginfail");
		}
		return mv;
	}
	@RequestMapping(value = "home")
	public ModelAndView getAdmin() {
		ModelAndView mv = new ModelAndView("admin");
		List<MVO> list = dao.getList();
		mv.addObject("list", list);
		List<RVO> r_list = dao.getr_list();
		mv.addObject("r_list", r_list);
		return mv;
	}
		
	@RequestMapping(value = "a_recipe")
	public ModelAndView geta_recipe(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("a_recipe");
		// 전체 게시물의 수
		int count = dao.getRecipeCount();
		pageing.setTotalRecord(count);
		
		if(pageing.getTotalRecord() <= pageing.getNumPerPage()) {
			pageing.setTotalPage(1);
		}else {
			pageing.setTotalPage(pageing.getTotalRecord() / pageing.getNumPerPage());
			if(pageing.getTotalRecord() % pageing.getNumPerPage() !=0) {
				pageing.setTotalPage(pageing.getTotalPage()+1);
			}
		}
		
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			pageing.setNowPage(1);
		}else {
			pageing.setNowPage(Integer.parseInt(cPage));
		}
		
		pageing.setBegin((pageing.getNowPage()-1)*pageing.getNumPerPage()+1);
		pageing.setEnd((pageing.getBegin()-1)+pageing.getNumPerPage());
		
		pageing.setBeginBlock((int)((pageing.getNowPage()-1) / pageing.getPagePerBlock()) * pageing.getPagePerBlock()+1);
		pageing.setEndBlock(pageing.getBeginBlock()+pageing.getPagePerBlock()-1);
		
		if(pageing.getEndBlock() > pageing.getTotalPage()) {
			pageing.setEndBlock(pageing.getTotalPage());
		}
		
		List<RVO> r_list = dao.get_recipe_list(pageing.getBegin(), pageing.getEnd());
		mv.addObject("r_list", r_list);
		mv.addObject("pageing", pageing);
	
		return mv;
	}
	
	@RequestMapping(value = "membership")
	public ModelAndView getMembership(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("membership");
		// 전체 게시물의 수
		int count = dao.getRecipeCount();
		pageing.setTotalRecord(count);
		
		if(pageing.getTotalRecord() <= pageing.getNumPerPage()) {
			pageing.setTotalPage(1);
		}else {
			pageing.setTotalPage(pageing.getTotalRecord() / pageing.getNumPerPage());
			if(pageing.getTotalRecord() % pageing.getNumPerPage() !=0) {
				pageing.setTotalPage(pageing.getTotalPage()+1);
			}
		}
		
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			pageing.setNowPage(1);
		}else {
			pageing.setNowPage(Integer.parseInt(cPage));
		}
		
		pageing.setBegin((pageing.getNowPage()-1)*pageing.getNumPerPage()+1);
		pageing.setEnd((pageing.getBegin()-1)+pageing.getNumPerPage());
		
		pageing.setBeginBlock((int)((pageing.getNowPage()-1) / pageing.getPagePerBlock()) * pageing.getPagePerBlock()+1);
		pageing.setEndBlock(pageing.getBeginBlock()+pageing.getPagePerBlock()-1);
		
		if(pageing.getEndBlock() > pageing.getTotalPage()) {
			pageing.setEndBlock(pageing.getTotalPage());
		}
		
				
		List<MVO> m_list = dao.get_member_List(pageing.getBegin(), pageing.getEnd());
		mv.addObject("m_list", m_list);
		mv.addObject("pageing", pageing);
	
		return mv;
	}
	
	@RequestMapping(value = "selectonemember.do")
	public ModelAndView getSelectOneMember(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView("selectonemember");
		MVO mvo = dao.getOneMemberList(name);
		mv.addObject("mvo", mvo);
		return mv;
	}
	
	@RequestMapping(value = "selectonerecipe.do")
	public ModelAndView getSelectOneRecipe(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView("selectonerecipe");
		List<RVO> one_r_list = dao.getOneRecipeList(name);
		mv.addObject("one_r_list", one_r_list);
		return mv;
	}
	
	@RequestMapping(value = "a_write_recipe")
	public ModelAndView getAdminWriteRecipe() {
		return new ModelAndView("a_write_recipe");
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
		
		Map<String, String> listmap = new HashMap<String, String>();
		listmap.put("ca1", ca1);
		listmap.put("ca2", ca2);
		listmap.put("ca3", ca3);
		listmap.put("ca4", ca4);
		int count = dao.countRecipe(listmap);
		Pageing rp = new Pageing(count, cPage);
		
		listmap.put("begin", String.valueOf(rp.getBegin()));
		listmap.put("end", String.valueOf(rp.getEnd()));
		
		List<RecipeVO> r_list = dao.getRecipeList(listmap);
		mv.addObject("r_list", r_list);
		mv.addObject("rp", rp);
		
		return mv;
	}
	
	@RequestMapping("view")
	public ModelAndView viewRecipe(@RequestParam String rno) {
		ModelAndView mv = new ModelAndView("view");
		mv.addObject("rvo", dao.viewRecipe(rno));
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
	/*
	 * @RequestMapping("talk") public ModelAndView getTalk() { ModelAndView mv = new
	 * ModelAndView("index"); wPage = "talk.jsp"; addw(mv); return mv; }
	 * 
	 * @RequestMapping("talk_write") public ModelAndView getTalk_write() {
	 * ModelAndView mv = new ModelAndView("index"); wPage = "talk_write.jsp";
	 * addw(mv); return mv; }
	 * 
	 * @RequestMapping("talk_write_ok") public ModelAndView getTalkWrite(TVO tvo) {
	 * ModelAndView mv = new ModelAndView("index");
	 * 
	 * wPage = "talk.jsp"; addw(mv); return mv; }
	 */
	
//	유튜브 썸네일 URI를 ajax로 받기 위한 메소드
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
				fis.close();
				return out;
			}
			return new String(path.getBytes());
		} catch (IIOException e){
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		}
		return null;
	}
	
	public void addw(ModelAndView mv) {
		mv.addObject("wPage", wPage);
	}
	
	
	
}
