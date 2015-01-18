package com.iscream.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	private String encoding = "UTF-8";
	
	public void destroy() {
		
//		System.out.println("filter===>destroy");
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
//		System.out.println("filter===>doFilter===>begin");
		arg0.setCharacterEncoding(encoding);
		arg2.doFilter(arg0, arg1);
		arg1.setCharacterEncoding(encoding);	
//		System.out.println("filter===>doFilter====>end");
	}

	public void init(FilterConfig arg0) throws ServletException {
//		System.out.println("filter===>init");
		encoding = arg0.getInitParameter("encoding");
	}

}
