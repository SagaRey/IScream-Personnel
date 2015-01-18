package com.iscream.servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
import com.iscream.dao.DepartmentDAO;
import com.iscream.po.DepCondition;
import com.iscream.po.Department;
import com.iscream.po.DepartmentInfo;
import com.iscream.util.CommUtil;
import com.iscream.util.PagingUtil;
public class DepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		String url = "departmentservlet?action=querybycondition";
		if (action != null) {
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
			}
		}
		req.getRequestDispatcher(url).forward(req, res);
	}
	public String doAdd(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
		
		 String name=req.getParameter("name");//不为空
		 String type=req.getParameter("type");//不为空
		 String parentdepid=req.getParameter("parentdepid"); //可以为空
		 String phone=req.getParameter("phone");//可以为空
		 String established=req.getParameter("established");//不为空
		 Department department=new Department();
		 department.setName(CommUtil.isNotNULL(name)?name:null);
		 department.setType(CommUtil.isNotNULL(type)?Integer.valueOf(type):1);
		 department.setParentdepid(CommUtil.isNotNULL(parentdepid)?Integer.valueOf(parentdepid):null);
		 department.setPhone(CommUtil.isNotNULL(phone)? phone:null);
		 department.setEstablished(CommUtil.isNotNULL(established)?CommUtil.stringToDate(established):null);
		 DepartmentDAO ddao=new DepartmentDAO();
		 if(ddao.add(department)){
			 return "departmentservlet?action=querybycondition";
		 }else{
			 req.setAttribute("adddeperror","部门添加失败！");
				return "departmentservlet?action=querybycondition";
		 }
	 }
	 public String doRemove(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
		        String depid=req.getParameter("depid");
		        DepartmentDAO ddao=new DepartmentDAO();
		        boolean ysno=ddao.remove(Integer.valueOf(depid));
		        if(ysno){
		        	return "departmentservlet?action=querybycondition";
		        }else{
					req.setAttribute("removedeperror","删除部门失败！！");
					return "departmentservlet?action=querybycondition";
					}
	 }
	 public String doModify(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
		 String depid=req.getParameter("depid");
		 String name=req.getParameter("name");
		 String type=req.getParameter("type");
		 String parentdepid=req.getParameter("parentdepid");//可以为空
		 String phone=req.getParameter("phone");//可以为空
		 String established=req.getParameter("established");
		 Department department=new Department();
		 department.setDepid(CommUtil.isNotNULL(depid)?Integer.valueOf(depid):null);
		 department.setName(CommUtil.isNotNULL(name)?name:null);
		 department.setType(CommUtil.isNotNULL(type)?Integer.valueOf(type):null);
		 department.setParentdepid(CommUtil.isNotNULL(parentdepid)?Integer.valueOf(parentdepid):null);
		 department.setPhone(CommUtil.isNotNULL(phone)?phone:null);
		 department.setEstablished(CommUtil.isNotNULL(established)?CommUtil.stringToDate(established):null);
		 DepartmentDAO ddao=new DepartmentDAO();
		 if(ddao.modify(department)){
			 return "departmentservlet?action=querybycondition";
		 }else{
				req.setAttribute("modifydeperror","修改失败！！");
				return "departmentservlet?action=querybycondition";
		 }	 
	  }
	 public String doQuerybyid(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
		  String depid=req.getParameter("depid");
		  DepartmentDAO ddao=new DepartmentDAO();
		  Department department=ddao.queryById(Integer.valueOf(depid));
		  if(department!=null){
				req.setAttribute("department",department);
				return "modifydepartment.jsp"; 
		  }else{
					return "departmentservlet?action=querybycondition";
			   }
		 
	 }
	 public String doQuerybycondition(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
		 String method = req.getParameter("method");
		 String reqpage = req.getParameter("reqpage");
		 String depid=req.getParameter("depid");
		 String name=req.getParameter("name");
		 String type=req.getParameter("type");
		 DepCondition depcondition= req.getSession().getAttribute("depcondition") == null ? new  DepCondition():( DepCondition) req.getSession().getAttribute
		         ("depcondition");
		 if(!CommUtil.isNotNULL(method))
		 {
		 depcondition.setDepid(CommUtil.isNotNULL(depid)?Integer.valueOf(depid):null);
		 depcondition.setName(CommUtil.isNotNULL(name)?name:null);
		 depcondition.setType(CommUtil.isNotNULL(type)?Integer.valueOf(type):null);
		 }
		 req.getSession().setAttribute("depcondition", depcondition);
		 int rowsPerPage = 10;
		 PagingUtil pu = req.getSession().getAttribute("DepartmentPagingUtil") == null ? new PagingUtil (rowsPerPage) : (PagingUtil)req.getSession ().getAttribute("DepartmentPagingUtil");
		 DepartmentDAO ddao=new DepartmentDAO();
		 int totalRows = ddao.getTotalRows(depcondition);
		 int reqPage = CommUtil.isNotNULL(reqpage) ?  Integer.parseInt(reqpage): 1;
		 pu.gotoPage(reqPage, totalRows);
		 req.getSession().setAttribute("DepartmentPagingUtil", pu);
		 depcondition.setFirstRow(pu.getFirstRow());
		 depcondition.setRowsPerPage(pu.getRowsPerPage());
		
		 List<DepartmentInfo> list=ddao.queryByConditon(depcondition);
		 if(list!=null){
			req.getSession().setAttribute("departmentinfolist", list);
			return "departmentlist.jsp";
			}
			return "departmentservlet?action=querybycondition";
	 }
		 
}

