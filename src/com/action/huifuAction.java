package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.THuifuDAO;
import com.dao.TUserDAO;
import com.dao.TZhutiDAO;
import com.model.THuifu;
import com.model.TZhuti;
import com.opensymphony.xwork2.ActionSupport;

public class huifuAction extends ActionSupport
{
	private int id;
	private String title;
	private String content;
	
	private String shijian;
	private Integer userId;
	private Integer zhutiId;
	
	private String message;
	private String path;
	
	private THuifuDAO huifuDAO;
	private TZhutiDAO zhutiDAO;
	private TUserDAO userDAO;
	
	public String huifuAll()
	{
		
		TZhuti zhuti=zhutiDAO.findById(zhutiId);
		zhuti.setUser(userDAO.findById(zhuti.getUserId()));
		
		String sql="from THuifu where zhutiId=?";
		Object[] c={zhuti.getId()};
		List huifuList=huifuDAO.getHibernateTemplate().find(sql,c);
		for(int i=0;i<huifuList.size();i++)
		{
			THuifu huifu=(THuifu)huifuList.get(i);
			huifu.setUser(userDAO.findById(huifu.getUserId()));
		}
		
		zhuti.setHuifuList(huifuList);
		
		HttpServletRequest req=ServletActionContext.getRequest();
		req.setAttribute("zhuti", zhuti);
		req.setAttribute("huifuList", huifuList);
		return ActionSupport.SUCCESS;
	}
	
	public String huifuAdd()
	{
		THuifu huifu=new THuifu();
		
		huifu.setTitle(title);
		huifu.setContent(content);
		huifu.setShijian(new SimpleDateFormat("yyyy-MM-dd").format(new Date()) );
		huifu.setUserId(userId);
		huifu.setZhutiId(zhutiId);
		
		System.out.println(zhutiId+"GGG");
		
		huifuDAO.save(huifu);
		
		HttpServletRequest req=ServletActionContext.getRequest();
		req.setAttribute("msg", "�ɹ��ظ�");
		return "msg";
		
	}
	
	
	public String huifuMana()
	{
		
		TZhuti zhuti=zhutiDAO.findById(zhutiId);
		zhuti.setUser(userDAO.findById(zhuti.getUserId()));
		
		String sql="from THuifu where zhutiId=?";
		Object[] c={zhuti.getId()};
		List huifuList=huifuDAO.getHibernateTemplate().find(sql,c);
		for(int i=0;i<huifuList.size();i++)
		{
			THuifu huifu=(THuifu)huifuList.get(i);
			huifu.setUser(userDAO.findById(huifu.getUserId()));
		}
		
		zhuti.setHuifuList(huifuList);
		
		HttpServletRequest req=ServletActionContext.getRequest();
		req.setAttribute("zhuti", zhuti);
		req.setAttribute("huifuList", huifuList);
		return ActionSupport.SUCCESS;
	}
	
	public String huifuDel()
	{
		
		THuifu huifu=huifuDAO.findById(id);
		huifuDAO.delete(huifu);
		
		HttpServletRequest req=ServletActionContext.getRequest();
		req.setAttribute("msg", "�ɹ�ɾ��");
		return "msg";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getShijian() {
		return shijian;
	}

	public void setShijian(String shijian) {
		this.shijian = shijian;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getZhutiId() {
		return zhutiId;
	}

	public void setZhutiId(Integer zhutiId) {
		this.zhutiId = zhutiId;
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

	public THuifuDAO getHuifuDAO() {
		return huifuDAO;
	}

	public void setHuifuDAO(THuifuDAO huifuDAO) {
		this.huifuDAO = huifuDAO;
	}

	public TZhutiDAO getZhutiDAO() {
		return zhutiDAO;
	}

	public void setZhutiDAO(TZhutiDAO zhutiDAO) {
		this.zhutiDAO = zhutiDAO;
	}

	public TUserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}

}
