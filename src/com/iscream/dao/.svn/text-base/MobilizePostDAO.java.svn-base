package com.iscream.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iscream.po.MobPostCondition;
import com.iscream.po.MobilizePost;
import com.iscream.po.MobilizePostInfo;
import com.iscream.util.CommUtil;
import com.iscream.util.DAOSupport;

public class MobilizePostDAO extends DAOSupport {
	public boolean add(MobilizePost mp){
		String sql="insert into mobilizepost (empid,originalpostid,currentpostid,mobilizedate,type) values(?,?,?,?,?)";
		try {
			int result = this.exeucteDML(sql, new Object[]{mp.getEmpid(),mp.getOriginalpostid(),mp.getCurrentpostid(),mp.getMobilizedate(),mp.getType()});
			if(result>0){
				return true;
			}
		 
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return false;
		}
 
	public List<MobilizePostInfo> queryByCondition(MobPostCondition mpc){
		StringBuffer sql = new StringBuffer("select id,empid,empname,originalpostid,originalpostname,currentpostid,currentpostname,mobilizedate,type from mobilizePostinfo ");
		if(null != mpc){
			String empname = mpc.getEmpname()==null?"":mpc.getEmpname();
			sql.append(" where empname like '%" + empname + "%' ");
			if(mpc.getCurrentpostid()!=null){
				sql.append(" and currentpostid = " +mpc.getCurrentpostid());
			}
			if(mpc.getStartdate()!=null){
				sql.append(" and mobilizedate >= '" + mpc.getStartdate()+"'");
			}
			if(mpc.getEnddate()!=null && (mpc.getStartdate()==null || mpc.getEnddate().after(mpc.getStartdate()))){
				sql.append(" and mobilizedate <= '" + mpc.getEnddate()+"'");
			}
		}
		sql.append(" limit " + mpc.getFirstRow() + "," + mpc.getRowsPerPage());

		List<MobilizePostInfo> list = new ArrayList<MobilizePostInfo>();
		try {
			List<Object[]> data = this.executeDQL(sql.toString(), null);
			if (null != data) {
				MobilizePostInfo mb = null;
				for (Object[] tmp : data) {
					mb = new MobilizePostInfo();
					int i = 0;
					mb.setId(Integer.valueOf(tmp[i++].toString()));
					mb.setEmpid(Integer.valueOf(tmp[i++].toString()));
					mb.setEmpname( tmp[i++].toString());
					mb.setOriginalpostid(Integer.valueOf(tmp[i++].toString()));
					mb.setOriginalpostname(tmp[i++].toString());
					mb.setCurrentpostid(Integer.valueOf(tmp[i++].toString()));
					mb.setCurrentpostname(tmp[i++].toString());
					mb.setMobilizedate(CommUtil.stringToDate(tmp[i++].toString()));
					mb.setType(Integer.valueOf(tmp[i++].toString()));
					list.add(mb);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getTotalRows(MobPostCondition mobpostcondition) {
		StringBuffer sql = new StringBuffer("select count(*) from mobilizePostinfo ");
		if(null != mobpostcondition){
			String empname = mobpostcondition.getEmpname()==null?"":mobpostcondition.getEmpname();
			sql.append(" where empname like '%" + empname + "%' ");
			if(mobpostcondition.getCurrentpostid()!=null){
				sql.append(" and currentpostid = " +mobpostcondition.getCurrentpostid());
			}
			if(mobpostcondition.getStartdate()!=null){
				sql.append(" and mobilizedate >= '" + mobpostcondition.getStartdate()+"'");
			}
			if(mobpostcondition.getEnddate()!=null && (mobpostcondition.getStartdate()==null || mobpostcondition.getEnddate().after(mobpostcondition.getStartdate()))){
				sql.append(" and mobilizedate <= '" + mobpostcondition.getEnddate()+"'");
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
	

