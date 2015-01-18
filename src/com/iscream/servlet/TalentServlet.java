package com.iscream.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iscream.dao.TalentDAO;
import com.iscream.po.Talent;
 
import com.iscream.po.TalentCondition;
import com.iscream.util.CommUtil;
import com.iscream.util.PagingUtil;

public class TalentServlet extends HttpServlet 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		String url = "/talentservlet?action=querybycondition";
		if (action.equals("add")) {
			url = doAdd(req, res);
		} else if (action.equals("querybycondition")) {
			url = doQueryByCondition(req, res);
		}else if(action.equals("remove")){
			url=doRemove(req,res);
		}
        req.getRequestDispatcher(url).forward(req, res);
	}

	private String doRemove(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		int id=CommUtil.isNotNULL(req.getParameter("id"))?Integer.parseInt(req.getParameter("id")):null;
		TalentDAO tdao=new TalentDAO();
		if(tdao.remove(id)){
			return "/talentservlet?action=querybycondition";
		}else{
		    req.setAttribute("removeerror", "删除未成功！");
		    return "/talentlist.jsp";
		}
		
	}

	public String doQueryByCondition(HttpServletRequest req,HttpServletResponse res)
	{    
		String name = req.getParameter("name");
		String identity = req.getParameter("identity");
		String method=req.getParameter("method");
		String reqpage=req.getParameter("reqpage");
		TalentCondition tc = req.getSession().getAttribute("talentcondition")==null?new TalentCondition():(TalentCondition)req.getSession().getAttribute("talentcondition"); 
		if(!CommUtil.isNotNULL(method)){
		tc.setName(CommUtil.isNotNULL(name)? name:null);
		tc.setIdentity(CommUtil.isNotNULL(identity) ? identity :null);
		}
		req.getSession().setAttribute("talentcondition", tc);
		int rowsPerPage=10;
		int reqPage=CommUtil.isNotNULL(reqpage)?Integer.parseInt(reqpage):1;
		PagingUtil pu=req.getSession().getAttribute("talentpagingutil")==null?new PagingUtil(rowsPerPage):(PagingUtil)req.getSession().getAttribute("talentpagingutil");
		TalentDAO tdao=new TalentDAO();
		int totalRows=tdao.getTotalRows(tc);
		pu.gotoPage(reqPage, totalRows);
        req.getSession().setAttribute("talentpagingutil", pu);
        tc.setFirstRow(pu.getFirstRow());
        tc.setRowsPerPage(pu.getRowsPerPage());
		List<Talent> list=tdao.queryByCondition(tc);
		req.setAttribute("talentlist", list);
		return "/talentlist.jsp";
	}

	public String doAdd(HttpServletRequest req, HttpServletResponse res) 
	{

		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String birthday = req.getParameter("birthday");
		String identity = req.getParameter("identity");
		String nativeplace = req.getParameter("nativeplace");//可以为空
		String phone= req.getParameter("phone");//可以为空
		String email= req.getParameter("email");//可以为空
		Talent tal = new Talent();
		tal.setName(name);
		tal.setSex(sex);
		tal.setBirthday(CommUtil.stringToDate(birthday));
		tal.setIdentity(identity);
		tal.setNativeplace(CommUtil.isNotNULL(nativeplace)?nativeplace:null);
		tal.setPhone(CommUtil.isNotNULL(phone)?phone:null);
		tal.setEmail(CommUtil.isNotNULL(email)?email:null);
		TalentDAO tdao=new TalentDAO();
		if (tdao.add(tal))
		{
			return "/talentservlet?action=querybycondition";
		}else
		{
			req.setAttribute("addtalerror","增加失败！");
			return "/talentservlet?action=querybycondition";
		}
     }

}

     
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

