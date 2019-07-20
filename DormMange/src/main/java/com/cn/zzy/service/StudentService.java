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
					"alert('����ȷ���ղ�ѯ������ѯ��');\r\n" + 
					"$(\"#str\").val('');\r\n" + 
					"</script>");
			
		}else {
		buffer.append("<table style=\"width:800px;\"  class=\"layui-table\"><tr ><td>ѧ��</td><td>����</td><td>�Ա�</td><td>�༶</td><td>����Ա</td><td>����</td></tr>");
		for(Student s: list) {
	         
			buffer.append("<tr>\r\n" + 
					"<td>"+s.getStuNum()+"</td><td>"+s.getStuName()+"</td><td>"+s.getSex()+"</td><td>"+s.getClazz().getClassName()+"</td><td>"+s.getClazz().getTeacher().getTeachName()+"</td><td><a href=\"DepartStudent?stu.stuId="+s.getStuId()+"\"class=\"layui-btn layui-btn-radius\">��ס</a></td></tr>");
	         
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
					"alert('����ȷ���ղ�ѯ������ѯ��');\r\n" + 
					"$(\"#str\").val('');\r\n" + 
					"</script>");
			
		}else {
		buffer.append("<table id=\"table2\" style=\"width:800px;\"  class=\"layui-table\"><tr ><td>ѧ��</td><td>����</td><td>�Ա�</td><td>�༶</td><td>����Ա</td><td>����</td></tr>");
		for(Student s: list) {
	         
			buffer.append("<tr>\r\n" + 
					"<td>"+s.getStuNum()+"</td><td>"+s.getStuName()+"</td><td>"+s.getSex()+"</td><td>"+s.getClazz().getClassName()+"</td><td>"+s.getClazz().getTeacher().getTeachName()+"</td><td><a href=\"findOutlt?stuid="+s.getStuId()+"\"   class=\"layui-btn layui-btn-radius\">��ѯ</a></td></tr>");
	         
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
       	 buffer.append("<center><h1><font color=\"red\">�������豸����,�����޾�סѧ��,��ӭ��ʱ��ס��</font></h1><center>");
        }else if(list.size()!=0){
		
		buffer.append("<table class=\"layui-table\"><tr ><td>ѧ��</td><td>����</td><td>�Ա�</td><td>�༶</td><td>����Ա</td></tr>");
		for(Student s: list) {
	         
			buffer.append("<tr>\r\n" + 
					"<td>"+s.getStuNum()+"</td><td>"+s.getStuName()+"</td><td>"+s.getSex()+"</td><td>"+s.getClazz().getClassName()+"</td><td>"+s.getClazz().getTeacher().getTeachName()+"</td></tr>");
	        
		}
        }
	buffer.append("</table>");
		return buffer.toString();
	}
	//�������
	public void updateBid(Student entity) {
		
		dao.updateBid(entity);
	}
	//��ѯѧ��������Ϣ
	public String findStuSelf(Student entity) {
		List<Student> list=dao.findStudentbyId(entity);
		StringBuffer buffer = new StringBuffer();
		for(Student  s:list) {
			
			buffer.append("<table class=\"layui-table\" style=\"width:600px;\">");
			buffer.append("<tr><td>ѧ��</td><td>"+s.getStuNum()+"</td></tr>");
			buffer.append("<tr><td>����</td><td>"+s.getStuName()+"</td></tr>");
			buffer.append("<tr><td>�Ա�</td><td>"+s.getSex()+"</td></tr>");
			buffer.append("<tr><td>�༶</td><td>"+s.getClazz().getClassName()+"</td></tr>");
			buffer.append("<tr><td>����Ա</td><td>"+s.getClazz().getTeacher().getTeachName()+"</td></tr>");
			if(s.getDormStartDate()!=null) {
			buffer.append("<tr><td>����</td><td>"+s.getDorm().getBuild().getBuildname()+","+s.getDorm().getDormNum()+"</td></tr>");
			buffer.append("<tr><td align=\"center\" colspan=\"2\"><a href=\"javascript:void(0)\" class=\"layui-btn layui-btn-radius\" onclick=\"out("+s.getStuId()+","+s.getClazz().getTeacher().getTeachId()+","+s.getDorm().getDormId()+")\">��������</a><a class=\"layui-btn layui-btn-normal layui-btn-radius\" href=\"javascript:void(0)\" class=\"layui-layer-close\" onclick=\"change("+s.getStuId()+","+s.getClazz().getTeacher().getTeachId()+","+s.getDorm().getDormId()+")\">����ת����</a></td></tr>");
			}
			buffer.append("</table>");
		}
		return buffer.toString();
		
		
		
	}
	
}

