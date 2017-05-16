package com.model;

/**
 * TTupian entity. @author MyEclipse Persistence Tools
 */

public class TTupian implements java.io.Serializable
{

	// Fields

	private Integer id;
	private Integer xinwenId;
	private String jieshao;
	private String fujian;
	
	
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public Integer getXinwenId()
	{
		return xinwenId;
	}
	public void setXinwenId(Integer xinwenId)
	{
		this.xinwenId = xinwenId;
	}
	public String getJieshao()
	{
		return jieshao;
	}
	public void setJieshao(String jieshao)
	{
		this.jieshao = jieshao;
	}
	public String getFujian()
	{
		return fujian;
	}
	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

}