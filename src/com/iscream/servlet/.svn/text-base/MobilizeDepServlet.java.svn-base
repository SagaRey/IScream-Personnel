package com.iscream.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iscream.dao.MobilizeDepDAO;
import com.iscream.po.MobDepCondition;
import com.iscream.po.MobilizeDep;
import com.iscream.po.MobilizeDepInfo;
import com.iscream.util.CommUtil;
import com.iscream.util.PagingUtil;

public class MobilizeDepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void  service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	 String action = req.getParameter("action");
	 String url="mobilizedepservlet?action=querybycondition";
     if(action!=null){
        if (action.equals("add")) {
        	url=doAdd(req,res);
		} else if (action.equals("querybycondition")) {
			url=doQuerybycondition(req,res);
		} 
			 
        req.getRequestDispatcher(url).forward(req, res);
     }
        }
	public String doAdd(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		 String empid=req.getParameter("empid");
		 String originaldepid=req.getParameter("originaldepid");
		 String currentdepid=req.getParameter("currentdepid");
		 String mobilizedate=req.getParameter("mobilizedate");
		 String type=req.getParameter("type");
		 MobilizeDep mobilizedep=new MobilizeDep();
		 mobilizedep.setEmpid(CommUtil.isNotNULL(empid)?Integer.valueOf(empid):null); 
		 mobilizedep.setOriginaldepid(CommUtil.isNotNULL(originaldepid)?Integer.valueOf(originaldepid):null); 
		 mobilizedep.setCurrentdepid(CommUtil.isNotNULL(currentdepid)?Integer.valueOf(currentdepid):null); 
		 mobilizedep.setMobilizedate(CommUtil.isNotNULL(mobilizedate)?CommUtil.stringToDate(mobilizedate):null); 
		 mobilizedep.setType(CommUtil.isNotNULL(type)?Integer.valueOf(type):null);  
		 MobilizeDepDAO mdao=new MobilizeDepDAO();
		 if(mdao.add(mobilizedep)){
			 return "mobilizedepservlet?action=querybycondition";
		 }else{
				req.setAttribute("addmobdeperror","添加失败！！");
				return "mobilizedepservlet?action=querybycondition";
		 }
}
	
	public String doQuerybycondition(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		 String empname=req.getParameter("empname");
		 String currentdepid=req.getParameter("currentdepid");
		 String startdate=req.getParameter("startdate");
		 String enddate=req.getParameter("enddate");
		 String method = req.getParameter("method");
		 String reqpage = req.getParameter("reqpage");
		 MobDepCondition mobdepcondition= req.getSession().getAttribute("mobdepcondition") == null ? new   MobDepCondition():(  MobDepCondition) req.getSession().getAttribute ("mobdepcondition");
		 if(!CommUtil.isNotNULL(method))
		    {
		    mobdepcondition.setEmpname(CommUtil.isNotNULL(empname)?empname:null);
			mobdepcondition.setCurrentdepid(CommUtil.isNotNULL(currentdepid)?Integer.valueOf(currentdepid):null);
  			mobdepcondition.setStartdate(CommUtil.stringToDate(startdate)!=null?CommUtil.stringToDate(startdate):null);
			mobdepcondition.setEnddate(CommUtil.stringToDate(enddate)!=null?CommUtil.stringToDate(enddate):null);
		    }
		 req.getSession().setAttribute("mobdepcondition", mobdepcondition);
			MobilizeDepDAO mdao=new MobilizeDepDAO();
			int rowsPerPage = 10;
			 PagingUtil pu = req.getSession().getAttribute("mobilizedepPagingUtil") == null ? new PagingUtil (rowsPerPage) : (PagingUtil)req.getSession ().getAttribute("mobilizedepPagingUtil");
			 int totalRows = mdao.getTotalRows(mobdepcondition);
			 int reqPage = CommUtil.isNotNULL(reqpage) ?  Integer.parseInt(reqpage): 1;
			 pu.gotoPage(reqPage, totalRows);
			 req.getSession().setAttribute("mobilizedepPagingUtil", pu);
			 mobdepcondition.setFirstRow(pu.getFirstRow());
			 mobdepcondition.setRowsPerPage(pu.getRowsPerPage());
			List<MobilizeDepInfo> list=mdao.queryByCondition(mobdepcondition);
			if(list!=null){
				req.getSession().setAttribute("mobilizedepinfolist",list);
				return "mobilizedeplist.jsp";
			}
 			return "/index.jsp";	

	}
}