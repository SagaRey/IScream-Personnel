package com.iscream.po;

import java.sql.Date;

public class MobilizeDepInfo {
	private Integer	id;
	private Integer	empid;
	private String	empname;
	private Integer	originaldepid;
	private String	originaldepname;
	private Integer	currentdepid;
	private String	currentdepname;
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
	public Integer getOriginaldepid() {
		return originaldepid;
	}
	public void setOriginaldepid(Integer originaldepid) {
		this.originaldepid = originaldepid;
	}
	public String getOriginaldepname() {
		return originaldepname;
	}
	public void setOriginaldepname(String originaldepname) {
		this.originaldepname = originaldepname;
	}
	public Integer getCurrentdepid() {
		return currentdepid;
	}
	public void setCurrentdepid(Integer currentdepid) {
		this.currentdepid = currentdepid;
	}
	public String getCurrentdepname() {
		return currentdepname;
	}
	public void setCurrentdepname(String currentdepname) {
		this.currentdepname = currentdepname;
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
