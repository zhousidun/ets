package com.ets.dao.impl;

import org.hibernate.*;
import org.springframework.stereotype.Repository;

import com.ets.dao.StuResultDao;
import com.ets.entity.StuResult;
@Repository
public class StuResultDaoImpl extends BaseDaoImpl implements StuResultDao {

	@Override
	public void add(StuResult result) {
		Session session=getSession();
		session.save(result);
		
	}

}
