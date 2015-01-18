package com.iscream.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.iscream.po.Talent;
import com.iscream.po.TalentCondition;
import com.iscream.util.CommUtil;
import com.iscream.util.DAOSupport;

public class TalentDAO extends DAOSupport {
	public boolean add(Talent tal){
		String sql="insert into talents (name,sex,birthday,identity,nativeplace,phone,email) values(?,?,?,?,?,?,?)";
		try {
			int result = this.exeucteDML(sql, new Object[] {tal.getName(),tal.getSex(),tal.getBirthday(),tal.getIdentity(),tal.getNativeplace(),tal.getPhone(),tal.getEmail()});
			if(result>0){
				return true;
			}
			
			 
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}

	public List<Talent> queryByCondition(TalentCondition tc){
		StringBuffer sql = new StringBuffer("select id,name,sex,birthday,identity,nativeplace,phone,email from talents ");
    	if(null != tc){
			sql.append(" where name like '%" + (tc.getName()==null?"":tc.getName()) + "%' ");
			if(tc.getIdentity()!=null){
			 sql.append(" and identity = " + tc.getIdentity());
			}
			sql.append(" limit "+tc.getFirstRow()+","+tc.getRowsPerPage());
		List<Talent> list = new ArrayList<Talent>();
		try {
			List<Object[]> data = this.executeDQL(sql.toString(), null);
			if (null != data) {
				Talent t = null;
				for (Object[] tmp : data) {
				    t = new Talent();
					int i = 0;
					t.setId(Integer.parseInt(tmp[i++].toString()));
					t.setName(tmp[i++].toString());
					t.setSex(tmp[i++].toString());
					t.setBirthday(CommUtil.stringToDate(tmp[i++].toString()));
					t.setIdentity(tmp[i++].toString());
					t.setNativeplace(tmp[i++]!=null?tmp[i-1].toString():null);
					t.setPhone(tmp[i++]!=null?tmp[i-1].toString():null);
					t.setEmail(tmp[i++]!=null?tmp[i-1].toString():null);
				    list.add(t);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
    	return null;
	}

	public boolean remove(int id) {
		 String sql="delete from talents where id=?";
		 try {
			int result=this.exeucteDML(sql, new Object[]{id});
			if(result>0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public int getTotalRows(TalentCondition tc) {
		StringBuffer sql = new StringBuffer("select count(*) from talents ");
    	if(null != tc){
			sql.append(" where name like '%" + (tc.getName()==null?"":tc.getName()) + "%' ");
			if(tc.getIdentity()!=null){
			 sql.append(" and identity = " + tc.getIdentity());
			}
			 
			try {
				List<Object[]> list = this.executeDQL(sql.toString(), null);
				return Integer.parseInt(list.get(0)[0].toString());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
    	}
    	return 0;
	 
	}
}
