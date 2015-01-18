package com.iscream.po;

import java.util.Date;

public class DimissionInfo {
	
	private Integer	id;
	private Integer	empid;
	private String	empname;
	private Date dimissiondate;
	private Integer	depid;
	private String	depname;
	private Integer	postid;
	private String	postname;
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
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public Date getDimissiondate() {
		return dimissiondate;
	}
	public void setDimissiondate(Date dimissiondate) {
		this.dimissiondate = dimissiondate;
	}
	public Integer getDepid() {
		return depid;
	}
	public void setDepid(Integer depid) {
		this.depid = depid;
	}
	public String getDepname() {
		return depname;
	}
	public void setDepname(String depname) {
		this.depname = depname;
	}
	public Integer getPostid() {
		return postid;
	}
	public void setPostid(Integer postid) {
		this.postid = postid;
	}
	public String getPostname() {
		return postname;
	}
	public void setPostname(String postname) {
		this.postname = postname;
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
