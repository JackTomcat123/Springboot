package com.cn.zzy.util;

public class Page {

	private int nowPage = 1;   //当前页
	private int begin = 0;     //开始
	private int pageSize = 3;  //页大小
	private int count = 0;	   //总条数
	private int totalPage = 0; //总页数
	
	public int getNowPage()
	{
		return nowPage;
	}
	public void setNowPage(int nowPage)
	{
		this.nowPage = nowPage;
	}
	public int getBegin()
	{
		this.begin = (this.getNowPage() - 1) * this.getPageSize();
		
		return begin;
	}
	public void setBegin(int begin)
	{
		this.begin = begin;
	}
	public int getPageSize()
	{
		return pageSize;
	}
	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
	}
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
	public int getTotalPage()
	{
		this.totalPage = this.getCount() % this.getPageSize() == 0 ? 
				this.getCount() / this.getPageSize() : 
				this.getCount() / this.getPageSize() + 1;
		
		return totalPage;
	}
	public void setTotalPage(int totalPage)
	{
		this.totalPage = totalPage;
	}
	
}
