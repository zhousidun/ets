package com.ets.dao.impl;

import org.hibernate.*;
import org.springframework.stereotype.Repository;

import com.ets.dao.ManagerDao;
import com.ets.entity.Manager;
@Repository
public class ManagerDaoImpl extends BaseDaoImpl implements ManagerDao {

	@Override
	public Manager checkLogin(String name, String pwd) {
		Session session=getSession();
		String hql="from Manager where name=? and pwd=?";
		Query query=session.createQuery(hql);
		query.setString(0, name);
		query.setString(1, pwd);
		Manager manager=(Manager) query.uniqueResult();
		return manager;
	}

}
