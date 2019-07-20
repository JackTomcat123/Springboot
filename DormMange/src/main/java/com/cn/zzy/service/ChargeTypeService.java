package com.cn.zzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.ChargeTypeDao;
import com.cn.zzy.entity.ChargeType;


@Service
public class ChargeTypeService extends BaseService<ChargeType>
{
	 @Autowired
     ChargeTypeDao dao;


	 
	public void updateflag(ChargeType entity){
		 dao.updateflag(entity);
	}

	@Override
	public BaseDao<ChargeType> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	 
}
