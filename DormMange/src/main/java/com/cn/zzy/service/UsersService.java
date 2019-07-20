package com.cn.zzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.UsersDao;
import com.cn.zzy.entity.Users;



@Service
public class UsersService extends BaseService<Users>
{

	@Autowired
	UsersDao dao;
	
	@Override
	public BaseDao<Users> getDao()
	{
		return dao;
	}
	
	public Users login(Users entity)
	{
		return dao.login(entity);
		
	}
	
	
	
	
}
