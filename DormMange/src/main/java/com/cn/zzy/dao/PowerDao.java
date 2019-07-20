package com.cn.zzy.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.cn.util.BaseDao;
import com.cn.zzy.entity.Power;
import com.cn.zzy.entity.Users;
@Component
@Transactional(readOnly=false)
public class PowerDao extends BaseDao<Power>{
	@Autowired
	HibernateTemplate dao;
	//查询该登陆用户对应的权力
	public List<Power> findPowerByLogin(Users entity)
	{
		
		
		
		String sql = "select * from power where p_id in\r\n" + 
				"(\r\n" + 
				"	select distinct p.p_id from users u inner join users_role ur on u.u_id=ur.u_id\r\n" + 
				"	inner join role r on ur.r_id = r.r_id\r\n" + 
				"	inner join role_power rp on r.r_id = rp.r_id\r\n" + 
				"	inner join power p on p.p_id = rp.p_id\r\n" + 
				"	where u.u_name = '"+entity.getU_name()+"' and u.u_pass = '"+entity.getU_pass()+"'\r\n" + 
				") and p_mgr = 0";
		Session session = factory.openSession();
		
		@SuppressWarnings("unchecked")
		Query<Power> query = session.createSQLQuery(sql).addEntity(Power.class);
		
		List<Power> list = query.list();
		
		session.close();
		
		
		return list;
	}
	//通过父级菜单查询子级菜单
	public List<Power> findPowerMgrById(Power entity)
	{
		List<Power> list =(List<Power>) dao.find("from Power  p where p.p_mgr = "+entity.getP_id());
		return list;
		
	}
	
	
	
}
