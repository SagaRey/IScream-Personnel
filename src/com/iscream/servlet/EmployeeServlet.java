package com.iscream.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iscream.dao.EmployeeDAO;
import com.iscream.po.EmpCondition;
import com.iscream.po.Employee;
import com.iscream.po.EmployeeInfo;
import com.iscream.util.CommUtil;
import com.iscream.util.PagingUtil;

public class EmployeeServlet extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		String action = req.getParameter("action");
		String url = "employeeservlet?action=querybycondition";

		if (action.equals("add")) {
			url = doAdd(req, res);
		} else if (action.equals("querybyid")) {
			url = doQueryById(req, res);
		} else if (action.equals("modify")) {
			url = doModify(req, res);
		} else if (action.equals("remove")) {
			url = doRemove(req, res);
		} else if (action.equals("querybycondition")) {
			url = doQueryByCondition(req, res);
		}

		req.getRequestDispatcher(url).forward(req, res);
	}
	 
			
	public String doQueryByCondition(HttpServletRequest req,HttpServletResponse res) 
	{
		
		String name = req.getParameter("name");
		String empid = req.getParameter("empid");
		String depid = req.getParameter("depid");
		String postid = req.getParameter("postid");
		String startdate= req.getParameter("startdate");
		String enddate = req.getParameter("enddate");
		String type = req.getParameter("type");
		 String method = req.getParameter("method");
		 String reqpage = req.getParameter("reqpage");
		 EmpCondition ec= req.getSession().getAttribute("employeecondition") == null ? new EmpCondition():( EmpCondition) req.getSession().getAttribute ("employeecondition");
		 if(!CommUtil.isNotNULL(method))
		    {
			ec.setEmpid(CommUtil.isNotNULL(empid) ? Integer.valueOf(empid) :null);
			ec.setName(name);
			ec.setDepid(CommUtil.isNotNULL(depid) ? Integer.valueOf(depid) :null);
			ec.setPostid(CommUtil.isNotNULL(postid) ? Integer.valueOf(postid) :null);
			ec.setStartdate(CommUtil.isNotNULL(startdate)?CommUtil.stringToDate(startdate):null);
			ec.setEnddate(CommUtil.isNotNULL(enddate)?CommUtil.stringToDate(enddate):null);
			ec.setType(CommUtil.isNotNULL(type) ? Integer.valueOf(type) :null);
		    }
		EmployeeDAO edao=new EmployeeDAO();
		req.getSession().setAttribute("employeecondition", ec);
		int rowsPerPage = 10;
		 PagingUtil pu = req.getSession().getAttribute("employeePagingUtil") == null ? new PagingUtil (rowsPerPage) : (PagingUtil)req.getSession ().getAttribute("employeePagingUtil");
		 int totalRows = edao.getTotalRows(ec);
		 int reqPage = CommUtil.isNotNULL(reqpage) ?  Integer.parseInt(reqpage): 1;
		 pu.gotoPage(reqPage, totalRows);
		 req.getSession().setAttribute("employeePagingUtil", pu);
		 ec.setFirstRow(pu.getFirstRow());
		 ec.setRowsPerPage(pu.getRowsPerPage());
		List<EmployeeInfo> list=edao.queryByCondition(ec);
		req.getSession().setAttribute("employeeinfolist", list);
		return "employeelist.jsp";
	}
		

	public String doRemove(HttpServletRequest req, HttpServletResponse res)
	{       
			String empid = req.getParameter("empid");
			EmployeeDAO edao=new EmployeeDAO();
			if(empid!=null){
				if (!edao.remove(Integer.valueOf(empid))) 
				{
					req.setAttribute("removeemperror","删除失败！");
				}
			}
			return "employeeservlet?action=querybycondition";
	}
	
	
	public String doModify(HttpServletRequest req, HttpServletResponse res)
	{
	
		String empid = req.getParameter("empid");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String type= req.getParameter("type");
		String birthday = req.getParameter("birthday");
		String identity = req.getParameter("identity");
		String depid = req.getParameter("depid");
		String postid = req.getParameter("postid");
		String hiredate= req.getParameter("hiredate");
		String nativeplace = req.getParameter("nativeplace");//可以为空
		String phone = req.getParameter("phone");//可以为空
		String email = req.getParameter("email");//可以为空
		Employee emp = new Employee();
		emp.setEmpid(CommUtil.isNotNULL(empid) ? Integer.valueOf(empid) :null);
		emp.setName(name);
		emp.setSex(sex);
		emp.setType(CommUtil.isNotNULL(type) ? Integer.valueOf(type) :null);
		emp.setBirthday(CommUtil.isNotNULL(birthday)?CommUtil.stringToDate(birthday):null);
		emp.setIdentity(identity);
		emp.setDepid(CommUtil.isNotNULL(depid) ? Integer.valueOf(depid) :null);
		emp.setPostid(CommUtil.isNotNULL(postid) ? Integer.valueOf(postid) :null);
		emp.setHiredate(CommUtil.isNotNULL(hiredate)?CommUtil.stringToDate(hiredate):null);
		emp.setNativeplace(CommUtil.isNotNULL(nativeplace)?nativeplace:null);
		emp.setPhone(CommUtil.isNotNULL(phone)?phone:null);
		emp.setEmail(CommUtil.isNotNULL(email)?email:null);
		EmployeeDAO edao=new EmployeeDAO();
		if (edao.modify(emp)) {
			return "employeeservlet?action=querybycondition";
		}else{
			req.setAttribute("modifyemperror","修改失败！");
			return "employeeservlet?action=querybyid&empid=" + empid;
		}	
	}

	public String doQueryById(HttpServletRequest req, HttpServletResponse res)
	{
			String pid = req.getParameter("empid");
			EmployeeDAO edao=new EmployeeDAO();
			Employee emp = edao.queryById(Integer.valueOf(pid));
			if(emp!=null)
			{
				req.setAttribute("employee",emp);
				return "modifyemployee.jsp";
			}else
			{
				return "employeeservlet?action=querybycondition";
		    }
		
	}

	public String doAdd(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String type= req.getParameter("type");
		String birthday = req.getParameter("birthday");
		String identity = req.getParameter("identity");
		String depid = req.getParameter("depid");
		String postid = req.getParameter("postid");
		String hiredate= req.getParameter("hiredate");
		String nativeplace = req.getParameter("nativeplace");//可以为空
		String phone = req.getParameter("phone");//可以为空
		String email = req.getParameter("email");//可以为空
		Employee emp = new Employee();
		emp.setName(name);
		emp.setSex(sex);
		emp.setType(Integer.valueOf(type));
		emp.setBirthday(CommUtil.stringToDate(birthday)!=null?CommUtil.stringToDate(birthday):null);
		emp.setIdentity(identity);
		emp.setDepid(depid==null?null:Integer.valueOf(depid));
		emp.setPostid(postid==null?null:Integer.valueOf(postid));
		emp.setHiredate(CommUtil.stringToDate(hiredate)!=null?CommUtil.stringToDate(hiredate):null);
		emp.setNativeplace(CommUtil.isNotNULL(nativeplace)?nativeplace:null);
		emp.setPhone(CommUtil.isNotNULL(phone)?phone:null);
		emp.setEmail(CommUtil.isNotNULL(email)?email:null);
		EmployeeDAO edao=new EmployeeDAO();
		if (edao.add(emp)) {
			return "employeeservlet?action=querybycondition";
		}else
		{
			req.setAttribute("addemperror","增加失败！");
			return "employeeservlet?action=querybycondition";
		}
	}

}
