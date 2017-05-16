package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TTupian;

/**
 * A data access object (DAO) providing persistence and search support for
 * TTupian entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.model.TTupian
 * @author MyEclipse Persistence Tools
 */

public class TTupianDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TTupianDAO.class);
	// property constants
	public static final String XINWEN_ID = "xinwenId";
	public static final String BIAOTI = "biaoti";
	public static final String JIESHAO = "jieshao";
	public static final String FUJIAN = "fujian";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TTupian transientInstance)
	{
		log.debug("saving TTupian instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TTupian persistentInstance)
	{
		log.debug("deleting TTupian instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TTupian findById(java.lang.Integer id)
	{
		log.debug("getting TTupian instance with id: " + id);
		try
		{
			TTupian instance = (TTupian) getHibernateTemplate().get(
					"com.model.TTupian", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TTupian instance)
	{
		log.debug("finding TTupian instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TTupian instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TTupian as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByXinwenId(Object xinwenId)
	{
		return findByProperty(XINWEN_ID, xinwenId);
	}

	public List findByBiaoti(Object biaoti)
	{
		return findByProperty(BIAOTI, biaoti);
	}

	public List findByJieshao(Object jieshao)
	{
		return findByProperty(JIESHAO, jieshao);
	}

	public List findByFujian(Object fujian)
	{
		return findByProperty(FUJIAN, fujian);
	}

	public List findAll()
	{
		log.debug("finding all TTupian instances");
		try
		{
			String queryString = "from TTupian";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TTupian merge(TTupian detachedInstance)
	{
		log.debug("merging TTupian instance");
		try
		{
			TTupian result = (TTupian) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TTupian instance)
	{
		log.debug("attaching dirty TTupian instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TTupian instance)
	{
		log.debug("attaching clean TTupian instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TTupianDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TTupianDAO) ctx.getBean("TTupianDAO");
	}
}