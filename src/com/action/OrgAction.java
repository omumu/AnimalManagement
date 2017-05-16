package com.action;

import java.util.List;
import java.util.Map;


import com.dao.TOrgDAO;
import com.model.TOrg;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrgAction extends ActionSupport
{
	
	private Integer id;
	private String mingcheng;
	private Integer p_org_id;
	private String leixing;
	
	private String del;
	
	private TOrgDAO orgDAO;

	public String orgDingAdd()
	{
		TOrg org=new TOrg();
		
		//org.setId(id);
		org.setMingcheng(mingcheng);
		org.setP_org_id(0);
		org.setLeixing("类别");
		
		org.setDel("no");
		
		orgDAO.save(org);
		
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("msg", "添加成功");
		return "msg";
	}
	
	
	public String orgXiaAdd()
	{
		TOrg org=new TOrg();
		
		//org.setId(id);
		org.setMingcheng(mingcheng);
		org.setP_org_id(p_org_id);
		org.setLeixing("类别");
		
		org.setDel("no");
		
		orgDAO.save(org);
		
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("msg", "添加成功");
		return "msg";
	}
	
	
	public String orgMana() 
	{
		String sql="from TOrg where del='no'";
		List orgList=orgDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("orgList", orgList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	public String orgDel()
	{
		String sql="from TOrg where p_org_id="+id;
		List list=orgDAO.getHibernateTemplate().find(sql);
		if(list.size()>0)
		{
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("msg", "有子类别，不能删除");
			return "msg";
		}
		
		
		TOrg org=orgDAO.findById(id);
		org.setDel("yes");
		orgDAO.attachDirty(org);
		
		
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	
	
	public String orgAll() 
	{
		String sql="from TOrg where del='no'";
		List orgList=orgDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("orgList", orgList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String orgSuoyou() 
	{
		String sql="from TOrg where del='no'";
		List orgList=orgDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("orgList", orgList);
		return ActionSupport.SUCCESS;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getLeixing() {
		return leixing;
	}


	public void setLeixing(String leixing) {
		this.leixing = leixing;
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


	public TOrgDAO getOrgDAO() {
		return orgDAO;
	}


	public void setOrgDAO(TOrgDAO orgDAO) {
		this.orgDAO = orgDAO;
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

}
