package com.model;

/**
 * TOrg entity. @author MyEclipse Persistence Tools
 */

public class TOrg implements java.io.Serializable {

	// Fields

	private Integer id;
	private String mingcheng;
	private Integer p_org_id;
	private String leixing;
	
	private String del;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMingcheng() {
		return mingcheng;
	}
	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}
	public Integer getP_org_id() {
		return p_org_id;
	}
	public void setP_org_id(Integer p_org_id) {
		this.p_org_id = p_org_id;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getLeixing() {
		return leixing;
	}
	public void setLeixing(String leixing) {
		this.leixing = leixing;
	}

}