package com.iscream.dao;

import java.sql.SQLException;
import java.util.List;

import com.iscream.po.Management;
import com.iscream.util.DAOSupport;

public class ManagementDAO extends DAOSupport {

	public boolean login(Management manager){
		String sql = "select name,password from managements where name = ? and password = ?";
		try {
			List<Object[]> list = this.executeDQL(sql, new Object[]{
					manager.getName(), manager.getPassword()});
			if (list != null && !list.isEmpty()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
