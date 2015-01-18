package com.iscream.po;

import java.util.Date;

public class Dimission {
	
	private Integer	id;
	private Integer	empid;
	private Date dimissiondate;
	private Integer	type;
	private boolean	istalent;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getEmpid() {
		return empid;
	}
	public void setEmpid(Integer empid) {
		this.empid = empid;
	}
	public Date getDimissiondate() {
		return dimissiondate;
	}
	public void setDimissiondate(Date dimissiondate) {
		this.dimissiondate = dimissiondate;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public boolean isIstalent() {
		return istalent;
	}
	public void setIstalent(boolean istalent) {
		this.istalent = istalent;
	}
}
