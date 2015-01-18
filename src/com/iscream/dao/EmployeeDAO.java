package com.iscream.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iscream.po.EmpCondition;
import com.iscream.po.Employee;
import com.iscream.po.EmployeeInfo;
import com.iscream.util.DAOSupport;
import com.iscream.util.CommUtil;

public class EmployeeDAO extends DAOSupport {
	public boolean add(Employee emp){
		
		String sql="insert into employees (name,sex,type,birthday,identity,depid,postid,hiredate,nativeplace,phone,email)values(?,?,?,?,?,?,?,?,?,?,?)";
	    try {
			int result=this.exeucteDML(sql, new Object[]{emp.getName(),emp.getSex(),emp.getType(),emp.getBirthday(),emp.getIdentity(),emp.getDepid(),emp.getPostid(),emp.getHiredate(),emp.getNativeplace(),emp.getPhone(),emp.getEmail()});
		    if(result>0){return true;}
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return false;
	}
	public boolean modify(Employee emp){
		String sql = "update employees set name = ?,sex=?,type = ?,birthday=?,identity=?,depid=?,postid=?,hiredate=?,nativeplace=?,phone=?,email=? where empid = ?";
		
		try {
			int result=this.exeucteDML(sql,new Object[] {emp.getName(),emp.getSex(),emp.getType(),emp.getBirthday(),emp.getIdentity(),emp.getDepid(),emp.getPostid(),emp.getHiredate(),emp.getNativeplace(),emp.getPhone(),emp.getEmail(),emp.getEmpid()});
				if(result>0){
					return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean remove(int empid){
		String sql = "delete from employees where empid = ?";
		try {
			int result=this.exeucteDML(sql, new Object[]{empid});
			if(result>0){
				return true;
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false; 
	}

	public Employee queryById(int empid){
		String sql = "select e.empid,e.name,e.sex,e.type,e.birthday,e.identity,e.depid,e.postid,e.hiredate,e.nativeplace,e.phone,e.email from employees e where e.empid= ?";
		try {
			List<Object[]> data = this.executeDQL(sql, new Object[] {empid});
			if (null != data && !data.isEmpty()) {
				Object[] tmp = data.get(0);
				Employee emp = new Employee();
				int i = 0;
				emp.setEmpid(Integer.valueOf(tmp[i++].toString()));
				emp.setName(tmp[i++].toString());
				emp.setSex(tmp[i++].toString());
				emp.setType(Integer.valueOf(tmp[i++].toString()));
				emp.setBirthday(CommUtil.stringToDate(tmp[i++].toString()));
				emp.setIdentity(tmp[i++].toString());
				emp.setDepid(Integer.valueOf(tmp[i++].toString()));
				emp.setPostid(Integer.valueOf(tmp[i++].toString()));
				emp.setHiredate(CommUtil.stringToDate(tmp[i++].toString()));
				emp.setNativeplace(tmp[i++]==null?null:tmp[i-1].toString());
				emp.setPhone(tmp[i++]==null?null:tmp[i-1].toString());
				emp.setEmail(tmp[i++]==null?null:tmp[i-1].toString());
				return emp;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<EmployeeInfo> queryByCondition(EmpCondition ec) {
		StringBuffer sql = new StringBuffer("select empid,name,sex,type,birthday,identity,depid,depname,postid,postname,hiredate,nativeplace,phone,email from employeeinfo");
		if (null != ec) {
			sql.append(" where name like '%" + (ec.getName()==null?"":ec.getName()) + "%' ");
			if (ec.getEmpid() != null) {
				sql.append("  and empid = " + ec.getEmpid());

			}
			if (ec.getDepid() != null) {
				sql.append(" and depid = " + ec.getDepid());

			}
			if (ec.getPostid() != null) {
				sql.append(" and postid = " + ec.getPostid());
			}
			if (ec.getStartdate()!=null) {
				sql.append(" and hiredate > '" + ec.getStartdate() + "'");
			}
			if (ec.getEnddate()!=null && (ec.getStartdate()==null || ec.getEnddate().after(ec.getStartdate()))) {
				sql.append(" and hiredate < '" + ec.getEnddate() + "'");
			}
			if (ec.getType() != null) {
				sql.append(" and type = " + ec.getType());
			}
		}
		sql.append(" limit " + ec.getFirstRow() + "," + ec.getRowsPerPage());

 
		List<EmployeeInfo> list = new ArrayList<EmployeeInfo>();
		try {
			List<Object[]> data = this.executeDQL(sql.toString(), null);
			if (null != data) {
				EmployeeInfo e = null;
				for (Object[] tmp : data) {
					e = new EmployeeInfo();
					int i = 0;
				    e.setEmpid(Integer.valueOf(tmp[i++].toString()));
					e.setName(tmp[i++].toString());
					e.setSex(tmp[i++]==null?null:tmp[i-1].toString());
					e.setType(Integer.valueOf(tmp[i++].toString()));
					e.setBirthday(CommUtil.stringToDate(tmp[i++].toString()));
					e.setIdentity(tmp[i++]==null?null:tmp[i-1].toString());
					e.setDepid(Integer.valueOf(tmp[i++].toString()));
					e.setDepname(tmp[i++].toString());
					e.setPostid(Integer.valueOf(tmp[i++].toString()));
					e.setPostname(tmp[i++].toString());
					e.setHiredate(CommUtil.stringToDate(tmp[i++].toString()));
					e.setNativeplace(tmp[i++]==null?null:tmp[i-1].toString());
					e.setPhone(tmp[i++]==null?null:tmp[i-1].toString());
					e.setEmail(tmp[i++]==null?null:tmp[i-1].toString());
					list.add(e);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public int getTotalRows(EmpCondition ec) {
		StringBuffer sql = new StringBuffer("select count(*) from employeeinfo ");
		if (null != ec) {
			sql.append(" where name like '%" + (ec.getName()==null?"":ec.getName()) + "%' ");
			if (ec.getEmpid() != null) {
				sql.append("  and empid = " + ec.getEmpid());
			}
			if (ec.getDepid() != null) {
				sql.append(" and depid = " + ec.getDepid());

			}
			if (ec.getPostid() != null) {
				sql.append(" and postid = " + ec.getPostid());
			}
			if (ec.getStartdate()!=null) {
				sql.append(" and hiredate > '" + ec.getStartdate() + "'");
			}
			if (ec.getEnddate()!=null && (ec.getStartdate()==null || ec.getEnddate().after(ec.getStartdate()))) {
				sql.append(" and hiredate < '" + ec.getEnddate() + "'");
			}
			if (ec.getType() != null) {
				sql.append(" and type = " + ec.getType());
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
	
