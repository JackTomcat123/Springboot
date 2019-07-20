package com.cn.zzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.PowerDao;
import com.cn.zzy.entity.Power;
import com.cn.zzy.entity.Role;
import com.cn.zzy.entity.Users;
@Service
public class PowerService extends BaseService<Power>{

	@Autowired
	PowerDao dao;
	@Override
	public BaseDao<Power> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	public List<Power>  NoOne(Power entity) {
		return dao.findPowerMgrById(entity);
	}
	public String findChildMenu(Power entity)
	{
		List<Power> list = dao.findPowerMgrById(entity);
		if(list == null || list.size() == 0)return "没有子菜单";
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("<table class=\"layui-table\" style=\"width: 80%;\" border=\"1\">\r\n" + 
				"				<tr>\r\n" + 
				"					<td>编号</td>\r\n" + 
				"					<td>名称</td>\r\n" + 
				"					<td>操作</td>\r\n" + 
				"				</tr>\r\n" ); 
				for(Power p : list)
				{
					buffer.append(	"					<tr>\r\n" + 
							"						<td>"+p.getP_id()+"</td>\r\n" + 
							"						<td>\r\n" + 
							"							<a href=\"javascript:void(0)\" onclick=\"showView("+p.getP_id()+")\">"+p.getP_name()+"</a>\r\n" + 
							"						</td>\r\n" + 
							"						<td>\r\n" + 
							"							<a href=\"javascript:void(0)\" onclick=\"showSave("+p.getP_id()+",'"+p.getP_name()+"')\">添加子菜单</a>\r\n" + 
							"							<a href=\"javascript:void(0)\" onclick=\"showUpdate("+p.getP_id()+",'"+p.getP_name()+"','"+p.getP_url()+"',"+p.getP_mgr()+")\">修改菜单</a>\r\n" + 
							"						</td>\r\n" + 
							"					</tr>\r\n" );
					
				}
			 
				buffer.append("			</table>");
		
		return buffer.toString();
		
	}
	
	
	public List<Power> findPowerByLogin(Users entity)
	{
		return dao.findPowerByLogin(entity);
	}
	
	public String findPowerMgrById(Power entity)
	{
		List<Power> list = dao.findPowerMgrById(entity);
		if(list == null || list.size() == 0)
			return null;
		StringBuffer buffer = new StringBuffer();
		buffer.append("	<dl class=\"layui-nav-child\">");
		for(Power p : list)
		{
			buffer.append(" <dd>");
			buffer.append("<a target=\"main\" href='"+p.getP_url()+"'>");
			buffer.append(p.getP_name());
			buffer.append("</a>");
			buffer.append("</dd>");
		}
		buffer.append("</dl>");
		
		return buffer.toString();
	}
	//假设entity的ID 为0 那么第一次查询出来的结果为一级菜单
		public String findPowerMgrById3(Power entity,Role role)
		{
			//根据角色，获得该角色对应的权利
			List<Power> myList = role.getPower();
			
			//根据用户选择的权利，查询该权利下的子权利
			List<Power> list = dao.findPowerMgrById(entity);
			
			if(list == null || list.size() == 0)return "";
			
			StringBuffer buffer = new StringBuffer();
			buffer.append("<ul style=\"list-style: none\">");
			for(Power p : list)
			{
				String str = "";
				for(Power p2 : myList)
				{
					if(p.getP_id() == p2.getP_id())
					{
						str = "checked='checked'";
					}
					
				}
				buffer.append("<li><input type='checkbox' "+str+"  name='pid' value='"+p.getP_id()+"' /><a href='"+p.getP_url()+"'>");
				buffer.append(p.getP_name());
				buffer.append("</a><br />");
				buffer.append("<span id=\"100-"+p.getP_id()+"\">");
				// pid = 1 3 8
				buffer.append(findPowerMgrById3(p,role));
				buffer.append("</span></li>");
				
			}
			buffer.append("</ul>");
			return buffer.toString();
		}
}
