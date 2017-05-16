package com.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dao.TCatelogDAO;
import com.dao.TChongwuDAO;
import com.dao.TGonggaoDAO;
import com.dao.TXinwenDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class indexAction extends ActionSupport {
	private static Logger Logger = LoggerFactory.getLogger(indexAction.class);
	private TXinwenDAO xinwenDAO;
	private TChongwuDAO chongwuDAO;
	private TGonggaoDAO gonggaoDAO;
	private TCatelogDAO catelogDAO;

	public TCatelogDAO getCatelogDAO() {
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO) {
		this.catelogDAO = catelogDAO;
	}

	public TGonggaoDAO getGonggaoDAO() {
		return gonggaoDAO;
	}

	public void setGonggaoDAO(TGonggaoDAO gonggaoDAO) {
		this.gonggaoDAO = gonggaoDAO;
	}

	public TXinwenDAO getXinwenDAO() {
		return xinwenDAO;
	}

	public void setXinwenDAO(TXinwenDAO xinwenDAO) {
		this.xinwenDAO = xinwenDAO;
	}

	public TChongwuDAO getChongwuDAO() {
		return chongwuDAO;
	}

	public void setChongwuDAO(TChongwuDAO chongwuDAO) {
		this.chongwuDAO = chongwuDAO;
	}

	public String index() {
		Map request = (Map) ServletActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();

		String sql = "from TXinwen order by id desc";
		List xinwenList = xinwenDAO.getHibernateTemplate().find(sql);
		if (xinwenList.size() > 3) {
			xinwenList = xinwenList.subList(0, 3);
		}
		request.put("xinwenList", xinwenList);

		String sql1 = "from TChongwu where del='no' and zt='´ýÁìÑø' order by id desc";
		List chongwuList = chongwuDAO.getHibernateTemplate().find(sql1);
		if (chongwuList.size() > 4) {
			chongwuList = chongwuList.subList(0, 4);
		}
		request.put("chongwuList", chongwuList);

		String sql2 = "from TGonggao order by gonggaoId desc";
		List gonggaoList = gonggaoDAO.getHibernateTemplate().find(sql2);
		if (gonggaoList.size() > 3) {
			gonggaoList = gonggaoList.subList(0, 3);
		}
		request.put("gonggaoList", gonggaoList);

		String sql3 = "from TCatelog where catelogDel='no'";
		List cateLogList = catelogDAO.getHibernateTemplate().find(sql3);
		session.put("cateLogList", cateLogList);

		return ActionSupport.SUCCESS;
	}



}
