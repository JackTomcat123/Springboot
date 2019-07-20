package com.cn.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class BaseAction
{
	public HttpServletResponse getResp()
	{
		ServletActionContext.getResponse().setCharacterEncoding("utf-8");
		return ServletActionContext.getResponse();
		
	}
	public PrintWriter out()
	{
		try
		{
			return getResp().getWriter();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		return null;
	}
}
