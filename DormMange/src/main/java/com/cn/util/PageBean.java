package com.cn.util;

public class PageBean {
	private int begin;
	private int end;
	private int pageSize = 10;
	private int nowPage = 1;
	private int count;
	private int totalPage;

	public int getBegin() {
		this.begin = (this.getNowPage() - 1) * this.getPageSize();
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		this.end = this.getBegin() + this.getPageSize();
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotalPage() {
		this.totalPage = (this.getCount() - 1) / this.getPageSize() + 1;
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
