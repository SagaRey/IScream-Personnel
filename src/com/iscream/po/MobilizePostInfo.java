package com.iscream.po;

import java.util.Date;

public class MobilizePostInfo {
	
	private Integer	id;
	private Integer	empid;
	private String	empname;
	private Integer	originalpostid;
	private String	originalpostname;
	private Integer	currentpostid;
	private String	currentpostname;
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
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public Integer getOriginalpostid() {
		return originalpostid;
	}
	public void setOriginalpostid(Integer originalpostid) {
		this.originalpostid = originalpostid;
	}
	public String getOriginalpostname() {
		return originalpostname;
	}
	public void setOriginalpostname(String originalpostname) {
		this.originalpostname = originalpostname;
	}
	public Integer getCurrentpostid() {
		return currentpostid;
	}
	public void setCurrentpostid(Integer currentpostid) {
		this.currentpostid = currentpostid;
	}
	public String getCurrentpostname() {
		return currentpostname;
	}
	public void setCurrentpostname(String currentpostname) {
		this.currentpostname = currentpostname;
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
