package com.iscream.po;

import java.sql.Date;

public class MobDepCondition {
	
	private String	empname;
	private Date startdate;
	private Date enddate;
	private Integer	currentdepid;
	private int firstRow;	
	private int rowsPerPage;
	
	public int getFirstRow() {
		return firstRow;
	}
	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	public int getRowsPerPage() {
		return rowsPerPage;
	}
	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public Integer getCurrentdepid() {
		return currentdepid;
	}
	public void setCurrentdepid(Integer currentdepid) {
		this.currentdepid = currentdepid;
	}
}
