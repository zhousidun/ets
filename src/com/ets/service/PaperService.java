package com.ets.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.ets.entity.*;
import com.ets.dao.*;
@Service
public class PaperService {
	@Resource
	private PaperDao dao;
	public Paper getPaper(int id){
		return dao.getPaperById(id);
	}
}
