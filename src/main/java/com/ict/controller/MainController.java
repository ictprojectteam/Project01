package com.ict.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.MVO;
import com.ict.service.Pageing;
import com.ict.service.RVO;

@Controller
public class MainController {
	@Autowired
	private DAO dao;
	private String wPage;
	@Autowired	
	private Pageing pageing;
	
	String cPage;
	
	
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
			mv.setViewName("loginfail");
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
		int count = dao.getCount();
		pageing.setTotalRecord(count);
		
		if(pageing.getTotalRecord() <= pageing.getNumPerPage()) {
			pageing.setTotalPage(1);
		}else {
			pageing.setTotalPage(pageing.getTotalRecord() / pageing.getNumPerPage());
			if(pageing.getTotalRecord() % pageing.getNumPerPage() !=0) {
				pageing.setTotalPage(pageing.getTotalPage()+1);
			}
		}
		
		cPage = request.getParameter("cPage");
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
		
		List<RVO> r_list = dao.getr_list2(pageing.getBegin(), pageing.getEnd());
		mv.addObject("r_list", r_list);
		mv.addObject("pageing", pageing);
	
		return mv;
	}
	
	@RequestMapping("search.do")
	public ModelAndView getSearch(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView("search");
		RVO rvo = dao.getSearch(name);
		mv.addObject("rvo", rvo);
		return mv;
	}
	
	@RequestMapping(value = "membership")
	public ModelAndView getMembership(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("membership");
		int count = dao.getCount();
		pageing.setTotalRecord(count);
		
		if(pageing.getTotalRecord() <= pageing.getNumPerPage()) {
			pageing.setTotalPage(1);
		}else {
			pageing.setTotalPage(pageing.getTotalRecord() / pageing.getNumPerPage());
			if(pageing.getTotalRecord() % pageing.getNumPerPage() !=0) {
				pageing.setTotalPage(pageing.getTotalPage()+1);
			}
		}
		
		cPage = request.getParameter("cPage");
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
		
		List<MVO> m_list = dao.getList();
		mv.addObject("m_list", m_list);
		mv.addObject("pageing", pageing);
	
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
		ModelAndView mv = new ModelAndView("index");
		wPage = "recipe.jsp";
		addw(mv);
		return mv;
	}
	
	@RequestMapping("video")
	public ModelAndView getVideo() {
		ModelAndView mv = new ModelAndView("index");
		wPage = "video.jsp";
		addw(mv);
		return mv;
	}
	
	public void addw(ModelAndView mv) {
		mv.addObject("wPage", wPage);
	}
	
	
	
}
