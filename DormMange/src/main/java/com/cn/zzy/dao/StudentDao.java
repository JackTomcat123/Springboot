package com.cn.zzy.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cn.util.BaseDao;
import com.cn.zzy.entity.Student;
@Component
public class StudentDao extends BaseDao<Student>{
public List<Student> findbylike(Student entity){
	
	String sql="select * from  student s left join classinfo c on s.fk_classId=c.classId \r\n" + 
			"left join teacher t on t.teachId=c.fk_teachId where s.flag=0 and (s.stuNum = '"+entity.getStuNum()+"' or s.stuName ='"+entity.getStuName()+"' or s.sex = '"+entity.getSex()+"')";
	List<Student> list=openSession().createSQLQuery(sql).addEntity(Student.class).list();
	return list;
}
public List<Student> findbylike1(Student entity){
	
	String sql="select * from  student s left join classinfo c on s.fk_classId=c.classId \r\n" + 
			"left join teacher t on t.teachId=c.fk_teachId where s.flag=1 and (s.stuNum = '"+entity.getStuNum()+"' or s.stuName ='"+entity.getStuName()+"' or s.sex = '"+entity.getSex()+"')";
	List<Student> list=openSession().createSQLQuery(sql).addEntity(Student.class).list();
	return list;
}
public List<Student> findStudentbyId(Student entity){
	String sql="select * from  student s left join classinfo c on s.fk_classId=c.classId \r\n" + 
			"left join teacher t on t.teachId=c.fk_teachId where s.stuId="+entity.getStuId();
	
	List<Student> list=openSession().createSQLQuery(sql).addEntity(Student.class).list();
	return list;
	
	
	
}
//≤È—ØÀﬁ…·renkou
public List<Student> findPersonbydid(Student entity){
	
	
	String sql="select * from student s  where s.fk_dormId="+entity.getDorm().getDormId();
	List<Student> list=openSession().createSQLQuery(sql).addEntity(Student.class).list();
	return list;
	
	
}
//ÃÌº”Àﬁ…·
public void updateBid(Student entity) {

	//System.out.println(entity.getDorm().getDormId());
	//System.out.println(entity.getStuId());
//	Session session =factory.openSession();
//	String sql="update Student s set s.flag=1, s.dorm.dormId="+entity.getDorm().getDormId()+" where s.stuId= "+entity.getStuId();
//	//=session.createSQLQuery(sql).addEntity(Student.class).executeUpdate();
//     Query<Student> q=session.createSQLQuery(sql).addEntity(Student.class);
//     int count=q.executeUpdate();
//     if(count==1) {
//    	 Transaction tn=session.beginTransaction();
// 		tn.commit();
// 		session.close(); 
//    	 
//     }
}


}
