package com.iscream.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iscream.po.Post;
import com.iscream.po.PostCondition;
import com.iscream.util.DAOSupport;

public class PostDAO extends DAOSupport{

	public boolean add(Post post)
	{
		String sql = "insert into posts(postid,name,type,establishment) values(?,?,?,?)";
		Object[] params = new Object[] { post.getPostid(), post.getName(),
				post.getType(), post.getEstablishment()};
		int i = 0;
		try 
		{
			i = this.exeucteDML(sql, params);
		} catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		if (i > 0)
			return true;
	return false;
	}
		

	public boolean modify(Post post)
	{
			String sql = "";
			Object[] params = null;
			
				sql = "update posts set name = ?,type = ?,establishment = ? where postid = ?";
				params = new Object[] {  post.getName(),
						post.getType(), post.getEstablishment(),post.getPostid()};
			try {
				int i = this.exeucteDML(sql, params);
				if (i > 0)
					return true;
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return false;
     }
	
	
	public boolean remove(int postid)
	{
		String sql = "delete from posts where postid = ?";
		Object[] params = new Object[] { postid };
		try {
			int i = this.exeucteDML(sql, params);
			if (i > 0)
				return true;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return false;
	}
		
	 
	public Post queryById(int postid)
	{
		 String sql = "select postid,name,type,establishment from posts where postid =?";
		 try {
				List<Object[]> data = this.executeDQL(sql, new Object[] { postid });
				if (null != data) {
					Object[] tmp = data.get(0);
					Post post = new Post();
					int i = 0;
					post.setPostid(Integer.valueOf(tmp[i++].toString()));
					post.setName(tmp[i++].toString());
					post.setType(Integer.valueOf(tmp[i++].toString()));
					post.setEstablishment(tmp[i++]==null?null:Integer.valueOf(tmp[i-1].toString()));
				    return post;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
	 
	
	public List<Post> queryByCondition(PostCondition pc){
		StringBuffer sql = new StringBuffer("select postid,name,type,establishment from posts ");
		if(null != pc){
			String name = pc.getName()==null?"":pc.getName();
			sql.append(" where name like '%" + name + "%' ");
			if(pc.getPostid()!=null){ 
				sql.append(" and postid = "+ pc.getPostid());
				 
			}
			if(pc.getType()!=null){
				sql.append(" and type = " + pc.getType());
			}
			}
		sql.append(" limit " + pc.getFirstRow() + "," + pc.getRowsPerPage());
			List<Post> list = new ArrayList<Post>();
			List<Object[]> data=null;
			try {
				data = this.executeDQL(sql.toString(), null);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (null != data) {
				Post post = null;
				for (Object[] tmp : data) {
					post = new Post();
					int i = 0;
					post.setPostid(Integer.valueOf(tmp[i++].toString()));
					post.setName(tmp[i++].toString());
					post.setType(Integer.valueOf(tmp[i++].toString()));
					post.setEstablishment(tmp[i++]==null?null:Integer.valueOf(tmp[i-1].toString()));
					list.add(post);
				}
				return list;
			}
	 
			return null;
	}


	public int getTotalRows(PostCondition pc) {
		StringBuffer sql = new StringBuffer("select count(*) from posts");
		if(null != pc){
			String name = pc.getName()==null?"":pc.getName();
			sql.append(" where name like '%" + name + "%' ");
			if(pc.getPostid()!=null){ 
				sql.append(" and postid = "+ pc.getPostid());
			}
			if(pc.getType()!=null){
				sql.append(" and type = " + pc.getType());
			}
			}
		
		try {
			List<Object[]> list = this.executeDQL(sql.toString(), null);
			return Integer.parseInt(list.get(0)[0].toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		 
	}
	 
}
