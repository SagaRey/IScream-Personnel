package com.iscream.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iscream.dao.MobilizePostDAO;
import com.iscream.po.MobPostCondition;
import com.iscream.po.MobilizePost;
import com.iscream.po.MobilizePostInfo;
import com.iscream.util.CommUtil;
import com.iscream.util.PagingUtil;

public class MobilizePostServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	 String action = req.getParameter("action");
	 String url="mobilizepostservlet?action=querybycondition";
     if(action!=null){
        if (action.equals("add")) {
        	url=doAdd(req,res);
		} else if (action.equals("querybycondition")) {
			url=doQuerybycondition(req,res);
		}
     }
     req.getRequestDispatcher(url).forward(req, res);
	}
	public String doAdd(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		 String empid=req.getParameter("empid");
		 String originalpostid=req.getParameter("originalpostid");
		 String currentpostid=req.getParameter("currentpostid");
		 String mobilizedate=req.getParameter("mobilizedate");
		 String type=req.getParameter("type");
		 MobilizePost mobilizepost=new MobilizePost();
		 mobilizepost.setEmpid(CommUtil.isNotNULL(empid)?Integer.valueOf(empid):null); 
		 mobilizepost.setOriginalpostid(CommUtil.isNotNULL(originalpostid)?Integer.valueOf(originalpostid):null); 
		 mobilizepost.setCurrentpostid(CommUtil.isNotNULL(currentpostid)?Integer.valueOf(currentpostid):null); 
		 mobilizepost.setMobilizedate(CommUtil.isNotNULL(mobilizedate)?CommUtil.stringToDate(mobilizedate):null); 
		 mobilizepost.setType(CommUtil.isNotNULL(originalpostid)?Integer.valueOf(type):null);  
		 MobilizePostDAO mdao= new MobilizePostDAO();
		 boolean ysno=mdao.add(mobilizepost);
		 if(ysno){
			 return "mobilizepostservlet?action=querybycondition";
		 }else{
			 req.setAttribute("addmobposterror","添加出错！ ！");
			 return "mobilizepostservlet?action=querybycondition";
		 }
	}
	public String doQuerybycondition(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		 String empname=req.getParameter("empname");
		 String currentpostid=req.getParameter("currentpostid");
		 String startdate=req.getParameter("startdate");
		 String enddate=req.getParameter("enddate");
		 String method = req.getParameter("method");
		 String reqpage = req.getParameter("reqpage");
		 MobPostCondition mobpostcondition= req.getSession().getAttribute("mobpostcondition") == null ? new   MobPostCondition():(  MobPostCondition) req.getSession().getAttribute ("mobpostcondition");
		 if(!CommUtil.isNotNULL(method))
		    {
		mobpostcondition.setEmpname(CommUtil.isNotNULL(empname)?empname:null);
		mobpostcondition.setCurrentpostid(CommUtil.isNotNULL(currentpostid)?Integer.valueOf(currentpostid):null);
		mobpostcondition.setStartdate(CommUtil.isNotNULL(startdate)? CommUtil.stringToDate(startdate):null);
		mobpostcondition.setEnddate(CommUtil.isNotNULL(enddate)?CommUtil.stringToDate(enddate):null);
		    }
		req.getSession().setAttribute("mobpostcondition", mobpostcondition);
		MobilizePostDAO mdao= new MobilizePostDAO();
		int rowsPerPage = 10;
		 PagingUtil pu = req.getSession().getAttribute("mobilizepostPagingUtil") == null ? new PagingUtil (rowsPerPage) : (PagingUtil)req.getSession ().getAttribute("mobilizepostPagingUtil");
		 int totalRows = mdao.getTotalRows(mobpostcondition);
		 int reqPage = CommUtil.isNotNULL(reqpage) ?  Integer.parseInt(reqpage): 1;
		 pu.gotoPage(reqPage, totalRows);
		 req.getSession().setAttribute("mobilizepostPagingUtil", pu);
		 mobpostcondition.setFirstRow(pu.getFirstRow());
		 mobpostcondition.setRowsPerPage(pu.getRowsPerPage());
		List<MobilizePostInfo> list=mdao.queryByCondition(mobpostcondition);
		if(list!=null){    
			req.getSession().setAttribute("mobilizepostinfolist", list);
			return "mobilizepostlist.jsp";
		}
		return "/index.jsp";
	}
}
     

 	 

