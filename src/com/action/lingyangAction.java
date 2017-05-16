package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.TChongwuDAO;
import com.dao.TLingyangDAO;
import com.dao.TTupianDAO;
import com.model.TLingyang;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class lingyangAction extends ActionSupport
{
	private Integer id;
	private String xingming;
	private String zhuzhi;
	private String lianxi;
	
	private String jieshao;
	private Integer chongwuId;
	private Integer userId;
	private String huifu;

	private String message;
	private String path;
	
	private TLingyangDAO lingyangDAO;
	private TChongwuDAO chongwuDAO;
	
	
	public String lingyangAdd()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		TUser user=(TUser)session.getAttribute("user");
		
		TLingyang lingyang=new TLingyang();
		
		//lingyang.setId(id);
		lingyang.setXingming(xingming);
		lingyang.setZhuzhi(zhuzhi);
		lingyang.setLianxi(lianxi);
		
		
		lingyang.setJieshao(jieshao);
		lingyang.setChongwuId(chongwuId);
        lingyang.setUserId(user.getUserId());
        lingyang.setHuifu("");
		
		lingyangDAO.save(lingyang);
		
		this.setMessage("领养申请提交完毕，宠物发布者会及时联系您的");
		this.setPath("index.action");
		return "succeed";
	}
	
	public String lingyangMine()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		TUser user=(TUser)session.getAttribute("user");
		
		String sql = "from TLingyang where userId="+user.getUserId();
		List lingyangList=lingyangDAO.getHibernateTemplate().find(sql);
		
		request.setAttribute("lingyangList", lingyangList);
		return ActionSupport.SUCCESS;
	}	
	
	
	
	public String lingyangDel()
	{
		TLingyang lingyang=lingyangDAO.findById(id);
		lingyangDAO.delete(lingyang);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息删除成功");
		return "msg";
	}
	
	public String lingyangMana()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		
		String sql = "from TLingyang where chongwuId="+chongwuId;
		List lingyangList=lingyangDAO.getHibernateTemplate().find(sql);
		
		request.setAttribute("lingyangList", lingyangList);
		return ActionSupport.SUCCESS;
	}	
	
	public String lingyangHuifu()
	{
		TLingyang lingyang=lingyangDAO.findById(id);
		lingyang.setHuifu(huifu);
		
		lingyangDAO.attachDirty(lingyang);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "回复完毕");
		return "msg";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getXingming() {
		return xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}

	public String getZhuzhi() {
		return zhuzhi;
	}

	public void setZhuzhi(String zhuzhi) {
		this.zhuzhi = zhuzhi;
	}

	public String getLianxi() {
		return lianxi;
	}

	public void setLianxi(String lianxi) {
		this.lianxi = lianxi;
	}

	public String getJieshao() {
		return jieshao;
	}

	public void setJieshao(String jieshao) {
		this.jieshao = jieshao;
	}

	public Integer getChongwuId() {
		return chongwuId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public void setChongwuId(Integer chongwuId) {
		this.chongwuId = chongwuId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getHuifu() {
		return huifu;
	}

	public void setHuifu(String huifu) {
		this.huifu = huifu;
	}

	public TLingyangDAO getLingyangDAO() {
		return lingyangDAO;
	}

	public void setLingyangDAO(TLingyangDAO lingyangDAO) {
		this.lingyangDAO = lingyangDAO;
	}

	public TChongwuDAO getChongwuDAO() {
		return chongwuDAO;
	}

	public void setChongwuDAO(TChongwuDAO chongwuDAO) {
		this.chongwuDAO = chongwuDAO;
	}
	
}
