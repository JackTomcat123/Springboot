package com.cn.zzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.TeacherDao;
import com.cn.zzy.entity.Teacher;



@Service
public class TeacherService extends BaseService<Teacher>
{
    @Autowired
    TeacherDao dao;
	

	@Override
	public BaseDao<Teacher> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
   
}
