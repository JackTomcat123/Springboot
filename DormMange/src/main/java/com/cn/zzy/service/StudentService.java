package com.cn.zzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.StudentDao;
import com.cn.zzy.entity.Outlt;
import com.cn.zzy.entity.Student;
import com.cn.zzy.entity.Teacher;

@Service
public class StudentService extends BaseService<Student>{
@Autowired
StudentDao dao;
	@Override
	public BaseDao<Student> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}

	public String findbylike(Student entity) {
	
		List<Student> list=dao.findbylike(entity);
		StringBuffer buffer = new StringBuffer();//type="hidden"
		if(list.size()==0) {
			buffer.append("<script type=\"text/javascript\">\r\n" + 
					"alert('请正确按照查询方法查询！');\r\n" + 
					"$(\"#str\").val('');\r\n" + 
					"</script>");
			
		}else {
		buffer.append("<table style=\"width:800px;\"  class=\"layui-table\"><tr ><td>学号</td><td>姓名</td><td>性别</td><td>班级</td><td>辅导员</td><td>操作</td></tr>");
		for(Student s: list) {
	         
			buffer.append("<tr>\r\n" + 
					"<td>"+s.getStuNum()+"</td><td>"+s.getStuName()+"</td><td>"+s.getSex()+"</td><td>"+s.getClazz().getClassName()+"</td><td>"+s.getClazz().getTeacher().getTeachName()+"</td><td><a href=\"DepartStudent?stu.stuId="+s.getStuId()+"\"class=\"layui-btn layui-btn-radius\">入住</a></td></tr>");
	         
		}
	buffer.append("</table>");
		}
	
		return buffer.toString();
		
		
	}

	public String findbylike1(Student entity) {
	
		List<Student> list=dao.findbylike1(entity);
		StringBuffer buffer = new StringBuffer();//type="hidden"
		if(list.size()==0) {
			buffer.append("<script type=\"text/javascript\">\r\n" + 
					"alert('请正确按照查询方法查询！');\r\n" + 
					"$(\"#str\").val('');\r\n" + 
					"</script>");
			
		}else {
		buffer.append("<table id=\"table2\" style=\"width:800px;\"  class=\"layui-table\"><tr ><td>学号</td><td>姓名</td><td>性别</td><td>班级</td><td>辅导员</td><td>操作</td></tr>");
		for(Student s: list) {
	         
			buffer.append("<tr>\r\n" + 
					"<td>"+s.getStuNum()+"</td><td>"+s.getStuName()+"</td><td>"+s.getSex()+"</td><td>"+s.getClazz().getClassName()+"</td><td>"+s.getClazz().getTeacher().getTeachName()+"</td><td><a href=\"findOutlt?stuid="+s.getStuId()+"\"   class=\"layui-btn layui-btn-radius\">查询</a></td></tr>");
	         
		}
	buffer.append("</table>");
		}
	
		return buffer.toString();
		
		
	}
	public List<Student> findStudentbyId(Student entity){
		
	return dao.findStudentbyId(entity);
	}
	public String findPersonbydid(Student entity) {
		List<Student> list=dao.findPersonbydid(entity);
		StringBuffer buffer = new StringBuffer();//type="hidden"
		if(list.size()==0) {
       	 buffer.append("<center><h1><font color=\"red\">该宿舍设备完善,但暂无居住学生,欢迎随时居住！</font></h1><center>");
        }else if(list.size()!=0){
		
		buffer.append("<table class=\"layui-table\"><tr ><td>学号</td><td>姓名</td><td>性别</td><td>班级</td><td>辅导员</td></tr>");
		for(Student s: list) {
	         
			buffer.append("<tr>\r\n" + 
					"<td>"+s.getStuNum()+"</td><td>"+s.getStuName()+"</td><td>"+s.getSex()+"</td><td>"+s.getClazz().getClassName()+"</td><td>"+s.getClazz().getTeacher().getTeachName()+"</td></tr>");
	        
		}
        }
	buffer.append("</table>");
		return buffer.toString();
	}
	//添加宿舍
	public void updateBid(Student entity) {
		
		dao.updateBid(entity);
	}
	//查询学生个人信息
	public String findStuSelf(Student entity) {
		List<Student> list=dao.findStudentbyId(entity);
		StringBuffer buffer = new StringBuffer();
		for(Student  s:list) {
			
			buffer.append("<table class=\"layui-table\" style=\"width:600px;\">");
			buffer.append("<tr><td>学号</td><td>"+s.getStuNum()+"</td></tr>");
			buffer.append("<tr><td>姓名</td><td>"+s.getStuName()+"</td></tr>");
			buffer.append("<tr><td>性别</td><td>"+s.getSex()+"</td></tr>");
			buffer.append("<tr><td>班级</td><td>"+s.getClazz().getClassName()+"</td></tr>");
			buffer.append("<tr><td>辅导员</td><td>"+s.getClazz().getTeacher().getTeachName()+"</td></tr>");
			if(s.getDormStartDate()!=null) {
			buffer.append("<tr><td>宿舍</td><td>"+s.getDorm().getBuild().getBuildname()+","+s.getDorm().getDormNum()+"</td></tr>");
			buffer.append("<tr><td align=\"center\" colspan=\"2\"><a href=\"javascript:void(0)\" class=\"layui-btn layui-btn-radius\" onclick=\"out("+s.getStuId()+","+s.getClazz().getTeacher().getTeachId()+","+s.getDorm().getDormId()+")\">申请退宿</a><a class=\"layui-btn layui-btn-normal layui-btn-radius\" href=\"javascript:void(0)\" class=\"layui-layer-close\" onclick=\"change("+s.getStuId()+","+s.getClazz().getTeacher().getTeachId()+","+s.getDorm().getDormId()+")\">申请转宿舍</a></td></tr>");
			}
			buffer.append("</table>");
		}
		return buffer.toString();
		
		
		
	}
	
}

