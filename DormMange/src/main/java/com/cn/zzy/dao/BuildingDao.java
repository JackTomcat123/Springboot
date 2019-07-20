package com.cn.zzy.dao;
import java.util.List;

import org.springframework.stereotype.Component;
import com.cn.util.BaseDao;
import com.cn.zzy.entity.Building;
@Component
public class BuildingDao extends BaseDao<Building>
{
	//ͨ���Ա��ѯ����¥
    public List<Building> findBuildBySex(String sex){
    	String sql="select DISTINCT b.buildId,b.*  from building b LEFT JOIN dorm d on d.fk_buildid=b.buildId\r\n" + 
    			"LEFT JOIN dormtype t on t.typeId=d.fk_typeId where t.sex='"+sex+"'";
    	List<Building> list=openSession().createSQLQuery(sql).addEntity(Building.class).list();
		return list;
    	
    	
    }
    
}
