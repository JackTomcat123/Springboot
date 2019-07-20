package com.cn.zzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.DormTypeDao;
import com.cn.zzy.entity.DormType;


@Service
public class DormTypeService extends BaseService<DormType>
{
	@Autowired
	DormTypeDao dao;
	
	

	@Override
	public BaseDao<DormType> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
   
}
