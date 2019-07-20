package com.cn.zzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.TeacherTypeDao;
import com.cn.zzy.entity.TeacherType;



@Service
public class TeacherTypeService extends BaseService<TeacherType>
{
	@Autowired
	TeacherTypeDao dao;
	@Override
	public BaseDao<TeacherType> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
 
}
