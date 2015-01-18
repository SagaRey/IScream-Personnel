package com.iscream.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.iscream.po.Dimission;
import com.iscream.po.DimissionCondition;
import com.iscream.po.DimissionInfo;
import com.iscream.util.CommUtil;
import com.iscream.util.DAOSupport;

public class DimissionDAO extends DAOSupport {
	public boolean add(Dimission dm){
		String sql="insert into dimission(empid,dimissiondate,type,istalent)values(?,?,?,?)";
		try {
			int result=this.exeucteDML(sql, new Object[]{dm.getEmpid(),dm.getDimissiondate(),dm.getType(),dm.isIstalent()});
		    if(result>0){
		    	return true;
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
 
    public List<DimissionInfo> queryByCondition(DimissionCondition dmc){
    	StringBuffer sql = new StringBuffer("select id,empid,empname,dimissiondate,depid,depname,postid,postname,type,istalent from dimissioninfo ");
    	if(null != dmc)
    	{ 
    		sql.append("where type " + (dmc.getType()!=null?" ="+dmc.getType():"like '%'"));
    		System.out.print(sql);
			if(dmc.getStartdate()!=null)
			{
				sql.append(" and dimissiondate >= '" + dmc.getStartdate()+"'");
			}
			if(dmc.getEnddate()!=null && (dmc.getStartdate()==null || dmc.getEnddate().after(dmc.getStartdate())))
			{
				sql.append(" and dimissiondate <= '" + dmc.getEnddate()+"'");
			}
		}
    	sql.append(" limit " + dmc.getFirstRow() + "," + dmc.getRowsPerPage()); 
		List<DimissionInfo> list = new ArrayList<DimissionInfo>();
		try {
			List<Object[]> data = this.executeDQL(sql.toString(), null);
			if (null != data) {
				DimissionInfo dim = null;
				for (Object[] tmp : data) {
					dim = new DimissionInfo();
					int i = 0;
					dim.setId(Integer.valueOf(tmp[i++].toString()));
					dim.setEmpid(Integer.valueOf(tmp[i++].toString()));
					dim.setEmpname(tmp[i++].toString());
					dim.setDimissiondate(CommUtil.stringToDate(tmp[i++].toString()));
					dim.setDepid(Integer.valueOf(tmp[i++].toString()));
					dim.setDepname(tmp[i++].toString());
					dim.setPostid(Integer.valueOf(tmp[i++].toString()));
					dim.setPostname(tmp[i++].toString());
					dim.setType(Integer.valueOf(tmp[i++].toString()));
					if(tmp[i++].toString().equals("true"))
					{
						dim.setIstalent(true);	
					}else
					{
						dim.setIstalent(false);
					}
					
					list.add(dim);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    }

	public int getTotalRows(DimissionCondition pc) {
		StringBuffer sql = new StringBuffer("select count(*) from dimissioninfo ");
		if(null != pc)
    	{ 
    		sql.append("where type " + (pc.getType()!=null?" ="+pc.getType():"like '%'"));
    		System.out.print(sql);
			if(pc.getStartdate()!=null)
			{
				sql.append(" and dimissiondate >= '" + pc.getStartdate()+"'");
			}
			if(pc.getEnddate()!=null && (pc.getStartdate()==null || pc.getEnddate().after(pc.getStartdate())))
			{
				sql.append(" and dimissiondate <= '" + pc.getEnddate()+"'");
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
