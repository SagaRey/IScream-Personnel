package com.iscream.po;

import java.sql.Date;

public class MobilizePost {
	
	private Integer	id;
	private Integer	empid;
	private Integer originalpostid;
	private Integer	currentpostid;
	private Date mobilizedate;
	private Integer	type;
	
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
	public Integer getOriginalpostid() {
		return originalpostid;
	}
	public void setOriginalpostid(Integer originalpostid) {
		this.originalpostid = originalpostid;
	}
	public Integer getCurrentpostid() {
		return currentpostid;
	}
	public void setCurrentpostid(Integer currentpostid) {
		this.currentpostid = currentpostid;
	}
	public Date getMobilizedate() {
		return mobilizedate;
	}
	public void setMobilizedate(Date mobilizedate) {
		this.mobilizedate = mobilizedate;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
}
