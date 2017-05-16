package com.model;

/**
 * TChongwu entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TChongwu implements java.io.Serializable {

	private Integer id;
	private Integer orgId;
	private String biaoti;
	private String mingcheng;
	
	private String nianling;
	private String jieshao;
	private String fujian;
	private String fabushi;
	
	private String zt;//待领养--已领养
	private String del;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public String getBiaoti() {
		return biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getMingcheng() {
		return mingcheng;
	}

	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}

	public String getNianling() {
		return nianling;
	}

	public void setNianling(String nianling) {
		this.nianling = nianling;
	}

	public String getJieshao() {
		return jieshao;
	}

	public void setJieshao(String jieshao) {
		this.jieshao = jieshao;
	}

	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public String getFabushi() {
		return fabushi;
	}

	public void setFabushi(String fabushi) {
		this.fabushi = fabushi;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}
	
}