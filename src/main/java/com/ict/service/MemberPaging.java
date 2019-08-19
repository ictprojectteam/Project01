package com.ict.service;

public class MemberPaging {
	
	private int nowPage = 1 ;
	private int nowBlock = 1 ;
	private int totalRecord = 0 ;
	private int numPerPage = 16 ;
	private int pagePerBlock = 10 ;
	private int totalPage = 0 ;
	private int totalBlock = 0 ;
	private int begin = 0 ;
	private int end = 0 ;
	private int beginBlock = 0 ;
	private int endBlock = 0 ;
	private int count;
	
	public MemberPaging(int count, String cPage) {
		totalRecord = count;
		if (totalRecord <= numPerPage) {
			totalPage = 1;
		} else {
			totalPage = totalRecord / numPerPage;
			if (totalRecord % numPerPage != 0) {
				totalPage += 1;
			}
		}
		
		if (cPage == null || cPage.equals("")) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(cPage);
		}
		
		begin = (nowPage - 1) * numPerPage + 1;
		end = begin - 1 + numPerPage;
		
		beginBlock = (int)((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		endBlock = beginBlock + pagePerBlock - 1;
		
		if (endBlock > totalPage) endBlock = totalPage;
	}
	
	public MemberPaging(int numPerPage, int count, String cPage) {
		totalRecord = count;
		if (totalRecord <= numPerPage) {
			totalPage = 1;
		} else {
			totalPage = totalRecord / numPerPage;
			if (totalRecord % numPerPage != 0) {
				totalPage += 1;
			}
		}
		
		if (cPage == null || cPage.equals("")) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(cPage);
		}
		
		begin = (nowPage - 1) * numPerPage + 1;
		end = begin - 1 + numPerPage;
		
		beginBlock = (int)((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		endBlock = beginBlock + pagePerBlock - 1;
		
		if (endBlock > totalPage) endBlock = totalPage;
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