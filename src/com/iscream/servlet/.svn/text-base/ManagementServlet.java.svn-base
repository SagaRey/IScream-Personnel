package com.iscream.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iscream.dao.ManagementDAO;
import com.iscream.po.Management;

public class ManagementServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		String url = "";
		if(action!=null){
		if (action.equals("login")) {
			url = doLogin(req, res);
		} else if (action.equals("logout")) {
			url = doLogout(req, res);
		}
		}
		res.sendRedirect(url);
	}

	public String doLogin(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String managername = req.getParameter("managername");
		String password = req.getParameter("password");
		Management management = new Management();
		management.setName(managername);
		management.setPassword(password);
		ManagementDAO mdao = new ManagementDAO();
		if (mdao.login(management) == true) {
			req.getSession().setAttribute("manager", managername);
			req.getSession().setMaxInactiveInterval(15 * 60);
		} else {
			req.setAttribute("loginerror", "帐号或密码错误!");
		}
		return "";
	}

	public String doLogout(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		if (req.getSession().getAttribute("manager") != null) {
			req.getSession().invalidate();
		}
		return "";
	}
}