package com.ets.dao;

import com.ets.entity.Manager;

public interface ManagerDao {
	public Manager checkLogin(String name,String pwd);
}
