package com.iscream.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iscream.dao.DimissionDAO;
import com.iscream.po.Dimission;
import com.iscream.po.DimissionCondition;
import com.iscream.po.DimissionInfo;
import com.iscream.util.CommUtil;
import com.iscream.util.PagingUtil;

public class DimissionServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private DimissionDAO pdao;

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		String url = "dimissionservlet?action=querybycondition";
       if(action!=null){
		if (action.equals("add")) {
			url = doAdd(req, res);
		} else if (action.equals("querybycondition")) {
			url = doQueryByCondition(req, res);
		}
       }
		req.getRequestDispatcher(url).forward(req, res);
	}

	private String doQueryByCondition(HttpServletRequest req,HttpServletResponse res)
	{
		String startdate = req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		String type = req.getParameter("type");
		String method = req.getParameter("method");
		String reqpage = req.getParameter("reqpage");
		DimissionCondition pc= req.getSession().getAttribute("dimissionCondition") == null ? new DimissionCondition():( DimissionCondition) req.getSession().getAttribute ("dimissionCondition");
		if(!CommUtil.isNotNULL(method))
		{
		pc.setStartdate(CommUtil.isNotNULL(startdate)? CommUtil.stringToDate(startdate):null);
		pc.setEnddate(CommUtil.isNotNULL(enddate)? CommUtil.stringToDate(enddate):null );//类型转换
		pc.setType(CommUtil.isNotNULL(type) ? Integer.valueOf(type):null);
		}
		req.getSession().setAttribute("dimissionCondition", pc);
		 int rowsPerPage = 10;
		 PagingUtil pu = req.getSession().getAttribute("dimissionPagingUtil") == null ? new PagingUtil (rowsPerPage) : (PagingUtil)req.getSession ().getAttribute("dimissionPagingUtil");
		 DimissionDAO pdao=new DimissionDAO();
		 int totalRows = pdao.getTotalRows(pc);
		 int reqPage = CommUtil.isNotNULL(reqpage) ?  Integer.parseInt(reqpage): 1;
		 pu.gotoPage(reqPage, totalRows);
		 req.getSession().setAttribute("dimissionPagingUtil", pu);
		 pc.setFirstRow(pu.getFirstRow());
		 pc.setRowsPerPage(pu.getRowsPerPage());
		List<DimissionInfo> list = pdao.queryByCondition(pc);
		req.getSession().setAttribute("dimissioninfolist",list);
     	return "dimissionlist.jsp";
	}

	private String doAdd(HttpServletRequest req, HttpServletResponse res) 
	{

		String empid = req.getParameter("empid");
		String dimissiondate= req.getParameter("dimissiondate");
		String type= req.getParameter("type");
		String istalent = req.getParameter("istalent");
		
		Dimission tal = new Dimission();
		tal.setEmpid(CommUtil.isNotNULL(empid+null)?Integer.valueOf(empid):null);
		tal.setDimissiondate(CommUtil.isNotNULL(dimissiondate)?CommUtil.stringToDate(dimissiondate):null);
		tal.setType(CommUtil.isNotNULL(type+null)?Integer.valueOf(type):null);
		if(istalent.equals("true")){
		   tal.setIstalent(true);
		}else{
			tal.setIstalent(false);
		}
		if (pdao.add(tal))
		{
			return "dimissionservlet?action=querybycondition";
		}else
		{	       req.setAttribute("adddimissionerror","增加失败！");
            		return "dimissionservlet?action=querybycondition";
		}
     }
	
	public void init() throws ServletException {
		pdao = new DimissionDAO();
	}

}


