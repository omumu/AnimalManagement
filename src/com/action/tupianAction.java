package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TTupianDAO;
import com.model.TTupian;
import com.opensymphony.xwork2.ActionSupport;

public class tupianAction extends ActionSupport
{
		
	private Integer id;
	private Integer xinwenId;
	private String jieshao;
	private String fujian;
	
	private TTupianDAO tupianDAO;
	
	public String tupianAdd()
	{
		TTupian tupian=new TTupian();
		
		tupian.setXinwenId(xinwenId);
		tupian.setJieshao(jieshao);
		tupian.setFujian(fujian);
		
		tupianDAO.save(tupian);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息添加完毕");
		return "msg";
	}
	
	
	public String tupianMana()
	{
		String sql="from TTupian where xinwenId="+xinwenId;
		List tupianList =tupianDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("tupianList", tupianList);
		request.put("xinwenId", xinwenId);
		
		return ActionSupport.SUCCESS;
	}
	
	public String tupianDel()
	{
		TTupian tupian=tupianDAO.findById(id);
		tupianDAO.delete(tupian);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息删除完毕");
		return "msg";
	}


	public Integer getId()
	{
		return id;
	}


	public void setId(Integer id)
	{
		this.id = id;
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


	public Integer getXinwenId()
	{
		return xinwenId;
	}


	public void setXinwenId(Integer xinwenId)
	{
		this.xinwenId = xinwenId;
	}


	public TTupianDAO getTupianDAO()
	{
		return tupianDAO;
	}


	public void setTupianDAO(TTupianDAO tupianDAO)
	{
		this.tupianDAO = tupianDAO;
	}

}
