package com.cn.zzy.action;
import java.io.IOException;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.cn.util.BaseAction;
import com.cn.zzy.entity.Power;
import com.cn.zzy.entity.Role;
import com.cn.zzy.service.PowerService;
import com.cn.zzy.service.RoleService;
@Controller
public class PowerAction extends BaseAction
{
	@Autowired
	PowerService svr;
Power entity=new Power();
List<Power> list;
	 
	 String msg;
	 Role role=new Role();
	 @Autowired
	 RoleService roleSvr;
	
	public String findAll()
	{
		list = svr.findAll();
		
		return "list";
	}
	
	public String save() throws IOException
	{
		svr.save(entity);
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
	//去添加子菜单，显示一级菜单
	public String Addmenu() {
		entity.setP_mgr(0);
		list=svr.NoOne(entity);
		return "Add";
	}
	//添加子菜单
	public void ajaxSave()
	{
		svr.save(entity);
		
		out().write("添加成功");
	}
	//修改子菜单
	public void ajaxUpdate()
	{
		svr.update(entity);
		
		out().write("修改成功");
	}
	//显示子菜单
	public void ajaxView()
	{
		out().write(svr.findChildMenu(entity));
		
	}
	//根据一级菜单id查询子菜单
	public void findPowerMgrById()
	{
		try
		{
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(svr.findPowerMgrById(entity));
		} catch (IOException e)
		{
			e.printStackTrace();
		};
		
	}
	//根据相应的角色查询相应的一级菜单
	public void findPowerMgrById3()
	{
		
		role = roleSvr.findOne(role);
		System.out.println(role);
		try
		{
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().write(svr.findPowerMgrById3(entity,role));
		} catch (IOException e)
		{
			e.printStackTrace();
		};
		
	}
	// ~ Get And Set ===========>>>
	
	public String getMsg()
	{
		return msg;
	}

	public Power getEntity() {
		return entity;
	}

	public void setEntity(Power entity) {
		this.entity = entity;
	}

	public List<Power> getList() {
		return list;
	}

	public void setList(List<Power> list) {
		this.list = list;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	
	
}
