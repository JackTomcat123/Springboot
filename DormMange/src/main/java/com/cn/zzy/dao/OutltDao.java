package com.cn.zzy.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.cn.util.BaseDao;
import com.cn.zzy.entity.Outlt;
@Component
public class OutltDao extends BaseDao<Outlt>{
	//ͨ����ʦ��id��ѯѧ���ύ����Ϣ
public List<Outlt> findMsgByTid(Outlt entity){
	String sql="select  * from outlt o  LEFT JOIN teacher t on o.teachid=t.teachId where o.flag=0 and t.teachid="+entity.getTeach().getTeachId();
	List<Outlt> list= openSession().createSQLQuery(sql).addEntity(Outlt.class).list();
	System.out.println(sql);
	return list;
}
//ͨ��ѧ����Id��ѯִ����Ϣ
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
//�޹ܲ�ѯ��Ϣ
public List<Outlt>findMsgByDid(){
	String sql="select * from outlt o where o.flag=2 ";
	List<Outlt> list=openSession().createSQLQuery(sql).addEntity(Outlt.class).list();
	System.out.println(sql);
	return list;
}
}
