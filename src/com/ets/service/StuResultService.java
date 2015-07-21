package com.ets.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.ets.dao.*;
import com.ets.entity.*;
@Service
public class StuResultService {
	@Resource
	private StuResultDao dao;
	
	public void add(StuResult result){
		dao.add(result);
	}
}
