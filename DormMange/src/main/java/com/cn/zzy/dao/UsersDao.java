package com.cn.zzy.dao;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.cn.util.BaseDao;
import com.cn.zzy.entity.Users;
@Component
@Transactional(readOnly=false)
public class UsersDao extends BaseDao<Users>
{
	@Autowired
HibernateTemplate dao;
	
	public Users login(Users entity)
	{
		
		
		@SuppressWarnings("unchecked")
		List<Users> list=(List<Users>) dao.find("from Users u where u.u_name='"+entity.getU_name()+"' and u.u_pass='"+entity.getU_pass()+"'");
		
		if(list.size() > 0)
			return list.get(0);
		else 
			return null;
		
	}
}
