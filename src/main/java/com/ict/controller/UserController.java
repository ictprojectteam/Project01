package com.ict.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.MVO;

@Controller
public class UserController {
	@Autowired
	private DAO dao;
	
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
	
	@RequestMapping("check_login")
	public ModelAndView checkLogin() {
		return new ModelAndView("check_login");
	}
	
	@RequestMapping("updateprofile")
	public ModelAndView goCheck(MVO mvo) {
		ModelAndView mv = new ModelAndView();
		if (mvo != null) {
			try {
				if (dao.getLogin(mvo) != null) {
					mv.setViewName("updateprofile");
					return mv;
				} else {
					mv.setViewName("loginfail");
					return mv;
				}
			} catch (Exception e) {
				mv.setViewName("inappropriate");
				return mv;
			}
		} else {
			mv.setViewName("inappropriate");
			return mv;
		}
	}
}
