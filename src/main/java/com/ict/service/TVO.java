package com.ict.service;

import org.springframework.web.multipart.MultipartFile;

public class TVO {
	private String t_idx, m_idx, content, file_name, hit, regdate;
	private MultipartFile[] f_name;

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

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public MultipartFile[] getF_name() {
		return f_name;
	}

	public void setF_name(MultipartFile[] f_name) {
		this.f_name = f_name;
	}

	
	
}
