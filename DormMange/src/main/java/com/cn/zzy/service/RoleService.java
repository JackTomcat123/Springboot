package com.cn.zzy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.RoleDao;
import com.cn.zzy.entity.Role;


@Service
public class RoleService extends BaseService<Role>
{

	@Autowired
	RoleDao dao;
	
	@Override
	public BaseDao<Role> getDao()
	{
		return dao;
	}
	
	
	
	
	
	
}
