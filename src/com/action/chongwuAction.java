package com.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.TChongwuDAO;
import com.model.TChongwu;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class chongwuAction extends ActionSupport
{
	
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
	
	private TChongwuDAO chongwuDAO;
	
	public String chongwuAdd()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		TUser user=(TUser)session.getAttribute("user");
		
		TChongwu chongwu=new TChongwu();
		
		chongwu.setId(id);
        chongwu.setOrgId(orgId);
        chongwu.setBiaoti(biaoti);
        chongwu.setMingcheng(mingcheng);
        
        chongwu.setNianling(nianling);
        chongwu.setJieshao(jieshao);
        chongwu.setFujian(fujian);
        chongwu.setFabushi(fabushi);
        
        chongwu.setZt("待领养");
        chongwu.setDel("no");
        
        chongwuDAO.save(chongwu);
        request.setAttribute("msg", "发布信息完毕");
        return "msg";
	}
	
	
	
	public String chongwuMana()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		
		String sql="from TChongwu";
		List chongwuList=chongwuDAO.getHibernateTemplate().find(sql);
		
		request.setAttribute("chongwuList", chongwuList);
		return ActionSupport.SUCCESS;
	}
	public String chongwuserch()
	{try {
		biaoti= new String(biaoti.getBytes("utf-8"), "utf-8");
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
		HttpServletRequest request=ServletActionContext.getRequest();
		
		String sql="from TChongwu where biaoti like '%"+biaoti+"%'";
		List chongwuList=chongwuDAO.getHibernateTemplate().find(sql);
		
		request.setAttribute("chongwuserch", chongwuList);
		return ActionSupport.SUCCESS;
	}
	
	public String chongwuserch2()
	{try {
		zt= new String(zt.getBytes("utf-8"), "utf-8");
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
		HttpServletRequest request=ServletActionContext.getRequest();
		
		String sql="from TChongwu where zt like '%"+zt+"%'";
		List chongwuList=chongwuDAO.getHibernateTemplate().find(sql);
		
		request.setAttribute("chongwuserch2", chongwuList);
		return ActionSupport.SUCCESS;
	}
	public String chongwuDel()
	{
		TChongwu chongwu=chongwuDAO.findById(id);
		chongwuDAO.delete(chongwu);
		
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("msg", "信息删除完毕");
        return "msg";
	}
	
	public String lingyang()
	{
		TChongwu chongwu=chongwuDAO.findById(id);
		chongwu.setZt("已领养");
		chongwuDAO.attachDirty(chongwu);
		
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("msg", "操作成功");
        return "msg";
	}
	
	public String chongwuPre()
	{
		TChongwu chongwu=chongwuDAO.findById(id);
		
		HttpServletRequest request=ServletActionContext.getRequest();
		request.setAttribute("chongwu", chongwu);
		return ActionSupport.SUCCESS;
	}
	
	public String chongwuEdit()
	{
		TChongwu chongwu=chongwuDAO.findById(id);
		
		chongwu.setId(id);
        //chongwu.setOrgId(orgId);
        chongwu.setBiaoti(biaoti);
        chongwu.setMingcheng(mingcheng);
        
        chongwu.setNianling(nianling);
        chongwu.setJieshao(jieshao);
        chongwu.setFujian(fujian);
        //chongwu.setFabushi(fabushi);
        
        chongwu.setDel("no");
        
        chongwuDAO.attachDirty(chongwu);
        
        HttpServletRequest request=ServletActionContext.getRequest();
        request.setAttribute("msg", "操作成功");
        return "msg";
	}
	
	
	public String chongwuDetailHou()
	{
		TChongwu chongwu=chongwuDAO.findById(id);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("chongwu", chongwu);
		return ActionSupport.SUCCESS;
	}
	
	
	public String chongwuNew()
	{
        HttpServletRequest request=ServletActionContext.getRequest();
		
		String sql="from TChongwu where del='no' and zt='待领养' order by id desc";
		List chongwuList=chongwuDAO.getHibernateTemplate().find(sql);
		if(chongwuList.size()>4)
		{
			chongwuList=chongwuList.subList(0, 4);
		}
		
		request.setAttribute("chongwuList", chongwuList);
		return ActionSupport.SUCCESS;
	}
	
	public String chongwuDetailQian()
	{
        TChongwu chongwu=chongwuDAO.findById(id);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("chongwu", chongwu);
		return ActionSupport.SUCCESS;
	}
	
	
	public String chongwuByOrg()
	{
        HttpServletRequest request=ServletActionContext.getRequest();
		
		String sql="from TChongwu where del='no' and zt='待领养' and orgId="+orgId;
		List chongwuList=chongwuDAO.getHibernateTemplate().find(sql);
		
		request.setAttribute("chongwuList", chongwuList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String chongwuRes()
	{
        HttpServletRequest request=ServletActionContext.getRequest();
		
		String sql="from TChongwu where del='no' and zt='待领养' and  biaoti like '%"+biaoti.trim()+"%'";
		List chongwuList=chongwuDAO.getHibernateTemplate().find(sql);
		
		request.setAttribute("chongwuList", chongwuList);
		return ActionSupport.SUCCESS;
	}
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getZt() {
		return zt;
	}



	public void setZt(String zt) {
		this.zt = zt;
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

	public TChongwuDAO getChongwuDAO() {
		return chongwuDAO;
	}

	public void setChongwuDAO(TChongwuDAO chongwuDAO) {
		this.chongwuDAO = chongwuDAO;
	}
	
}
