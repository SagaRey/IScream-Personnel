package com.iscream.po;

import java.sql.Date;

public class MobilizeDep {
	
	private Integer	id;
	private Integer	empid;
	private Integer	originaldepid;
	private Integer	currentdepid;
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
	public Integer getOriginaldepid() {
		return originaldepid;
	}
	public void setOriginaldepid(Integer originaldepid) {
		this.originaldepid = originaldepid;
	}
	public Integer getCurrentdepid() {
		return currentdepid;
	}
	public void setCurrentdepid(Integer currentdepid) {
		this.currentdepid = currentdepid;
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
