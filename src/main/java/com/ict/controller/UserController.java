package com.ict.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
			if (r_mvo.getId().equals("admin")) {
				mv.setViewName("redirect:home");
			} else {
				mv.setViewName("redirect:/");
			}
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
	
	@RequestMapping("updEmail")
	@ResponseBody
	public String updateEmail(MVO mvo, HttpSession session) {
		int chk = dao.chkEmail(mvo);
		MVO r_mvo = (MVO)session.getAttribute("mvo");
		if(chk > 0) {
			return "duplicate";
		} else {
			int result = dao.updateEmail(mvo);
			if(result > 0) {
				r_mvo.setEmail(mvo.getEmail());
				session.setAttribute("mvo", r_mvo);
				return "1";
			} else {
				return "0";
			}
		}
	}
	
	@RequestMapping("updName")
	@ResponseBody
	public String updateName(MVO mvo, HttpSession session) {
		int chk = dao.chkName(mvo);
		MVO r_mvo = (MVO)session.getAttribute("mvo");
		if(chk > 0) {
			return "duplicate";
		} else {
			int result = dao.updateName(mvo);
			if(result > 0) {
				r_mvo.setName(mvo.getName());
				session.setAttribute("mvo", mvo);
				return "1";
			} else {
				return "0";
			}
		}
	}
	
	@RequestMapping("pwchk")
	@ResponseBody
	public String chkPw(MVO mvo, HttpSession session) {
		mvo.setId(((MVO)session.getAttribute("mvo")).getId());
		int chk = dao.chkPw(mvo);
		return String.valueOf(chk);
	}
	
	@RequestMapping("updPw")
	@ResponseBody
	public String updatePw(MVO mvo) {
		int result = dao.updatePw(mvo);
		return String.valueOf(result);
	}
}
