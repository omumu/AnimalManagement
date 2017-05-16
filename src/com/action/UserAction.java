package com.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport
{
	private Integer userId;
	private String userName;
	private String userPw;
	private String userRealname;

	private String userSex;
	private String userAddress;
	private String userTel;
	private String userEmail;

	private String userDel;
	
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	
	
	
	public String userReg()
	{
		System.out.println(userEmail+"TT");
		
		TUser user=new TUser();
		
		//user.setUserId(userId);
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserRealname(userRealname);
		
		user.setUserSex(userSex);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		
		user.setUserDel("no");
		
		userDAO.save(user);
		
		this.setMessage("注册成功，请登录");
		this.setPath("index.action");
		return "succeed";
	}
	
	public String userMana()
	{
		String sql="from TUser where userDel='no'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	public String userserch()
	{try {
		userRealname= new String(userRealname.getBytes("utf-8"), "utf-8");
	} catch (UnsupportedEncodingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
		String sql="from TUser where userRealname like '%"+userRealname+"%' and userDel='no'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userserch", userList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String userDel()
	{
		TUser user=userDAO.findById(userId);
		user.setUserDel("yes");
		userDAO.getHibernateTemplate().update(user);
		
		this.setMessage("删除成功");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	
	
	
	
	public String userXinxi()
	{
		String sql="from TUser where userId="+userId;
		List userList=userDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String userEditMe()
	{
		TUser user=userDAO.findById(userId);
		
		//user.setUserId(userId);
		//user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserRealname(userRealname);
		
		user.setUserSex(userSex);
		user.setUserAddress(userAddress);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		
		user.setUserDel("no");
		
		userDAO.attachDirty(user);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "修改成功,重新登录后生效");
		return "msg";
		
	}

	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserRealname() {
		return userRealname;
	}


	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}


	public String getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}


	public String getUserSex() {
		return userSex;
	}


	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}


	public String getUserTel() {
		return userTel;
	}


	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	


	public String getUserDel() {
		return userDel;
	}


	public void setUserDel(String userDel) {
		this.userDel = userDel;
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


	public TUserDAO getUserDAO() {
		return userDAO;
	}


	public void setUserDAO(TUserDAO userDAO) {
		this.userDAO = userDAO;
	}
		
}
