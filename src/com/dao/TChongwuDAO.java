package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TChongwu;

/**
 * A data access object (DAO) providing persistence and search support for
 * TChongwu entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.model.TChongwu
 * @author MyEclipse Persistence Tools
 */

public class TChongwuDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TChongwuDAO.class);
	// property constants
	public static final String CATELOG_ID = "catelogId";
	public static final String MINGCHENG = "mingcheng";
	public static final String NIANLING = "nianling";
	public static final String JIESHAO = "jieshao";
	public static final String FUJIAN = "fujian";

	protected void initDao() {
		// do nothing
	}

	public void save(TChongwu transientInstance) {
		log.debug("saving TChongwu instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TChongwu persistentInstance) {
		log.debug("deleting TChongwu instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TChongwu findById(java.lang.Integer id) {
		log.debug("getting TChongwu instance with id: " + id);
		try {
			TChongwu instance = (TChongwu) getHibernateTemplate().get(
					"com.model.TChongwu", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TChongwu instance) {
		log.debug("finding TChongwu instance by example");
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
		log.debug("finding TChongwu instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TChongwu as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCatelogId(Object catelogId) {
		return findByProperty(CATELOG_ID, catelogId);
	}

	public List findByMingcheng(Object mingcheng) {
		return findByProperty(MINGCHENG, mingcheng);
	}

	public List findByNianling(Object nianling) {
		return findByProperty(NIANLING, nianling);
	}

	public List findByJieshao(Object jieshao) {
		return findByProperty(JIESHAO, jieshao);
	}

	public List findByFujian(Object fujian) {
		return findByProperty(FUJIAN, fujian);
	}

	public List findAll() {
		log.debug("finding all TChongwu instances");
		try {
			String queryString = "from TChongwu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TChongwu merge(TChongwu detachedInstance) {
		log.debug("merging TChongwu instance");
		try {
			TChongwu result = (TChongwu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TChongwu instance) {
		log.debug("attaching dirty TChongwu instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TChongwu instance) {
		log.debug("attaching clean TChongwu instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TChongwuDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TChongwuDAO) ctx.getBean("TChongwuDAO");
	}
}