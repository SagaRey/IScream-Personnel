package com.iscream.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeintoExcelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		String url="";
		if (action != null) 
		{
			if (action.equals("emp")) 
			{
				url = doRenshi(req, res);
			} else if (action.equals("dimission"))
			{
				url = doLizhi(req, res);
			} else if (action.equals("mobdep")) 
			{
				url = doBumendiaozhuan(req, res);
			} else if (action.equals("mobpost")) 
			{
				url = doGangweidiaozhuan(req, res);
			}else if (action.equals("dep")) 
			{
				url = doBumen(req, res);
			}else if (action.equals("post")) 
			{
				url = doGangwei(req, res);
			}
			
		}
		req.getRequestDispatcher(url).forward(req, res);
	
}
	private String doGangwei(HttpServletRequest req, HttpServletResponse res) {
		return "report/post.jsp";
	}
	private String doBumen(HttpServletRequest req, HttpServletResponse res) {
		return "report/depart.jsp";
	}
	private String doGangweidiaozhuan(HttpServletRequest req,
			HttpServletResponse res) {
		return "report/mobpst.jsp";
	}
	private String doBumendiaozhuan(HttpServletRequest req,
			HttpServletResponse res) {
		return "report/mobdep.jsp";
	}
	private String doLizhi(HttpServletRequest req, HttpServletResponse res) {
		return "report/dimi.jsp";
	}
	private String doRenshi(HttpServletRequest req, HttpServletResponse res) {
		return "report/emp.jsp";
	}
}
