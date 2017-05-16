package com.model;

/**
 * TLingyang entity. @author MyEclipse Persistence Tools
 */

public class TLingyang implements java.io.Serializable {

	// Fields

	private Integer id;
	private String xingming;
	private String zhuzhi;
	private String lianxi;
	
	private String jieshao;
	private Integer chongwuId;
	private Integer userId;
	private String huifu;

	// Constructors

	/** default constructor */
	public TLingyang() {
	}

	/** full constructor */
	public TLingyang(String xingming, String zhuzhi, String lianxi,
			String jieshao, Integer chongwuId, Integer userId, String huifu) {
		this.xingming = xingming;
		this.zhuzhi = zhuzhi;
		this.lianxi = lianxi;
		this.jieshao = jieshao;
		this.chongwuId = chongwuId;
		this.userId = userId;
		this.huifu = huifu;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getXingming() {
		return this.xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}

	public String getZhuzhi() {
		return this.zhuzhi;
	}

	public void setZhuzhi(String zhuzhi) {
		this.zhuzhi = zhuzhi;
	}

	public String getLianxi() {
		return this.lianxi;
	}

	public void setLianxi(String lianxi) {
		this.lianxi = lianxi;
	}

	public String getJieshao() {
		return this.jieshao;
	}

	public void setJieshao(String jieshao) {
		this.jieshao = jieshao;
	}

	public Integer getChongwuId() {
		return this.chongwuId;
	}

	public void setChongwuId(Integer chongwuId) {
		this.chongwuId = chongwuId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getHuifu() {
		return this.huifu;
	}

	public void setHuifu(String huifu) {
		this.huifu = huifu;
	}

}