package com.ict.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class TVO {
	private String t_idx, m_idx, name, content, file_name, heart, regdate, co_count;
	private String prf_img;
	private MultipartFile[] f_name;
	private ArrayList<String> f_arr = new ArrayList<String>();

	public String getT_idx() {
		return t_idx;
	}

	public void setT_idx(String t_idx) {
		this.t_idx = t_idx;
	}

	public String getM_idx() {
		return m_idx;
	}

	public void setM_idx(String m_idx) {
		this.m_idx = m_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getHeart() {
		return heart;
	}

	public void setHeart(String heart) {
		this.heart = heart;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getCo_count() {
		return co_count;
	}

	public void setCo_count(String co_count) {
		this.co_count = co_count;
	}

	public MultipartFile[] getF_name() {
		return f_name;
	}

	public void setF_name(MultipartFile[] f_name) {
		this.f_name = f_name;
	}

	public ArrayList<String> getF_arr() {
		return f_arr;
	}

	public void setF_arr(ArrayList<String> f_arr) {
		this.f_arr = f_arr;
	}

	public String getPrf_img() {
		return prf_img;
	}

	public void setPrf_img(String prf_img) {
		this.prf_img = prf_img;
	}
	
	
	
	
	
	
}