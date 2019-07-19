package com.cn.zzy.controller;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.cn.zzy.dao.DeptDao;
import com.cn.zzy.entity.Emp;
import com.cn.zzy.service.EmpService;
import com.cn.zzy.util.Page;
@Controller
public class EmpController {
	@Autowired
	DeptDao dao;
	@Autowired 
	EmpService svr;
@RequestMapping("toInsert")
public String toInsert(Model m) {
	m.addAttribute("dlist", dao.findAll());
	return "save";
}
@RequestMapping("insert")
public String insert(Emp entity,MultipartFile image,HttpServletRequest req) {
	
	//获得服务器路径
			String url = req.getServletContext().getRealPath("/upload");
			//判断该路径的文件夹是否存在
			File f = new File(url);
			if(!f.exists())
			{
				f.mkdir();
			}
			Date d = new Date();
			Random r = new Random();
		/* System.out.println(UUID.randomUUID()); */
			//String fileName =r.nextInt(100)+d.getTime()+image.getOriginalFilename();
			String sub = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."), image.getOriginalFilename().length());
		/* System.out.println(sub); */
			String fileName = UUID.randomUUID()+image.getOriginalFilename();
			url = url + File.separator + fileName;
			
		/* System.out.println(url); */
			
			File newFile = new File(url);
			
			try
			{
				image.transferTo(newFile);
			} catch (IllegalStateException | IOException e)
			{
				e.printStackTrace();
			}
			
			entity.setImg(fileName);
			
			svr.insert(entity);
	
	return "redirect:/findAll";
}
@RequestMapping("findAll")
public String findAll(Model m,Page bean) {
	bean.setCount(svr.count());
	m.addAttribute("bean", bean);
	m.addAttribute("list", svr.findAll(bean));
	return "list";
}
@RequestMapping("delete")
public String delete(Emp entity)
{
	svr.delete(entity);
	return "redirect:/findAll";
}
@RequestMapping("toUpdate")
public String toUpdate(Emp entity,Model m) {
	m.addAttribute("entity",svr.toUpdate(entity));
	m.addAttribute("dlist",dao.findAll());
	return "update";
}
@RequestMapping("update")
public String update(Emp entity,MultipartFile image,HttpServletRequest req) {

	//获得服务器路径
	String url = req.getServletContext().getRealPath("/upload");
	//判断该路径的文件夹是否存在
	File f = new File(url);
	if(!f.exists())
	{
		f.mkdir();
	}
	Date d = new Date();
	Random r = new Random();
	String sub = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."), image.getOriginalFilename().length());
	String fileName = UUID.randomUUID()+image.getOriginalFilename();
	url = url + File.separator + fileName;
	File newFile = new File(url);
	try
	{
		image.transferTo(newFile);
	} catch (IllegalStateException | IOException e)
	{
		e.printStackTrace();
	}
	entity.setImg(fileName);
	svr.update(entity);
	return "redirect:/findAll";
}
@RequestMapping("findEmp")
@ResponseBody
	public List<Map<String,Object>> findEmp(Emp entity){
return  svr.findEmpbyDept(entity);
}
@RequestMapping(value = "Del")
	public String Del(int[] eids){
for(int id:eids){
Emp entity=new Emp();
entity.setEid(id);
	svr.delete(entity);
}
	return "redirect:/findAll";
}

}
