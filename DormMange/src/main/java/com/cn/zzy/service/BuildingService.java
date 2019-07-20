package com.cn.zzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.BuildingDao;
import com.cn.zzy.entity.Building;
import com.cn.zzy.entity.Student;



@Service
public class BuildingService extends BaseService<Building>
{
    @Autowired
	BuildingDao dao;
	

	@Override
	public BaseDao<Building> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	public String findBuildBySex(String sex) {
		
		List<Building> list=dao.findBuildBySex(sex);
		StringBuffer buffer = new StringBuffer();
		buffer.append("<br/><table  style=\"width: 300px;\"  class=\"layui-table\"><tr ><td>ËÞÉáÂ¥±àºÅ</td><td>²Ù×÷</td></tr>");
		for(Building b: list) {
	         
			buffer.append("<tr><td>"+b.getBuildname()+"</td><td><a href=\"javascript:void(0)\" onclick=\"findDorm('"+b.getBuildid()+"')\" class=\"layui-btn layui-btn-radius\">Ñ¡Ôñ·¿¼ä</a></td></tr>");
	         
		}
	buffer.append("</table>");
		return buffer.toString();
		
		
	}
	//Í¨¹ýÂ¥²ã²éÑ¯ËÞÉáÂ¥
	public String findbuildBysex(String sex) {
		List<Building> list=dao.findBuildBySex(sex);
		StringBuffer buffer = new StringBuffer();
		if(list.size()>0) {
			buffer.append("<select class=\"layui-input\" style=\"width: 200px;\"onchange=\"dorm(this.value)\">\r\n" + 
					"<option value=\"1=1\">--ÇëÑ¡Ôñ--</option>\r\n");
			for(Building b:list) {
				
				buffer.append("<option value="+b.getBuildid()+">"+b.getBuildname()+"</option>");
			}
			buffer.append("</select>");
		}
		
		
		return buffer.toString();
		
		
	}
   
}
