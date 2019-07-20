package com.cn.util;

import java.util.List;

public abstract class BaseService<T>{

	public abstract BaseDao<T> getDao();
	
	public void save(T entity)
	{
		getDao().save(entity);
		
	}
	public void update(T entity)
	{
		getDao().update(entity);
	}
	public void delete(T entity)
	{
		getDao().delete(entity);
		
	}
	public List<T> findAll()
	{
		return getDao().findAll();
		
	}
	public T findOne(T entity)
	{
		return getDao().findOne(entity);
		
	}
}
