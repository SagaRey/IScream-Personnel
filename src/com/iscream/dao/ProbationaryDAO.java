package com.iscream.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iscream.po.ProbCondition;
import com.iscream.po.Probationary;
import com.iscream.po.ProbationaryInfo;
import com.iscream.util.DAOSupport;
import com.iscream.util.CommUtil;

public class ProbationaryDAO extends DAOSupport {

	public boolean add(Probationary pb) {
		String sql = "insert into probationary (empid,startdate,enddate,status) values(?,?,?,?)";
		try {
			int result = this.exeucteDML(
					sql,
					new Object[] { pb.getEmpid(), pb.getStartdate(),
							pb.getEnddate(), pb.getStatus() });
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return false;
	}

	public boolean modify(Probationary pb) {
		String sql = "update probationary set startdate=?,enddate=?,status =? where id=?";
		try {
			int result = this.exeucteDML(
					sql,
					new Object[] {pb.getStartdate(),pb.getEnddate(),pb.getStatus(),pb.getId()});
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean remove(int id) {
		String sql = "delete from probationary where id=?";
		try {
			int result = this.exeucteDML(sql, new Object[] { id });
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public Probationary queryById(int id) {
		String sql = "select id,empid,startdate,enddate,status from probationary where id=?";
		try {
			List<Object[]> data = this.executeDQL(sql, new Object[] { id });
			if (null != data && !data.isEmpty()) {
				Object[] tmp = data.get(0);
				Probationary pb = new Probationary();
				int i = 0;
				pb.setId(Integer.valueOf(tmp[i++].toString()));
				pb.setEmpid(Integer.valueOf(tmp[i++].toString()));
				pb.setStartdate(CommUtil.stringToDate(tmp[i++].toString()));
				pb.setEnddate(CommUtil.stringToDate(tmp[i++].toString())); 
				pb.setStatus(Integer.valueOf(tmp[i++].toString()));
				return pb;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<ProbationaryInfo> queryByCondition(ProbCondition pbc){
		StringBuffer sql = new StringBuffer(
				"select id,empid,empname,startdate,enddate,depid,depname,postid,postname,status from probationaryinfo ");
		if (null != pbc) {
			sql.append(" where empname like '%" + (pbc.getEmpname()==null?"":pbc.getEmpname()) + "%' ");
			if (pbc.getDepid()!=null) {
				sql.append(" and depid= " + pbc.getDepid());
			}
			if (pbc.getPostid()!=null) {
				sql.append(" and postid= " + pbc.getPostid());
			}
			if (pbc.getStatus()!=null) {
				sql.append(" and status= " + pbc.getStatus());
			}
		}
		sql.append(" limit " + pbc.getFirstRow() + "," + pbc.getRowsPerPage());
		List<ProbationaryInfo> list = new ArrayList<ProbationaryInfo>();
		try {
			List<Object[]> data = this.executeDQL(sql.toString(), null);
			if (null != data) {
				ProbationaryInfo pbinfo = null;
				for (Object[] tmp : data) {
					pbinfo = new ProbationaryInfo();
					int i = 0;
					pbinfo.setId(Integer.valueOf(tmp[i++].toString()));
					pbinfo.setEmpid(Integer.valueOf(tmp[i++].toString()));
					pbinfo.setEmpname(tmp[i++].toString());
					pbinfo.setStartdate(CommUtil.stringToDate(tmp[i++].toString()));
					pbinfo.setEnddate(CommUtil.stringToDate(tmp[i++].toString()));
					pbinfo.setDepid(Integer.valueOf(tmp[i++].toString()));
					pbinfo.setDepname(tmp[i++].toString());
					pbinfo.setPostid(Integer.valueOf(tmp[i++].toString()));
					pbinfo.setPostname(tmp[i++].toString());
					pbinfo.setStatus(Integer.valueOf(tmp[i++].toString()));
					list.add(pbinfo);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getTotalRows(ProbCondition probcondition) {
		StringBuffer sql = new StringBuffer("select count(*) from probationaryinfo ");
		if (null != probcondition) {
			sql.append(" where empname like '%" + (probcondition.getEmpname()==null?"":probcondition.getEmpname()) + "%' ");
			if (probcondition.getDepid()!=null) {
				sql.append(" and depid= " + probcondition.getDepid());
			}
			if (probcondition.getPostid()!=null) {
				sql.append(" and postid= " + probcondition.getPostid());
			}
			if (probcondition.getStatus()!=null) {
				sql.append(" and status= " + probcondition.getStatus());
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
