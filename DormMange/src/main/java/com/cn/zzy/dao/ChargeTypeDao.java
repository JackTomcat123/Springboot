package com.cn.zzy.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Component;

import com.cn.util.BaseDao;
import com.cn.zzy.entity.ChargeType;


@Component
public class ChargeTypeDao extends BaseDao<ChargeType>
{
    public void updateflag(ChargeType entity){
    	Session session=factory.openSession();
    	Transaction tn=session.beginTransaction();
    	String sql="update chargetype c set c.flag=1 where c.typeid = "+entity.getTypeid()+"";
    	@SuppressWarnings("unchecked")
		Query<ChargeType> query=session.createSQLQuery(sql);
        query.executeUpdate();
        tn.commit();
    	session.close();
   }
}
