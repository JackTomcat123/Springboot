package com.cn.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;


@Transactional(readOnly=false)
public class BaseDao<T>
{
	public Class<?> clazz;
	public BaseDao()
	{
		ParameterizedType py = (ParameterizedType)this.getClass().getGenericSuperclass();
		clazz = (Class<?>) py.getActualTypeArguments()[0];
		
		
	}
	
	@Autowired
	HibernateTemplate dao;
	@Autowired
	public SessionFactory factory;
	public void save(T entity)
	{
		
		
		dao.save(entity);
	}
	
	public void update(T entity)
	{
		dao.update(entity);
		
	
	}
	
	public void delete(T entity)
	{
	
		
		dao.delete(entity);
		
	
	}
	
	@SuppressWarnings("unchecked")
	public T findOne(T entity)
	{
	
		Class<?> c = entity.getClass();
		Method[] ms=c.getMethods();
		for(Method m:ms) {
			Id id = m.getAnnotation(Id.class);	
			if(id!=null) {
				try {
					entity=(T) dao.get(entity.getClass(),Integer.valueOf(m.invoke(entity).toString()));
				} catch (DataAccessException | IllegalAccessException | IllegalArgumentException
						| InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		/*Method[] ms = c.getDeclaredMethods();
		
		for(Method m : ms)
		{
			Id id = m.getAnnotation(Id.class);
			if(id != null)
			{
				try
				{
					entity = (T) dao.get(entity.getClass(), (Serializable) m.invoke(entity));
					break;
				} catch (IllegalAccessException e)
				{
					e.printStackTrace();
				} catch (IllegalArgumentException e)
				{
					e.printStackTrace();
				} catch (InvocationTargetException e)
				{
					e.printStackTrace();
				}
			}
		}*/
		
	
		return entity;
	}
	
	
	public List<T> findAll()
	{
		Entity entity = clazz.getAnnotation(Entity.class);
		if(entity == null) return null;
		String entityName = null;
		if(!"".equals(entity.name())) entityName = entity.name();
		else entityName = clazz.getSimpleName();
		
		
		@SuppressWarnings("unchecked")
		List<T> list = (List<T>) dao.find("from "+entityName);
		
		return list;
	}
	public Session openSession() {
		
		return dao.getSessionFactory().openSession();
	}

}
