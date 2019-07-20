package com.cn.zzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.OutltDao;
import com.cn.zzy.entity.Outlt;
@Service
public class OutltService extends BaseService<Outlt>{
@Autowired
OutltDao dao;
	@Override
	public BaseDao<Outlt> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	//����Ա��ѯѧ������Ϣ
		public String findMsgByTid(Outlt entity){
			List<Outlt> list=dao.findMsgByTid(entity);
			StringBuffer buffer = new StringBuffer();
			if(list.size()>0) {
				buffer.append("<table class=\"layui-table\">");//
				for(Outlt o:list){
						buffer.append("<tr><td>����</td><td>ѧ�ţ�"+o.getStu().getStuNum()+",�༶��"+o.getStu().getClazz().getClassName()+",������"+o.getStu().getStuName()+",���᣺"+o.getDorm().getBuild().getBuildname()+","+o.getStu().getSex()+""+o.getDorm().getDormNum()+"</td></tr>");
						buffer.append("<tr><td>����</td><td>"+o.getMemo()+"</td></tr>");
						buffer.append("<tr><td>����</td><td><input    onclick=\"Pass("+o.getO_id()+")\" class=\"layui-btn layui-btn-radius layui-btn-warm \" value=\"ͬ��\"/><input onclick=\"NotPass("+o.getO_id()+")\"class=\"layui-btn layui-btn-radius \" style=\\\"width=\\\"50px;\\\"\\\" value=\"��ͬ��\"/></td></tr>"); 
				}
				
				   buffer.append("<table>");
			}else {
				
				buffer.append("<h1><font color=\"red\">������Ϣ��¼��</font></h1>");
			}
			return buffer.toString();
		}
		public List<Outlt> findTMsg(Outlt entity){
			return dao.findMsgByTid(entity);
			
			
		}
		public List<Outlt> findMsgBySid1(Outlt entity) {
			return dao.findMsgByStuid2(entity);
			
			
		}
		//ѧ����ѯ��ʦ��ִ����Ϣ
		public String findMsgByStuid(Outlt entity) {
			List<Outlt> list=dao.findMsgByStuid(entity);
			StringBuffer buffer = new StringBuffer();
			if(list.size()>0) {
				for(Outlt o:list) {
					if(o.getFlag()==1) {
						buffer.append("<script>\r\n" + 
								"layer.alert('�����µ���Ϣ��ע����գ�', {\r\n" + 
								"     skin: 'layui-layer-molv' //��ʽ����  �Զ�����ʽ\r\n" + 
								"    ,closeBtn: 1    // �Ƿ���ʾ�رհ�ť\r\n" + 
								"    ,anim: 1 //��������\r\n" + 
								"     ,btn: ['�鿴','ȡ��'] //��ť\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('"+o.getTeach().getTeachName()+"��ʦ�Ѿܾ��������룺(����)"+o.getTmemo()+","+o.getTcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
								   
								"     }});\r\n" + 
								"</script>");
					}else if(o.getFlag()==2) {
						buffer.append("<script>\r\n" + 
								"layer.alert('�����µ���Ϣ��ע����գ�', {\r\n" + 
								"     skin: 'layui-layer-molv' //��ʽ����  �Զ�����ʽ\r\n" + 
								"    ,closeBtn: 1    // �Ƿ���ʾ�رհ�ť\r\n" + 
								"    ,anim: 1 //��������\r\n" + 
								"     ,btn: ['�鿴','ȡ��'] //��ť\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('"+o.getTeach().getTeachName()+"��ʦ����׼�������룺(����)"+o.getTmemo()+","+o.getTcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
								
								"     }});\r\n" + 
								"</script>");
					}else if(o.getFlag()==3) {
						buffer.append("<script>\r\n" + 
								"layer.alert('�����µ���Ϣ��ע����գ�', {\r\n" + 
								"     skin: 'layui-layer-molv' //��ʽ����  �Զ�����ʽ\r\n" + 
								"    ,closeBtn: 1    // �Ƿ���ʾ�رհ�ť\r\n" + 
								"    ,anim: 1 //��������\r\n" + 
								"     ,btn: ['�鿴','ȡ��'] //��ť\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('����"+o.getSendTime()+"������������룬�����޹���ִ��,���Ѿ����޳ɹ�,"+o.getDcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
							
								"     }});\r\n" + 
								"</script>");
						
					}else if(o.getFlag()==4) {
						buffer.append("<script>\r\n" + 
								"layer.alert('�����µ���Ϣ��ע����գ�', {\r\n" + 
								"     skin: 'layui-layer-molv' //��ʽ����  �Զ�����ʽ\r\n" + 
								"    ,closeBtn: 1    // �Ƿ���ʾ�رհ�ť\r\n" + 
								"    ,anim: 1 //��������\r\n" + 
								"     ,btn: ['�鿴','ȡ��'] //��ť\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('����"+o.getSendTime()+"����Ļ������룬�����޹���ִ��,���Ѿ����޳ɹ�,"+o.getDcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
							
								"     }});\r\n" + 
								"</script>");
						
					}else if(o.getFlag()==5) {
						buffer.append("<script>\r\n" + 
								"layer.alert('�����µ���Ϣ��ע����գ�', {\r\n" + 
								"     skin: 'layui-layer-molv' //��ʽ����  �Զ�����ʽ\r\n" + 
								"    ,closeBtn: 1    // �Ƿ���ʾ�رհ�ť\r\n" + 
								"    ,anim: 1 //��������\r\n" + 
								"     ,btn: ['�鿴','ȡ��'] //��ť\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('����"+o.getSendTime()+"����Ļ������룬���ڸ�������ס��δ�ܰ���������ʵ��Ϣ����������,"+o.getDcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
							
								"     }});\r\n" + 
								"</script>");
						
					}else if(o.getFlag()==6) {
						buffer.append("<script>\r\n" + 
								"layer.alert('�����µ���Ϣ��ע����գ�', {\r\n" + 
								"     skin: 'layui-layer-molv' //��ʽ����  �Զ�����ʽ\r\n" + 
								"    ,closeBtn: 1    // �Ƿ���ʾ�رհ�ť\r\n" + 
								"    ,anim: 1 //��������\r\n" + 
								"     ,btn: ['�鿴','ȡ��'] //��ť\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('����"+o.getSendTime()+"����Ļ������룬���ڸ���������ɷѵ�������������������ȥ���񲹽���۰�����ҵ��,"+o.getDcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
							
								"     }});\r\n" + 
								"</script>");
						
					}
				}
			}
			return buffer.toString();
		}
		//�޹ܵ�½��ѯ��Ϣ
		public String findMsgByDid(){
			List<Outlt> list=dao.findMsgByDid();
			StringBuffer buffer = new StringBuffer();
				if(list.size()>0) {
					buffer.append("<table class=\"layui-table\">");//
					for(Outlt o:list){
							buffer.append("<tr><td>����</td><td>ѧ�ţ�"+o.getStu().getStuNum()+",�༶��"+o.getStu().getClazz().getClassName()+",������"+o.getStu().getStuName()+",���᣺"+o.getDorm().getBuild().getBuildname()+","+o.getStu().getSex()+""+o.getDorm().getDormNum()+"������</td></tr>");
							buffer.append("<tr><td>ѧ����������</td><td>"+o.getMemo()+"</td></tr>");
							buffer.append("<tr><td>��Ա�������</td><td>����Ա"+o.getTeach().getTeachName()+"��ͬ�⣬����ִ�и�����</td></tr>");
							buffer.append("<tr><td>���޲���</td><td><input onclick=\"Dpass("+o.getO_id()+","+o.getDorm().getDormId()+","+o.getStu().getStuId()+")\" class=\"layui-btn layui-btn-radius\" value=\"ִ��\"/></td></tr>"); 
							buffer.append("<tr><td>���޲���</td><td><input onclick=\"Change("+o.getO_id()+","+o.getDorm().getDormId()+","+o.getStu().getStuId()+")\" class=\"layui-btn layui-btn-radius\" value=\"ִ��\"/></td></tr>"); 
					}
					
					   buffer.append("<table>");
				}else {
					
					buffer.append("<h1><font color=\"red\">������Ϣ��¼��</font></h1>");
				}
				
			
			return buffer.toString();
			
		}
		public List<Outlt> findDMsg(){
			return dao.findMsgByDid();
			
			
		}
		public String findOut(Outlt entity){
			StringBuffer buffer = new StringBuffer();
		    List<Outlt> list=dao.findMsgByStuid(entity);
		  if(list.size()>0) {
			  buffer.append("<table>");
			    buffer.append("<tr>");
			    buffer.append("<td>���</td><td>ѧ��</td><td>����</td><td>�Ա�</td><td>�༶</td><td>��Ա</td><td>����</td><td>��������</td>");
			    buffer.append("</tr>");
			    for(Outlt o:list) {
			    	buffer.append("<input type=\"hidden\" id=\"dormid\" value="+o.getDorm().getDormId()+">");
			    	buffer.append("<input type=\"hidden\" id=\"o_id\" value="+o.getO_id()+">");
			    	buffer.append("<input type=\"hidden\" id=\"stuid\" value="+o.getStu().getStuId()+">");
			    	  buffer.append("<tr>");
					    buffer.append("<td>"+o.getO_id()+"</td>"
					    		+ "<td>"+o.getStu().getStuNum()+"</td><td>"+o.getStu().getStuName()+"</td>"
					    		+ "<td>"+o.getStu().getSex()+"</td><td>"+o.getStu().getClazz().getClassName()+"</td>"
					    		+ "<td>"+o.getTeach().getTeachName()+"</td><td>"+o.getStu().getSex()+","+o.getDorm().getBuild().getBuildname()+","+o.getDorm().getDormNum()+"</td>"
					    		+ "<td>"+o.getMemo()+"</td>");
					    buffer.append("</tr>");	    	
			    	
			    	
			    }
			    
			    buffer.append("</table>");
			  
		  }else {
			  buffer.append("<script>alert('���������ҵ��');</script>");
		  }
			return buffer.toString();
			
			
		}
		
}
