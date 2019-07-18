package com.ict.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.MVO;

@Controller
public class MainController {
	@Autowired
	private DAO dao;
	private String wPage;
	
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
	
	@RequestMapping(value = "a_recipe")
	public ModelAndView geta_recipe() {
		ModelAndView mv = new ModelAndView("a_recipe");
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
