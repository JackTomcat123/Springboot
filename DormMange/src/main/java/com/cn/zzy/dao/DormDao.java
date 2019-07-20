package com.cn.zzy.dao;

import java.util.List;

import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import com.cn.util.BaseDao;
import com.cn.zzy.entity.Dorm;
@Component
public class DormDao extends BaseDao<Dorm> {
	public List<Dorm> findDormBybid(Dorm entity){
		String sql="select * from dorm d LEFT JOIN building b on b.buildId=d.fk_buildid LEFT JOIN dormtype t\r\n" + 
				" on t.typeId=d.fk_typeId \r\n" + 
				"where b.buildId='"+entity.getBuild().getBuildid()+"'";
		List<Dorm> list=openSession().createSQLQuery(sql).addEntity(Dorm.class).list();
		return list;
		
		
	}


	
public List<Dorm> findDormBId(Dorm entity){
	String sql="select * from dorm d where d.dormId="+entity.getDormId();
	List<Dorm> list=openSession().createSQLQuery(sql).addEntity(Dorm.class).list();
	return list;
	
	
}
}
