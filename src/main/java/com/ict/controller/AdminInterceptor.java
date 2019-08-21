package com.ict.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ict.service.MVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (((MVO)request.getSession().getAttribute("mvo")) == null) {
			response.sendRedirect("inappropriate");
			return false;
		}
		if (!((MVO)request.getSession().getAttribute("mvo")).getId().equals("admin")) {
			response.sendRedirect("inappropriate");
			return false;
		}
		return true;
	}
}
