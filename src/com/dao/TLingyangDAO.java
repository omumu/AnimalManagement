package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TLingyang;

/**
 * A data access object (DAO) providing persistence and search support for
 * TLingyang entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.model.TLingyang
 * @author MyEclipse Persistence Tools
 */

public class TLingyangDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TLingyangDAO.class);

	protected void initDao() {
		// do nothing
	}

	public void save(TLingyang transientInstance) {
		log.debug("saving TLingyang instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TLingyang persistentInstance) {
		log.debug("deleting TLingyang instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TLingyang findById(java.lang.Integer id) {
		log.debug("getting TLingyang instance with id: " + id);
		try {
			TLingyang instance = (TLingyang) getHibernateTemplate().get(
					"com.model.TLingyang", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TLingyang instance) {
		log.debug("finding TLingyang instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TLingyang instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TLingyang as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all TLingyang instances");
		try {
			String queryString = "from TLingyang";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TLingyang merge(TLingyang detachedInstance) {
		log.debug("merging TLingyang instance");
		try {
			TLingyang result = (TLingyang) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TLingyang instance) {
		log.debug("attaching dirty TLingyang instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TLingyang instance) {
		log.debug("attaching clean TLingyang instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TLingyangDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TLingyangDAO) ctx.getBean("TLingyangDAO");
	}
}