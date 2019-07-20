package com.cn.zzy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cn.util.BaseAction;
import com.cn.zzy.entity.ChargeType;
import com.cn.zzy.service.ChargeTypeService;



@Controller
public class ChargeTypeAction extends BaseAction
{
	 @Autowired
     ChargeTypeService svr;
	 
	 List<ChargeType> list;
	 ChargeType entity=new ChargeType();
	 
	 
	 public String save() {
		 svr.save(entity);
		 return "findAll";
	 }
	 
	 public String update() {
		 svr.update(entity);
		 return "findAll";
	 }
	 
	 public String delete() {
		 svr.delete(entity);
		 return "findAll";
	 }
	 
	 public void updateflag() {
		 svr.updateflag(entity);
		 out().write("½É·Ñ³É¹¦!");
	 }
	 
	 public String toUpdate() {
		 entity=svr.findOne(entity);
		 return "update";
	 }
	 
	 public String findAll() {
		 list=svr.findAll();
		 return "list";
	 }

	public List<ChargeType> getList()
	{
		return list;
	}

	public void setList(List<ChargeType> list)
	{
		this.list = list;
	}

	public ChargeType getEntity()
	{
		return entity;
	}

	public void setEntity(ChargeType entity)
	{
		this.entity = entity;
	}
	 
	 
}
