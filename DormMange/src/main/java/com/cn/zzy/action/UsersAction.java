package com.cn.zzy.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cn.zzy.entity.Role;
import com.cn.zzy.entity.Users;
import com.cn.zzy.service.PowerService;
import com.cn.zzy.service.RoleService;
import com.cn.zzy.service.UsersService;

@Controller
public class UsersAction
{
	@Autowired
	UsersService svr;
	@Autowired
	RoleService roleSvr;
	@Autowired
    PowerService powerSvr;
	 List<Users> list;
	 List<Role> roleList;
	 List<Role> role;
	 Users entity = new Users();
	 String msg;
	 int[] roles;
	
	public String findAll()
	{
		list = svr.findAll();
		
		return "list";
	}
	
	public String save()
	{
		svr.save(entity);
		System.out.println("sAVE");
		return "findAll";
		
	}
	public String delete()
	{
		svr.delete(entity);
		
		return "findAll";
		
	}
	
	public String update()
	{
		svr.update(entity);
		
		return "findAll";
		
	}
	
	public String toUpdate()
	{
		entity = svr.findOne(entity);
		
		return "update";
		
	}
	public String view()
	{
		entity = svr.findOne(entity);
		
		return "view";
		
	}
	//用户登录
	public String login()
	{
//		System.out.println("befor");
		entity = svr.login(entity);
//		System.out.println("login");
		if(entity == null)
		{
			msg = "账户或者密码错误";
			return "error";
		}
		else
		{
			ServletActionContext.getRequest().getSession().setAttribute("ENTITY", entity);
			ServletActionContext.getRequest().getSession().setAttribute("POWER", powerSvr.findPowerByLogin(entity));
			return "success";
		}
		
		
	}
	//去分配角色
	public String toRole()
	{
		entity = svr.findOne(entity);
        role=entity.getRole();
		roleList = roleSvr.findAll();
		
		return "toRole";
		
	}
	//分配角色
	
	public String role()
	{
		entity = svr.findOne(entity);
		entity.setRole(new ArrayList<Role>());
		svr.update(entity);
		if(roles != null && roles.length > 0)
		{
			
			
			
			for(int rid : roles)
			{
				Role r = new Role();
				r.setR_id(rid);
				
				r = roleSvr.findOne(r);
				//设置级联关系
				entity.getRole().add(r);
			}
			svr.update(entity);
		}
		return "findAll";
	}
	

	// ~ Get And Set
	public List<Users> getList()
	{
		return list;
	}

	public void setList(List<Users> list)
	{
		this.list = list;
	}

	public Users getEntity()
	{
		return entity;
	}

	public void setEntity(Users entity)
	{
		this.entity = entity;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public List<Role> getRoleList()
	{
		return roleList;
	}

	public void setRoleList(List<Role> roleList)
	{
		this.roleList = roleList;
	}

	public int[] getRoles()
	{
		return roles;
	}

	public void setRoles(int[] roles)
	{
		this.roles = roles;
	}

	public List<Role> getRole() {
		return role;
	}

	public void setRole(List<Role> role) {
		this.role = role;
	}
	
	
	
}
