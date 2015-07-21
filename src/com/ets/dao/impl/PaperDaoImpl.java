package com.ets.dao.impl;

import org.springframework.stereotype.Repository;

import com.ets.dao.PaperDao;
import com.ets.entity.Paper;
@Repository
public class PaperDaoImpl extends BaseDaoImpl implements PaperDao {

	@Override
	public Paper getPaperById(int id) {
		String hql="from Paper where id="+id;
		return (Paper) getSession().createQuery(hql).uniqueResult();
	}

}
