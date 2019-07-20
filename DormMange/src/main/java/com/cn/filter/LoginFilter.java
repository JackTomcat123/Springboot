package com.cn.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		String uri=req.getRequestURI();
		if(uri.endsWith("login") || uri.endsWith("logn.jsp")) {
			
			chain.doFilter(request, response);
			return;
		}
		if(req.getSession().getAttribute("ENTITY") == null) {
			req.getSession().setAttribute("msg", "ÇëÏÈµÇÂ¼£¡");
			req.getRequestDispatcher("/login.jsp").forward(request, response);
			
			return;
		}
		chain.doFilter(request, response);
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
