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
	//辅导员查询学生的信息
		public String findMsgByTid(Outlt entity){
			List<Outlt> list=dao.findMsgByTid(entity);
			StringBuffer buffer = new StringBuffer();
			if(list.size()>0) {
				buffer.append("<table class=\"layui-table\">");//
				for(Outlt o:list){
						buffer.append("<tr><td>来自</td><td>学号："+o.getStu().getStuNum()+",班级："+o.getStu().getClazz().getClassName()+",姓名："+o.getStu().getStuName()+",宿舍："+o.getDorm().getBuild().getBuildname()+","+o.getStu().getSex()+""+o.getDorm().getDormNum()+"</td></tr>");
						buffer.append("<tr><td>内容</td><td>"+o.getMemo()+"</td></tr>");
						buffer.append("<tr><td>操作</td><td><input    onclick=\"Pass("+o.getO_id()+")\" class=\"layui-btn layui-btn-radius layui-btn-warm \" value=\"同意\"/><input onclick=\"NotPass("+o.getO_id()+")\"class=\"layui-btn layui-btn-radius \" style=\\\"width=\\\"50px;\\\"\\\" value=\"不同意\"/></td></tr>"); 
				}
				
				   buffer.append("<table>");
			}else {
				
				buffer.append("<h1><font color=\"red\">暂无消息记录！</font></h1>");
			}
			return buffer.toString();
		}
		public List<Outlt> findTMsg(Outlt entity){
			return dao.findMsgByTid(entity);
			
			
		}
		public List<Outlt> findMsgBySid1(Outlt entity) {
			return dao.findMsgByStuid2(entity);
			
			
		}
		//学生查询老师的执行消息
		public String findMsgByStuid(Outlt entity) {
			List<Outlt> list=dao.findMsgByStuid(entity);
			StringBuffer buffer = new StringBuffer();
			if(list.size()>0) {
				for(Outlt o:list) {
					if(o.getFlag()==1) {
						buffer.append("<script>\r\n" + 
								"layer.alert('您有新的消息请注意查收！', {\r\n" + 
								"     skin: 'layui-layer-molv' //样式类名  自定义样式\r\n" + 
								"    ,closeBtn: 1    // 是否显示关闭按钮\r\n" + 
								"    ,anim: 1 //动画类型\r\n" + 
								"     ,btn: ['查看','取消'] //按钮\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('"+o.getTeach().getTeachName()+"老师已拒绝您的申请：(理由)"+o.getTmemo()+","+o.getTcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
								   
								"     }});\r\n" + 
								"</script>");
					}else if(o.getFlag()==2) {
						buffer.append("<script>\r\n" + 
								"layer.alert('您有新的消息请注意查收！', {\r\n" + 
								"     skin: 'layui-layer-molv' //样式类名  自定义样式\r\n" + 
								"    ,closeBtn: 1    // 是否显示关闭按钮\r\n" + 
								"    ,anim: 1 //动画类型\r\n" + 
								"     ,btn: ['查看','取消'] //按钮\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('"+o.getTeach().getTeachName()+"老师已批准您的申请：(理由)"+o.getTmemo()+","+o.getTcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
								
								"     }});\r\n" + 
								"</script>");
					}else if(o.getFlag()==3) {
						buffer.append("<script>\r\n" + 
								"layer.alert('您有新的消息请注意查收！', {\r\n" + 
								"     skin: 'layui-layer-molv' //样式类名  自定义样式\r\n" + 
								"    ,closeBtn: 1    // 是否显示关闭按钮\r\n" + 
								"    ,anim: 1 //动画类型\r\n" + 
								"     ,btn: ['查看','取消'] //按钮\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('您于"+o.getSendTime()+"提出的退宿申请，现在宿管已执行,您已经退宿成功,"+o.getDcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
							
								"     }});\r\n" + 
								"</script>");
						
					}else if(o.getFlag()==4) {
						buffer.append("<script>\r\n" + 
								"layer.alert('您有新的消息请注意查收！', {\r\n" + 
								"     skin: 'layui-layer-molv' //样式类名  自定义样式\r\n" + 
								"    ,closeBtn: 1    // 是否显示关闭按钮\r\n" + 
								"    ,anim: 1 //动画类型\r\n" + 
								"     ,btn: ['查看','取消'] //按钮\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('您于"+o.getSendTime()+"提出的换宿申请，现在宿管已执行,您已经换宿成功,"+o.getDcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
							
								"     }});\r\n" + 
								"</script>");
						
					}else if(o.getFlag()==5) {
						buffer.append("<script>\r\n" + 
								"layer.alert('您有新的消息请注意查收！', {\r\n" + 
								"     skin: 'layui-layer-molv' //样式类名  自定义样式\r\n" + 
								"    ,closeBtn: 1    // 是否显示关闭按钮\r\n" + 
								"    ,anim: 1 //动画类型\r\n" + 
								"     ,btn: ['查看','取消'] //按钮\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('您于"+o.getSendTime()+"提出的换宿申请，由于该宿舍已住满未能办理，请您核实信息后再来申请,"+o.getDcheckTime()+"');\r\n" + 
								"       layer.close(index);\r\n" + 
								"     }\r\n" + 
								"    ,btn2:function(){\r\n" + 
							
								"     }});\r\n" + 
								"</script>");
						
					}else if(o.getFlag()==6) {
						buffer.append("<script>\r\n" + 
								"layer.alert('您有新的消息请注意查收！', {\r\n" + 
								"     skin: 'layui-layer-molv' //样式类名  自定义样式\r\n" + 
								"    ,closeBtn: 1    // 是否显示关闭按钮\r\n" + 
								"    ,anim: 1 //动画类型\r\n" + 
								"     ,btn: ['查看','取消'] //按钮\r\n" + 
								"      ,icon: 6    // icon\r\n" + 
								"      ,yes:function(index){\r\n" + 
								"       alert('您于"+o.getSendTime()+"提出的换宿申请，由于该宿舍和您缴费的宿舍类型有区别，请您去财务补交差价办理换宿业务,"+o.getDcheckTime()+"');\r\n" + 
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
		//宿管登陆查询信息
		public String findMsgByDid(){
			List<Outlt> list=dao.findMsgByDid();
			StringBuffer buffer = new StringBuffer();
				if(list.size()>0) {
					buffer.append("<table class=\"layui-table\">");//
					for(Outlt o:list){
							buffer.append("<tr><td>来自</td><td>学号："+o.getStu().getStuNum()+",班级："+o.getStu().getClazz().getClassName()+",姓名："+o.getStu().getStuName()+",宿舍："+o.getDorm().getBuild().getBuildname()+","+o.getStu().getSex()+""+o.getDorm().getDormNum()+"的申请</td></tr>");
							buffer.append("<tr><td>学生申请内容</td><td>"+o.getMemo()+"</td></tr>");
							buffer.append("<tr><td>导员审核内容</td><td>辅导员"+o.getTeach().getTeachName()+"已同意，请您执行该任务</td></tr>");
							buffer.append("<tr><td>退宿操作</td><td><input onclick=\"Dpass("+o.getO_id()+","+o.getDorm().getDormId()+","+o.getStu().getStuId()+")\" class=\"layui-btn layui-btn-radius\" value=\"执行\"/></td></tr>"); 
							buffer.append("<tr><td>换宿操作</td><td><input onclick=\"Change("+o.getO_id()+","+o.getDorm().getDormId()+","+o.getStu().getStuId()+")\" class=\"layui-btn layui-btn-radius\" value=\"执行\"/></td></tr>"); 
					}
					
					   buffer.append("<table>");
				}else {
					
					buffer.append("<h1><font color=\"red\">暂无消息记录！</font></h1>");
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
			    buffer.append("<td>编号</td><td>学号</td><td>姓名</td><td>性别</td><td>班级</td><td>导员</td><td>宿舍</td><td>申请内容</td>");
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
			  buffer.append("<script>alert('该生无相关业务！');</script>");
		  }
			return buffer.toString();
			
			
		}
		
}
