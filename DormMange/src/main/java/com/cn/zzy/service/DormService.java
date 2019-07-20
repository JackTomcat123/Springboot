package com.cn.zzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.DormDao;
import com.cn.zzy.entity.Building;
import com.cn.zzy.entity.Dorm;
@Service
public class DormService extends BaseService<Dorm>{

	@Autowired
	DormDao dao;
	@Override
	public BaseDao<Dorm> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	public String findDormBybid(Dorm entity){
		List<Dorm> list=dao.findDormBybid(entity);
		StringBuffer buffer = new StringBuffer();
		buffer.append("<div id=\"person\" style=\"width: 800px; overflow: hidden;\" >");
		for(Dorm d: list) {//class=\"layui-table\" type="hidden"
	       
			if(d.getPersonCount()==d.getType().getPersoncount()) {
				  buffer.append("<div style=\"width:200px; height:60px;  background-color:tomato; margin: 10px; float: left;\">"+d.getBuild().getBuildname()+""+d.getDormNum()+"室"
						  
			         		+ ""+d.getType().getTypename()+""+d.getPersonCount()+"/"+d.getType().getPersoncount()+""+d.getType().getSex()+""+""+d.getType().getPrice()+"/年"
			         				+ "<a href=\"javascript:void(0)\" class=\"layui-btn layui-btn-normal layui-btn-radius\" onclick=\"over()\">入住</a>&nbsp;<a href=\"javascript:void(0)\"  onclick=\"findPerson("+d.getDormId()+")\" class=\"layui-btn layui-btn-radius\">详情</a>\r\n" + 
			         						"</div>");
			}else if(d.getPersonCount()!=d.getType().getPersoncount()) {
				
				buffer.append("<div style=\"width:200px; height:60px;  background-color: aquamarine; margin: 10px; float: left;\">"+d.getBuild().getBuildname()+""+d.getDormNum()+"室"
		         		+ ""+d.getType().getTypename()+""+d.getPersonCount()+"/"+d.getType().getPersoncount()+""+d.getType().getSex()+""+""+d.getType().getPrice()+"/年"
		         				+ "<a href=\"javascript:void(0)\"class=\"layui-btn layui-btn-normal layui-btn-radius\"onclick=\"Incharge("+d.getType().getTypeid()+","+d.getDormId()+","+d.getType().getPrice()+")\">入住</a>&nbsp;<a href=\"javascript:void(0)\" onclick=\"findPerson("+d.getDormId()+")\" class=\"layui-btn layui-btn-radius\">详情</a>\r\n" + 
		         						"</div>");	
			}
		}
	buffer.append("</div><br/><br/>");
		return buffer.toString();
	}
	public String findDormByBid(Dorm entity) {
		
		List<Dorm> list=dao.findDormBybid(entity);
		StringBuffer buffer = new StringBuffer();
		if(list.size()>0) {
			buffer.append("<select class=\"layui-input\" style=\"width: 200px;\" onchange=\"detil(this.value)\">\r\n" + 
					"<option value=\"1=1\">--请选择--</option>\r\n");
			for(Dorm d:list) {
				buffer.append("<option value="+d.getDormId()+">"+d.getDormNum()+"</option>");
			}
			buffer.append("</select>");
		}
		return buffer.toString();
		
	}
	public String findDormById(Dorm entity) {
		List<Dorm> list=dao.findDormBId(entity);
		StringBuffer buffer=new StringBuffer();
		if(list.size()>0) {
			buffer.append("<table class=\"layui-table\">\r\n" + 
					"<tr>\r\n" + 
					"<td>宿舍楼号</td>\r\n" + 
					"<td>宿舍编号</td>\r\n" + 
					"<td>宿舍类型</td>\r\n" + 
					"<td>宿舍单价/年</td>\r\n" + 
					"<td>可住人数</td>\r\n" + 
					"<td>实住人数</td>\r\n" + 
					"<td>宿舍状态</td>\r\n" + 
					"<td>操作</td>\r\n" + 
					"</tr>");
			for(Dorm d:list) {
				buffer.append("<tr>");
				buffer.append("<input type=\"hidden\" id=\"ntype\" value="+d.getType().getTypename()+">");
				buffer.append("<input type=\"hidden\" id=\"ndid\" value="+d.getDormId()+">");
				buffer.append("<td>"+d.getBuild().getBuildname()+"</td><td>"+d.getDormNum()+"</td><td>"+d.getType().getTypename()+"</td><td>"+d.getType().getPrice()+"</td>"
						+ "<td>"+d.getType().getPersoncount()+"</td><td>"+d.getPersonCount()+"</td>");
				if(d.getPersonCount()<d.getType().getPersoncount()) {
					
					buffer.append("<td>未住满</td>");
					buffer.append("<td><a class=\"layui-btn layui-btn-normal layui-btn-radius\" href=\"javascript:void(0)\" onclick=\"change("+d.getDormId()+")\">入住</a></td>");
				}else {
					buffer.append("<td>已住满</td>");
					buffer.append("<td><a class=\"layui-btn layui-btn-normal layui-btn-radius\" href=\"javascript:void(0)\" onclick=\"Nochange("+d.getDormId()+")\">驳回</a></td>");
				}
				buffer.append("</tr>");
			}
			buffer.append("</table>");
		}
		return buffer.toString();
	}
	
	//财务查看
	public String findDormById2(Dorm entity) {
		List<Dorm> list=dao.findDormBId(entity);
		StringBuffer buffer=new StringBuffer();
		if(list.size()>0) {
			buffer.append("<table class=\"layui-table\">\r\n" + 
					"<tr>\r\n" + 
					"<td>宿舍楼号</td>\r\n" + 
					"<td>宿舍编号</td>\r\n" + 
					"<td>宿舍类型</td>\r\n" + 
					"<td>宿舍单价/年</td>\r\n" + 
					"<td>可住人数</td>\r\n" + 
					"<td>实住人数</td>\r\n" + 
					"<td>宿舍状态</td>\r\n" + 
					"<td>操作</td>\r\n" + 
					"</tr>");
			for(Dorm d:list) {
				buffer.append("<tr>");
				buffer.append("<input type=\"hidden\" id=\"ntype\" value="+d.getType().getTypename()+">");
				buffer.append("<input type=\"hidden\" id=\"ndid\" value="+d.getDormId()+">");
				buffer.append("<input type=\"hidden\" id=\"nprice\" value="+d.getType().getPrice()+">");
				buffer.append("<td>"+d.getBuild().getBuildname()+"</td><td>"+d.getDormNum()+"</td><td>"+d.getType().getTypename()+"</td><td>"+d.getType().getPrice()+"</td>"
						+ "<td>"+d.getType().getPersoncount()+"</td><td>"+d.getPersonCount()+"</td>");
				if(d.getPersonCount()<d.getType().getPersoncount()) {
					
					buffer.append("<td>未住满</td>");
					buffer.append("<td><a href=\"javascript:void(0)\"class=\"layui-btn layui-btn-normal layui-btn-radius\" onclick=\"pay("+d.getDormId()+")\">入住</a></td>");
				}else {
					buffer.append("<td>已住满</td>");
				}
				buffer.append("</tr>");
			}
			buffer.append("</table>");
		}
		return buffer.toString();
	}
}
