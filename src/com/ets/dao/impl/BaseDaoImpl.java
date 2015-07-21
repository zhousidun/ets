package com.ets.dao.impl;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.dao.support.DaoSupport;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class BaseDaoImpl extends DaoSupport{
	
	private SessionFactory sf;
	private HibernateTemplate hibernateTemplate;

	protected Session getSession(){
		return sf.openSession();
	}

	protected HibernateTemplate createHibernateTemplate(SessionFactory sessionFactory) {
		return new HibernateTemplate(sessionFactory);
	}


	
	@Override
	protected void checkDaoConfig() throws IllegalArgumentException {
		// TODO Auto-generated method stub
		
	}	

	public SessionFactory getSf() {
		return sf;
	}
	
	@Resource
	public void setSf(SessionFactory sf) {
		this.sf = sf;
		this.hibernateTemplate=createHibernateTemplate(sf);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
