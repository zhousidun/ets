package com.ets.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.ets.entity.*;
import com.ets.dao.*;
@Service
public class ManagerService {
	@Resource
	private ManagerDao dao;
	
	public Manager checkLogin(String name,String pwd){
		return dao.checkLogin(name, pwd);
	}
}
