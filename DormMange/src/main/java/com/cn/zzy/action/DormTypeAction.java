package com.cn.zzy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cn.zzy.entity.DormType;
import com.cn.zzy.service.DormTypeService;


@Controller
public class DormTypeAction 
{ 
	    @Autowired
		DormTypeService svr;
		
		List<DormType> list;
		DormType entity=new DormType();
		
		
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
		
		public String toUpdate() {
			 entity=svr.findOne(entity);
			 return "update";
		}
		
		public String findAll() {
			 list=svr.findAll();
			 return "list";
		}

		public List<DormType> getList()
		{
			return list;
		}

		public void setList(List<DormType> list)
		{
			this.list = list;
		}

		public DormType getEntity()
		{
			return entity;
		}

		public void setEntity(DormType entity)
		{
			this.entity = entity;
		}
		
		
    
}
