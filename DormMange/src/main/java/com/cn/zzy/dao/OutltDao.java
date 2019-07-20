package com.cn.zzy.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.cn.util.BaseDao;
import com.cn.zzy.entity.Outlt;
@Component
public class OutltDao extends BaseDao<Outlt>{
	//通过老师的id查询学生提交的信息
public List<Outlt> findMsgByTid(Outlt entity){
	String sql="select  * from outlt o  LEFT JOIN teacher t on o.teachid=t.teachId where o.flag=0 and t.teachid="+entity.getTeach().getTeachId();
	List<Outlt> list= openSession().createSQLQuery(sql).addEntity(Outlt.class).list();
	System.out.println(sql);
	return list;
}
//通过学生的Id查询执行信息
public List<Outlt>findMsgByStuid(Outlt entity){
	String sql="select * from outlt o where stuid="+entity.getStu().getStuId();
	List<Outlt> list=openSession().createSQLQuery(sql).addEntity(Outlt.class).list();
	return list;
}
public List<Outlt>findMsgByStuid2(Outlt entity){
	String sql="select * from outlt o where  stuid="+entity.getStu().getStuId();
	List<Outlt> list=openSession().createSQLQuery(sql).addEntity(Outlt.class).list();
	return list;
}
//宿管查询信息
public List<Outlt>findMsgByDid(){
	String sql="select * from outlt o where o.flag=2 ";
	List<Outlt> list=openSession().createSQLQuery(sql).addEntity(Outlt.class).list();
	System.out.println(sql);
	return list;
}
}
