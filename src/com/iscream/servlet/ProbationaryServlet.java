package com.iscream.servlet;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iscream.dao.ProbationaryDAO;
import com.iscream.po.ProbCondition;
import com.iscream.po.Probationary;
import com.iscream.po.ProbationaryInfo;
import com.iscream.util.CommUtil;
import com.iscream.util.PagingUtil;

public class ProbationaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		 String action = req.getParameter("action");
	     String url = "";
	     if(action!=null){
	        if (action.equals("add")) {
				url = doAdd(req, res);
			} else if (action.equals("remove")) {
				url = doRemove(req, res);
			} else if (action.equals("querybyid")) {
				url = doQuerybyid(req, res);
	        } else if (action.equals("modify")) {
				url = doModify(req, res);
	        } else if (action.equals("querybycondition")) {
				url = doQuerybycondition(req, res);
	        }}
	     req.getRequestDispatcher(url).forward(req, res);
	     }
	
	public String doAdd(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		  String empid=req.getParameter("empid");
		  String startdate=req.getParameter("startdate");
		  String enddate=req.getParameter("enddate");
		  String status=req.getParameter("status");
		  Probationary probationary=new Probationary();
		  probationary.setEmpid(CommUtil.isNotNULL(empid)?Integer.valueOf(empid):null);
		  probationary.setStartdate(CommUtil.isNotNULL(startdate)?CommUtil.stringToDate(startdate):null);
		  probationary.setEnddate(CommUtil.isNotNULL(enddate)?CommUtil.stringToDate(enddate):null);
		  probationary.setStatus(CommUtil.isNotNULL(status)?Integer.valueOf(status):null);
		  ProbationaryDAO pdao= new ProbationaryDAO();
		  boolean ysno=pdao.add(probationary);
		  if(ysno){
			  return "probationaryservlet?action=querybycondition";
		  }else{
			  req.setAttribute("addproberror", "添加出错！！");
				return "probationaryservlet?action=querybycondition";
			  }
		}
					
	public String doRemove(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		     String probid=req.getParameter("probid");
		     ProbationaryDAO pdao= new ProbationaryDAO();
		     if(pdao.remove(Integer.valueOf(probid))){
		    	 return "probationaryservlet?action=querybycondition";
		     }else{
		    	 req.setAttribute("removeproberror", "未成功删除!!");
					return "probationaryservlet?action=querybycondition";
		     }
	}
    public String doQuerybyid(HttpServletRequest req, HttpServletResponse res)
					throws ServletException, IOException {
    	String probid=req.getParameter("probid");
    	ProbationaryDAO pdao= new ProbationaryDAO(); 
    	Probationary probationary=pdao.queryById(Integer.valueOf(probid));
    	if(probationary!=null){
    	 req.setAttribute("probationary",probationary);
		 return "modifyprobationary.jsp";
		}else{
			return "probationaryservlet?action=querybycondition";
		}
    }
    
    public String doModify(HttpServletRequest req, HttpServletResponse res)
							    throws ServletException, IOException {
    	 String id=req.getParameter("id");
    	 System.out.print("==="+id+"===");
		 String startdate=req.getParameter("startdate");
		 String enddate=req.getParameter("enddate");
		 String status=req.getParameter("status");
    	Probationary probationary =new Probationary();
    	probationary.setId(CommUtil.isNotNULL(id)?Integer.valueOf(id):null);
    	probationary.setStartdate(CommUtil.isNotNULL(startdate)?CommUtil.stringToDate(startdate):null);
    	probationary.setEnddate(CommUtil.isNotNULL(enddate)?CommUtil.stringToDate(enddate):null);
    	probationary.setStatus(CommUtil.isNotNULL(status)?Integer.valueOf(status):null);
    	ProbationaryDAO pdao= new ProbationaryDAO();
    	if(pdao.modify(probationary)){
    		return "probationaryservlet?action=querybycondition";
    	}else{
    		req.setAttribute("modifyproberror", "未成功修改！！");
			return "probationaryservlet?action=querybycondition";

    	}
    
    	}
	public String doQuerybycondition(HttpServletRequest req, HttpServletResponse res)
									throws ServletException, IOException {
		  String empname=req.getParameter("empname"); 
		  String depid=req.getParameter("depid");
		  String postid=req.getParameter("postid");
		  String status=req.getParameter("status");
		  String method = req.getParameter("method");
		  String reqpage = req.getParameter("reqpage");
		  ProbCondition probcondition= req.getSession().getAttribute("probcondition") == null ? new   ProbCondition():( ProbCondition) req.getSession().getAttribute ("probcondition");
		  if(!CommUtil.isNotNULL(method))
		    {
		  probcondition.setEmpname(CommUtil.isNotNULL(empname)?empname:null);
		  probcondition.setDepid(CommUtil.isNotNULL(depid)?Integer.valueOf(depid):null);
		  probcondition.setPostid(CommUtil.isNotNULL(postid)?Integer.valueOf(postid):null);
		  probcondition.setStatus(CommUtil.isNotNULL(status)?Integer.valueOf(status):null);
		    }
		  req.getSession().setAttribute("probcondition", probcondition);
		  ProbationaryDAO pdao= new ProbationaryDAO(); 
		  int rowsPerPage = 10;
		  PagingUtil pu = req.getSession().getAttribute("probationaryPagingUtil") == null ? new PagingUtil (rowsPerPage) : (PagingUtil)req.getSession ().getAttribute("probationaryPagingUtil");
		  int totalRows = pdao.getTotalRows(probcondition);
		  int reqPage = CommUtil.isNotNULL(reqpage) ?  Integer.parseInt(reqpage): 1;
		  pu.gotoPage(reqPage, totalRows);
		  req.getSession().setAttribute("probationaryPagingUtil", pu);
		  probcondition.setFirstRow(pu.getFirstRow());
		  probcondition.setRowsPerPage(pu.getRowsPerPage());
		  List<ProbationaryInfo> list = new ArrayList<ProbationaryInfo>();
		  list =pdao.queryByCondition(probcondition);
		  if(list!=null){
		  req.setAttribute("probationaryinfolist",list);
	    } 
		return "probationarylist.jsp";
	}
			
}
