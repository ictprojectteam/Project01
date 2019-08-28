package com.ict.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ict.service.DAO;
import com.ict.service.MVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private DAO dao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (((MVO)request.getSession().getAttribute("mvo")) == null) {
			response.sendRedirect("inappropriate");
			return false;
		}
		if (dao.chkAdmin((MVO)request.getSession().getAttribute("mvo")) < 1) {
			response.sendRedirect("inappropriate");
			return false;
		}
		return true;
	}
}
