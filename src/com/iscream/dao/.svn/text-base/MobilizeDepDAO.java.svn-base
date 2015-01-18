package com.iscream.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iscream.po.MobDepCondition;
import com.iscream.po.MobilizeDep;
import com.iscream.po.MobilizeDepInfo;
import com.iscream.util.DAOSupport;
import com.iscream.util.CommUtil;


public class MobilizeDepDAO extends DAOSupport {
	public boolean add(MobilizeDep md){
		  String sql="insert into mobilizedep(empid,originaldepid,currentdepid ,mobilizedate,type) values(?,?,?,?,?)";
		  
		  try {
				int result = this.exeucteDML(sql, new Object[] {md.getEmpid(),md.getOriginaldepid(),md.getCurrentdepid(),md.getMobilizedate(),md.getType()});
				if(result>0){
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			return false;
		}
 
	public List<MobilizeDepInfo> queryByCondition(MobDepCondition mdc){
		StringBuffer sql = new StringBuffer("select id,empid,empname,originaldepid,originaldepname,currentdepid,currentdepname,mobilizedate,type from mobilizeDepinfo ");
		if(null != mdc){
			sql.append(" where empname like '%" + (mdc.getEmpname()==null?"":mdc.getEmpname()) + "%' ");
			if(mdc.getStartdate()!=null){
					sql.append(" and mobilizedate >= '" + mdc.getStartdate()+"'");
				}
			if(mdc.getEnddate()!=null && (mdc.getStartdate()==null || mdc.getEnddate().after(mdc.getStartdate()))){
						sql.append(" and mobilizedate <= '" + mdc.getEnddate()+"'");
				}
			if(mdc.getCurrentdepid()!=null){
					sql.append(" and currentdepid = " +mdc.getCurrentdepid());
				}
			}
		 sql.append(" limit " + mdc.getFirstRow() + "," + mdc.getRowsPerPage());
			List<MobilizeDepInfo> list = new ArrayList<MobilizeDepInfo>();
			try {
				List<Object[]> data = this.executeDQL(sql.toString(), null);
				if (null != data) {
					MobilizeDepInfo mb = null;
					for (Object[] tmp : data) {
						mb = new MobilizeDepInfo();
						int i = 0;
						mb.setId(Integer.parseInt(tmp[i++].toString()));
						mb.setEmpid(Integer.parseInt(tmp[i++].toString()));
						mb.setEmpname(tmp[i++].toString());
						mb.setOriginaldepid(Integer.parseInt(tmp[i++].toString()));
						mb.setOriginaldepname( tmp[i++].toString());
						mb.setCurrentdepid(Integer.parseInt(tmp[i++].toString()));
						mb.setCurrentdepname( tmp[i++].toString());
						mb.setMobilizedate(CommUtil.stringToDate(tmp[i++].toString()));
						mb.setType(Integer.parseInt(tmp[i++].toString()));
						list.add(mb);
						
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
    }

	public int getTotalRows(MobDepCondition mobdepcondition) {
		StringBuffer sql = new StringBuffer("select count(*) from mobilizeDepinfo ");
		if(null != mobdepcondition){
			sql.append(" where empname like '%" + (mobdepcondition.getEmpname()==null?"":mobdepcondition.getEmpname()) + "%' ");
			if(mobdepcondition.getStartdate()!=null){
					sql.append(" and mobilizedate >= '" + mobdepcondition.getStartdate()+"'");
				}
			if(mobdepcondition.getEnddate()!=null && (mobdepcondition.getStartdate()==null || mobdepcondition.getEnddate().after(mobdepcondition.getStartdate()))){
						sql.append(" and mobilizedate <= '" + mobdepcondition.getEnddate()+"'");
				}
			if(mobdepcondition.getCurrentdepid()!=null){
					sql.append(" and currentpostid = " +mobdepcondition.getCurrentdepid());
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

