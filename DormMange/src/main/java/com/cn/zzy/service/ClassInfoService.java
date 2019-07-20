package com.cn.zzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.ClassInfoDao;
import com.cn.zzy.entity.ClassInfo;

@Service
public class ClassInfoService extends BaseService<ClassInfo>{
@Autowired
ClassInfoDao dao;
	@Override
	public BaseDao<ClassInfo> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

}
