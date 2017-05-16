package com.action;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CareDao;
import com.model.Care;
import com.model.Show;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.StringUtil;

public class CareAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CareDao careDao = new CareDao();
	private String careDesc;
	private Integer careTime;
	private String carePhone;
	private Integer careId;
	private String careStartDate;
	private String searchContent;
	
	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public String getCareStartDate() {
		return careStartDate;
	}

	public void setCareStartDate(String careStartDate) {
		this.careStartDate = careStartDate;
	}

	public Integer getCareId() {
		return careId;
	}

	public void setCareId(Integer careId) {
		this.careId = careId;
	}

	private Integer page;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getCarePhone() {
		return carePhone;
	}

	public void setCarePhone(String carePhone) {
		this.carePhone = carePhone;
	}

	public String getCareDesc() {
		return careDesc;
	}

	public void setCareDesc(String careDesc) {
		this.careDesc = careDesc;
	}

	public Integer getCareTime() {
		return careTime;
	}

	public void setCareTime(Integer careTime) {
		this.careTime = careTime;
	}

	public String preCare() throws Exception {
		TUser user = (TUser) ServletActionContext.getRequest().getSession().getAttribute("user");
		if (user == null) {
			return "no_login";
		}
		return "success";
	}

	public String addCare() throws Exception {
		Care c = new Care();
		String str=new String(careDesc.getBytes("ISO-8859-1"), "utf-8");
		c.setCareDesc(str);
		c.setCareTime(careTime);
		c.setCarePhone(carePhone);
		c.setCareStartDate(careStartDate);
		// System.out.println("caredesc:"+careDesc);
		// System.out.println("carePhone:"+carePhone);
		// System.out.println("careTime:"+careTime);
		c.setCarePrice(new BigDecimal(careTime*100));
		TUser user = (TUser) ServletActionContext.getRequest().getSession().getAttribute("user");
		// System.out.println(user);
		c.setCareUser(user.getUserId());
		if (StringUtil.isBlank(careDesc) || StringUtil.isBlank(carePhone)||StringUtil.isBlank(careStartDate)) {
			ServletActionContext.getRequest().setAttribute("errorMsg", "参数不能为空");
			ServletActionContext.getRequest().setAttribute("c", c);
			ServletActionContext.getResponse().getWriter().write("{'data':'errorArg'}");
			return null;
		}
		if (!StringUtil.checkPhoneNum(carePhone)) {
			ServletActionContext.getRequest().setAttribute("errorMsg", "电话号码格式不正确！");
			ServletActionContext.getRequest().setAttribute("c", c);
			ServletActionContext.getResponse().getWriter().write("{'data':'errorPhone'}");
			return null;
		}
		if (!careDao.addCare(c)) {
			throw new Exception("添加失败");
		}
		ServletActionContext.getResponse().getWriter().write("{'data':'ok'}");
		return null;
	}

	public String careList() throws Exception {
		if (page == null) {
			page = 1;
		}
		String searchContentAfter=null;
		if(searchContent!=null){
			searchContentAfter=new String(searchContent.getBytes("ISO-8859-1"),"UTF-8");//解决乱码
		}
		System.out.println("searchContent:"+searchContentAfter);
		int start = (page - 1) * 10;
		List<Care> cList = careDao.getCareList(start,searchContentAfter);
		ServletActionContext.getRequest().setAttribute("cList", cList);
//		System.out.println(cList);
		if(searchContent==null||"".equals(searchContent)){
			Integer totalNums = careDao.getCareListNums();
			String pageCode = StringUtil.getPageCode("zhiyuan/careList.action", totalNums, 10, page);
			ServletActionContext.getRequest().setAttribute("pageCode", pageCode);
		}
		ServletActionContext.getRequest().setAttribute("page", page);

		return "success";


	}

	public String updateCareState() throws Exception {
		if (careDao.updateCareState(careId)) {
			ServletActionContext.getResponse().sendRedirect("/axcw/careList.action?page=" + page);
			return null;
		}
		throw new Exception("修改失败");
	}
	public String deleteCare() throws Exception {
		if (careDao.deleteCare(careId)) {
			ServletActionContext.getResponse().sendRedirect("/axcw/careList.action?page=" + page);
			return null;
		}
		throw new Exception("删除失败");
	}
	
	public String myCareList() throws Exception {
		TUser user=(TUser) ServletActionContext.getRequest().getSession().getAttribute("user");
		List<Care> mcList = careDao.getMyCareList(user.getUserId());
		ServletActionContext.getRequest().setAttribute("mcList",mcList);
//		System.out.println(mcList);
		return "success";

	}
}
