package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TOrg;

/**
 * A data access object (DAO) providing persistence and search support for TOrg
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.model.TOrg
 * @author MyEclipse Persistence Tools
 */

public class TOrgDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TOrgDAO.class);

	protected void initDao() {
		// do nothing
	}

	public void save(TOrg transientInstance) {
		log.debug("saving TOrg instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TOrg persistentInstance) {
		log.debug("deleting TOrg instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TOrg findById(java.lang.Integer id) {
		log.debug("getting TOrg instance with id: " + id);
		try {
			TOrg instance = (TOrg) getHibernateTemplate().get("com.model.TOrg",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TOrg instance) {
		log.debug("finding TOrg instance by example");
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
		log.debug("finding TOrg instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TOrg as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all TOrg instances");
		try {
			String queryString = "from TOrg";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TOrg merge(TOrg detachedInstance) {
		log.debug("merging TOrg instance");
		try {
			TOrg result = (TOrg) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TOrg instance) {
		log.debug("attaching dirty TOrg instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TOrg instance) {
		log.debug("attaching clean TOrg instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TOrgDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TOrgDAO) ctx.getBean("TOrgDAO");
	}
}