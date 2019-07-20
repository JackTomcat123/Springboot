package com.cn.zzy.action;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cn.zzy.entity.Power;
import com.cn.zzy.entity.Role;
import com.cn.zzy.service.PowerService;
import com.cn.zzy.service.RoleService;

@Controller
public class RoleAction
{
	@Autowired
	RoleService svr;
    @Autowired
     PowerService psvr;
	 List<Role> list;
	 List<Power> plist;
	 List<Power> p;
	 Role entity = new Role();
	 String msg;
	int[] pid;
	public String findAll()
	{
		list = svr.findAll();
		
		return "list";
	}
	
	public String save()
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
	//去分配权力
	public String toPower() {
		entity=svr.findOne(entity);
		plist = psvr.findAll();
		p=entity.getPower();
		return "toPower";
	}
	//分配权力
	public String Power() {
		entity = svr.findOne(entity);
		entity.setPower(new ArrayList<Power>());
		svr.update(entity);
		if(pid != null && pid.length > 0)
		{
			
			
			
			for(int id : pid)
			{
				
				Power p=new Power();
				p.setP_id(id);
				
				p = psvr.findOne(p);
				//设置级联关系
				entity.getPower().add(p);
			}
			svr.update(entity);
		}
		return "findAll";
	}
	public String toPower3()
	{
		//自己的角色和角色对应的权利
		entity = svr.findOne(entity);
		
		return "toPower3";
		
	}
	// ~ Get And Set ===========>>>
	public List<Role> getList()
	{
		return list;
	}

	public void setList(List<Role> list)
	{
		this.list = list;
	}

	public Role getEntity()
	{
		return entity;
	}

	public void setEntity(Role entity)
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

	public List<Power> getPlist() {
		return plist;
	}

	public void setPlist(List<Power> plist) {
		this.plist = plist;
	}

	public int[] getPid() {
		return pid;
	}

	public void setPid(int[] pid) {
		this.pid = pid;
	}

	public List<Power> getP() {
		return p;
	}

	public void setP(List<Power> p) {
		this.p = p;
	}
	
	
	
}
