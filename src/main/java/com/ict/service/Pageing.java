package com.ict.service;

public class Pageing {
	private int nowPage=1;	// 현재페이지
	private int nowBlock=1;	// 현재 블록
	private int totalRecord=0;	// 총 게시물의 수(원 글의 수)
	private int numPerPage=5;	// 한 페이지에 게시되는 원 글의 수
	private int pagePerBlock=2;	// 블록당 표현 되는 페이지의 수
	private int totalPage=0;	// 전체 페이지의 수
	private int totalBlock=0;	// 전체 블록의 수
	private int begin=0;	// 시작번호
	private int end=0;	// 끝번호
	private int beginBlock=0;	// 시작블록
	private int endBlock=0;	// 끝블록
	private int count;
	
	
	public Pageing() {
	}
	public Pageing(int count2, String cPage) {
		return;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBeginBlock() {
		return beginBlock;
	}
	public void setBeginBlock(int beginBlock) {
		this.beginBlock = beginBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}