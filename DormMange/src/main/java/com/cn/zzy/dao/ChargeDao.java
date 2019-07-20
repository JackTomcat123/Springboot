package com.cn.zzy.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.cn.util.BaseDao;
import com.cn.zzy.entity.Charge;

@Component
public class ChargeDao extends BaseDao<Charge>{
//通过stuid查询缴费
	public List<Charge> findChargeBystuid(Charge entity){
		
		String sql="select * from charge c LEFT JOIN student s on c.fk_stuId=s.stuId\r\n" + 
				"LEFT JOIN teacher t on c.fk_teachId=t.teachId LEFT JOIN dormtype d\r\n" + 
				"on c.fk_typeId=d.typeId where s.stuId="+entity.getStu().getStuId();
		List<Charge> list=openSession().createSQLQuery(sql).addEntity(Charge.class).list();
		return list;
	}
}
