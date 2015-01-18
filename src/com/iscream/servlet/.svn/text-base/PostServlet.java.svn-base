package com.iscream.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iscream.dao.PostDAO;
import com.iscream.po.Post;
import com.iscream.po.PostCondition;
import com.iscream.util.CommUtil;
import com.iscream.util.PagingUtil;

public class PostServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		String url = "/postServlet?action=querybycondition";
        if(action!=null){
		if (action.equals("add")) {
			url = doAdd(req, res);
		} else if (action.equals("getbyid")) {
			url = doGetById(req, res);
		} else if (action.equals("modify")) {
			url = doModify(req, res);
		} else if (action.equals("remove")) {
			url = doRemove(req, res);
		} else if (action.equals("querybycondition")) {
			url = doQueryByCondition(req, res);
		}
        }
		req.getRequestDispatcher(url).forward(req, res);
	}

	private String doQueryByCondition(HttpServletRequest req,HttpServletResponse res) 
	{
		
		String name = req.getParameter("name");
		String postid = req.getParameter("postid");
		String type = req.getParameter("type");
		String method=req.getParameter("method");
		String reqpage=req.getParameter("reqpage");
		PostCondition pc = req.getSession().getAttribute("postcondition") == null ? new PostCondition()
		: (PostCondition) req.getSession().getAttribute(
				"postcondition");
		  if(!CommUtil.isNotNULL(method)){
			pc.setName(CommUtil.isNotNULL(name)?name:null);
			pc.setPostid(CommUtil.isNotNULL(postid)?Integer.valueOf(postid) :null);
			pc.setType(CommUtil.isNotNULL(type)? Integer.valueOf(type) :null);
		  }
		  req.getSession().setAttribute("postcondition", pc);
		  int rowsperpage=10;
		  int reqPage=CommUtil.isNotNULL(reqpage)?Integer.parseInt(reqpage):1;
		  PagingUtil pu=req.getSession().getAttribute("postpagingutil")==null?new PagingUtil(rowsperpage):(PagingUtil)req.getSession().getAttribute("postpagingutil");
		  PostDAO pdao=new PostDAO();
		  int totalRows=pdao.getTotalRows(pc);
		  pu.gotoPage(reqPage, totalRows);
		  req.getSession().setAttribute("postpagingutil",pu);
			 pc.setFirstRow(pu.getFirstRow());
			 pc.setRowsPerPage(pu.getRowsPerPage());
			 List<Post> list = new ArrayList<Post>();
			  list =pdao.queryByCondition(pc);
			  if(list!=null){
		    req.getSession().setAttribute("postlist", list);
		    return "postlist.jsp";
	}
			 return "postservlet?action=querybycondition";
}
		

	private String doRemove(HttpServletRequest req, HttpServletResponse res)
	{
			String postid = req.getParameter("postid");
			PostDAO pdao=new PostDAO();
			if (!pdao.remove(Integer.valueOf(postid))) 
			{
				req.setAttribute("addposterror", "删除失败！");
				return "postservlet?action=querybycondition";
			}
			return "/postservlet?action=querybycondition";
	}
	
	
	private String doModify(HttpServletRequest req, HttpServletResponse res)
	{
	
		String postid = req.getParameter("postid");
		String name = req.getParameter("name");
		String type = req.getParameter("type");
		String establishment = req.getParameter("establishment");
		Post pro = new Post();
		pro.setPostid(CommUtil.isNotNULL(postid)? Integer.valueOf(postid):null);
		pro.setName(CommUtil.isNotNULL(name)?name:null);
		pro.setType(CommUtil.isNotNULL(type)?Integer.valueOf(type):null);
		pro.setEstablishment(CommUtil.isNotNULL(establishment)?Integer.valueOf(establishment):null);
		PostDAO pdao=new PostDAO();
		if (pdao.modify(pro)) {
			return "/postservlet?action=querybycondition";
		} else {
			req.setAttribute("addposterror", "修改失败");
			return "postservlet?action=querybycondition";
		}	

	}

	private String doGetById(HttpServletRequest req, HttpServletResponse res)
	{
			String postid = req.getParameter("postid");
			PostDAO pdao=new PostDAO();
			Post Post = pdao.queryById((Integer.valueOf(postid)));
			if(Post!=null)
			{
				req.setAttribute("post",Post);
				return "modifypost.jsp";
		    }else
		    {
		    	return "postservlet?action=querybycondition";
		    }
		
	}

	private String doAdd(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		String postid = req.getParameter("postid");
		String name = req.getParameter("name");
		String type = req.getParameter("type");
		String establishment = req.getParameter("establishment");
		Post pro = new Post();
		pro.setPostid(CommUtil.isNotNULL(postid)?Integer.valueOf(postid):null);
		pro.setName(CommUtil.isNotNULL(name)?name:null);
		pro.setType(CommUtil.isNotNULL(type)?Integer.valueOf(type):null);
		pro.setEstablishment(CommUtil.isNotNULL(establishment)?Integer.valueOf(establishment):null);
		PostDAO pdao=new PostDAO();
		if (pdao.add(pro)) {
			return "/postservlet?action=querybycondition";
		} else {
			req.setAttribute("addposterror", "添加失败");
			return "postservlet?action=querybycondition";
		}
	}

}
