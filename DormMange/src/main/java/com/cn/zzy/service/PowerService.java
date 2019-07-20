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
		if(list == null || list.size() == 0)return "û���Ӳ˵�";
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("<table class=\"layui-table\" style=\"width: 80%;\" border=\"1\">\r\n" + 
				"				<tr>\r\n" + 
				"					<td>���</td>\r\n" + 
				"					<td>����</td>\r\n" + 
				"					<td>����</td>\r\n" + 
				"				</tr>\r\n" ); 
				for(Power p : list)
				{
					buffer.append(	"					<tr>\r\n" + 
							"						<td>"+p.getP_id()+"</td>\r\n" + 
							"						<td>\r\n" + 
							"							<a href=\"javascript:void(0)\" onclick=\"showView("+p.getP_id()+")\">"+p.getP_name()+"</a>\r\n" + 
							"						</td>\r\n" + 
							"						<td>\r\n" + 
							"							<a href=\"javascript:void(0)\" onclick=\"showSave("+p.getP_id()+",'"+p.getP_name()+"')\">����Ӳ˵�</a>\r\n" + 
							"							<a href=\"javascript:void(0)\" onclick=\"showUpdate("+p.getP_id()+",'"+p.getP_name()+"','"+p.getP_url()+"',"+p.getP_mgr()+")\">�޸Ĳ˵�</a>\r\n" + 
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
	//����entity��ID Ϊ0 ��ô��һ�β�ѯ�����Ľ��Ϊһ���˵�
		public String findPowerMgrById3(Power entity,Role role)
		{
			//���ݽ�ɫ����øý�ɫ��Ӧ��Ȩ��
			List<Power> myList = role.getPower();
			
			//�����û�ѡ���Ȩ������ѯ��Ȩ���µ���Ȩ��
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
