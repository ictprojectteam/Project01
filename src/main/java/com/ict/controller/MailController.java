package com.ict.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.MVO;
import com.ict.service.MailService;

@Controller
public class MailController {
	@Autowired
	private DAO dao;
	@Autowired
	private MailService mailService;
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	@RequestMapping("find")
	public ModelAndView getFind() {
		return new ModelAndView("find");
	}
	
	@RequestMapping("send_mail")
	public ModelAndView sendMail(HttpServletRequest request, HttpServletResponse response, @RequestParam String email) {
		ModelAndView mv = new ModelAndView("redirect: find");
		MVO mvo = dao.findPw(email);
		String msg;
		if(email.equals(mvo.getEmail())) {
			int ran = new Random().nextInt(10000) + 1000;
            String pw = String.valueOf(ran);
            mvo.setPw(pw);
            dao.pwUpdate(mvo);
            String subject = "임시 비밀번호 발급 안내입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + pw + " 입니다.");
            msg = sb.toString();
            System.out.println(msg);
            mailService.send(subject, msg, "ogggrgrig@gmail.com", email);
            
		}else {
			
			return mv;
		}
		return mv;
	}
}
























