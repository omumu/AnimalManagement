package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.TAdminDAO;
import com.dao.TUserDAO;
import com.model.TAdmin;
import com.model.TUser;

public class loginService
{
	private TAdminDAO adminDAO;
	private TUserDAO userDAO;
	
	public TUserDAO getUserDAO()
	{
		return userDAO;
	}
	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}
	public TAdminDAO getAdminDAO()
	{
		return adminDAO;
	}
	public void setAdminDAO(TAdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}
	
	public String login(String userName,String userPw,int userType)
	{
		
		System.out.println("userType"+userType);
		try
		{
			Thread.sleep(700);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String result="no";
		
		if(userType==0)//ϵͳ����Ա��½
		{
			String sql="from TAdmin where userName=? and userPw=?";
			Object[] con={userName,userPw};
			List adminList=adminDAO.getHibernateTemplate().find(sql,con);
			if(adminList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TAdmin admin=(TAdmin)adminList.get(0);
				 session.setAttribute("userType", 0);
	             session.setAttribute("admin", admin);
	             result="yes";
			}
		}
		if(userType==1)
		{
			String sql="from TUser where userName=? and userPw=? and userDel='no'";
			Object[] con={userName,userPw};
			List userList=userDAO.getHibernateTemplate().find(sql,con);
			if(userList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TUser user=(TUser)userList.get(0);
				 session.setAttribute("userType", 1);
	             session.setAttribute("user", user);
	             result="yes";
			}
		}
		if(userType==2)
		{
			
		}
		return result;
	}
	
	
	public String userLogout()
	{
		 WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession(); 
		 
		 session.setAttribute("userType", null);
         session.setAttribute("user", null);
         
         return "yes";
	}

    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		admin.setUserPw(userPwNew);
		
		adminDAO.getHibernateTemplate().update(admin);
		session.setAttribute("admin", admin);
		
		return "yes";
    }
    
    
    
}
