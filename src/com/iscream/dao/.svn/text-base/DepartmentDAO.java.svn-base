package com.iscream.dao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iscream.po.DepCondition;
import com.iscream.po.Department;
import com.iscream.po.DepartmentInfo;
import com.iscream.util.CommUtil;
import com.iscream.util.DAOSupport;

public class DepartmentDAO extends DAOSupport {
	public boolean add(Department dep){
		String sql="insert into departments(name,parentdepid,type,phone,established) values(?,?,?,?,?)";
		try {
			int result = this.exeucteDML(sql, new Object[] {dep.getName(),dep.getParentdepid(),dep.getType(),dep.getPhone(),dep.getEstablished()});
		System.out.print(sql);
			if(result>0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean modify(Department dep){
		String sql = "update departments set name = ?,type = ?,parentdepid = ?, phone = ?,established = ? where depid = ?";
		try {
			int result=this.exeucteDML(sql,new Object[] {dep.getName(),dep.getType(),dep.getParentdepid(),dep.getPhone(),dep.getEstablished(),dep.getDepid()});
			if(result>0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean remove(int depid){
		String sql = "delete from departments where depid = ?";
		try {
			int result=this.exeucteDML(sql, new Object[]{depid});
			if(result>0){
				return true;
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false; 
	}
	
	public Department queryById(int depid){
		String sql="select depid,name,type,parentdepid,phone,established from departments where depid=?";
	    try {
			List<Object[]> data = this.executeDQL(sql, new Object[] {depid});
			if (null != data && !data.isEmpty()) {
				Object[] tmp = data.get(0);
				Department department = new Department();
				int i = 0;
				department.setDepid(Integer.valueOf(tmp[i++].toString()));
				department.setName(tmp[i++].toString());
				department.setType(Integer.valueOf(tmp[i++].toString()));
				department.setParentdepid(tmp[i++]==null?null:Integer.valueOf(tmp[i-1].toString()));
				department.setPhone(tmp[i++]==null? null:tmp[i-1].toString());
				department.setEstablished(CommUtil.stringToDate(tmp[i++].toString()));
			    return department;
				}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public List<DepartmentInfo> queryByConditon(DepCondition dc){
		StringBuffer sql = new StringBuffer("select depid,name,parentdepid,parentdepname,type,phone,established from departmentinfo ");
    	if(null != dc)
    	{
    		String name = dc.getName()==null?"":dc.getName();
			sql.append(" where name like '%" + name + "%' ");
			if(dc.getDepid()!=null)
			{
			 sql.append(" and depid =" + dc.getDepid());
			}
			if(dc.getType()!=null)
			{ 
				sql.append(" and type = "+ dc.getType());
			}
    	}
		sql.append(" limit " + dc.getFirstRow() + "," + dc.getRowsPerPage());
		System.out.print((sql.toString()));
		List<DepartmentInfo> list = new ArrayList<DepartmentInfo>();
		try {
			List<Object[]> data = this.executeDQL(sql.toString(),null);
			if (null != data) {
				DepartmentInfo  dm = null;
				for (Object[] tmp : data) {
					dm = new DepartmentInfo();
					int i = 0;
					dm.setDepid(Integer.valueOf(tmp[i++].toString()));
					dm.setName(tmp[i++].toString());
					dm.setParentdepid(tmp[i++]==null?null:Integer.valueOf(tmp[i-1].toString()));
					dm.setParentdepname(tmp[i++]==null?null:tmp[i-1].toString());
					dm.setType(Integer.valueOf(tmp[i++].toString()));
					dm.setPhone (tmp[i++]==null? null:tmp[i-1].toString()); 
					dm.setEstablished(CommUtil.stringToDate(tmp[i++].toString()));//日期转换
					list.add(dm);
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
   }

	public int getTotalRows(DepCondition depcondition) 
	{
		StringBuffer sql = new StringBuffer("select count(*) from departmentinfo ");
    	if(null != depcondition)
    	{
    		String name = depcondition.getName()==null?"":depcondition.getName();
			sql.append(" where name like '%" + name + "%' ");
			if(depcondition.getDepid()!=null)
			{
			 sql.append(" and depid =" + depcondition.getDepid());
			}
			if(depcondition.getType()!=null)
			{ 
				sql.append(" and type = "+ depcondition.getType());
			}
    	}
		System.out.println(sql.toString());
		
		try 
		{
			List<Object[]> list = this.executeDQL(sql.toString(), null);
			return Integer.parseInt(list.get(0)[0].toString());
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return 0;
		
	}
}

