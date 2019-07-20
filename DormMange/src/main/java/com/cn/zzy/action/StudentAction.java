package com.cn.zzy.action;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cn.util.BaseAction;
import com.cn.util.RandomNumber;
import com.cn.zzy.entity.Charge;
import com.cn.zzy.entity.ChargeType;
import com.cn.zzy.entity.ClassInfo;
import com.cn.zzy.entity.Dorm;
import com.cn.zzy.entity.DormType;
import com.cn.zzy.entity.Outlt;
import com.cn.zzy.entity.Student;
import com.cn.zzy.entity.Teacher;
import com.cn.zzy.entity.TeacherType;
import com.cn.zzy.entity.Users;
import com.cn.zzy.service.ChargeService;
import com.cn.zzy.service.ChargeTypeService;
import com.cn.zzy.service.ClassInfoService;
import com.cn.zzy.service.DormService;
import com.cn.zzy.service.OutltService;
import com.cn.zzy.service.StudentService;
import com.cn.zzy.service.TeacherService;
import com.cn.zzy.service.TeacherTypeService;
import com.cn.zzy.service.UsersService;

@Controller
public class StudentAction extends BaseAction{
private List<Student>list;
private List<ClassInfo> c_list;
private List<Dorm> d_list;
private List<Charge> h_list;
private List<Outlt> o_list;
private Charge ch=new Charge();
private int teachid;
private double price;
private int dormid;
private int chid;
private int stuid;
private Student entity=new Student();
private Dorm d=new Dorm();
private ChargeType type=new ChargeType();
private  Outlt out=new Outlt();
@Autowired
private OutltService o_svr;
@Autowired
private StudentService svr;
@Autowired
private DormService d_svr;
@Autowired
private ClassInfoService c_svr;
@Autowired
private UsersService u_svr;
@Autowired
private ChargeService h_svr;
@Autowired
private ChargeTypeService st_svr;
public String toInsert(){
c_list=c_svr.findAll();
d_list=d_svr.findAll();
	return "toInsert";
}
public String insert() {
	//随机生成用户编号
	String str = new RandomNumber().randomNumber();
	entity.setStuUserName(str);
	//固定密码
	entity.setStuPass("0000");
	//入学日期
	entity.setInDate(new Date());
	Users users=new Users();
	users.setU_name(entity.getStuUserName());
	users.setU_pass(entity.getStuPass());
	users.setU_rename(entity.getStuName());
	users.setU_type("学生");
	users.setU_role("学生");
	svr.save(entity);
	users.setU_num(entity.getStuId());
	users.getStudent().add(entity);
	u_svr.save(users);
	return "findAll";
}
public String delete() {
	svr.delete(entity);
	return "findAll";
}
public String update() {
	svr.update(entity);
	return "findAll";
}
public String upone() {
	svr.update(entity);
	return "upone";
}
public String toUpdate() {
	entity=svr.findOne(entity);
	c_list=c_svr.findAll();
	d_list=d_svr.findAll();
	return "toUpdate";
}
public String findAll() {
	list=svr.findAll();
	return "list";
}
public String tofindOne() {
	
	entity=svr.findOne(entity);
	c_list=c_svr.findAll();
	d_list=d_svr.findAll();
	return"tofindOne";
}
//办理住宿/支付
public void toPay(){
	//student
	entity=svr.findOne(entity);
     //charge
	ch.setChargeDate(new Date());
	Teacher t=new Teacher();
	//charge
	ChargeType type=new ChargeType();
	
	type.setUnitprice(price);
	st_svr.save(type);
	ch.setType(type);
	ch.setStu(entity);
	t.setTeachId(teachid);
	ch.setTeacher(t);
	ch.setPayMoney(price);
	ch.setMemo("住宿费");
	h_svr.save(ch);
}
//查询缴费
public String findCost() {
	ch.setStu(entity);
	h_list=h_svr.findChargebystuid(ch);
	d.setDormId(dormid);
	d=d_svr.findOne(d);
	return "findCost";
}//现金缴费成功
public String Pay() {
//chargetype
	//System.out.println(chid);
	ChargeType t=new ChargeType();
	t.setTypeid(chid);
	type=st_svr.findOne(t);
	type.setTypename("现金支付");
    type.setFlag(1);
    st_svr.update(type);
    //dorm
    d.setDormId(dormid);
	d=d_svr.findOne(d);
	d.setPersonCount(d.getPersonCount()+1);
	d_svr.update(d);
	//student
	entity.setStuId(stuid);
    entity=svr.findOne(entity);
	 entity.setDorm(d);
	 entity.setFlag(1);
	 entity.setDormStartDate(new Date());
	 svr.update(entity);
	
	return "Pay";
}
//支付宝支付
public String Alipay() {
	System.out.println(chid);
	//chargetype
		type.setTypeid(chid);
		type=st_svr.findOne(type);
		ServletActionContext.getRequest().getSession().setAttribute("type",type);
	    //dorm
	    d.setDormId(dormid);
		d=d_svr.findOne(d);
		ServletActionContext.getRequest().getSession().setAttribute("dorm",d);
		//student
		entity.setStuId(stuid);
	    entity=svr.findOne(entity);
		ServletActionContext.getRequest().getSession().setAttribute("stu",entity);
	return "Alipay";
}
//支付宝支付成功
public void  AlipaySuccess() {
	//chargetype
	ChargeType t=new ChargeType();
		t.setTypeid(chid);
		type=st_svr.findOne(t);
		type.setTypename("支付宝支付");
	    type.setFlag(1);
	    st_svr.update(type);
	    //dorm
	    d.setDormId(dormid);
		d=d_svr.findOne(d);
		d.setPersonCount(d.getPersonCount()+1);
		d_svr.update(d);
		//student
		entity.setStuId(stuid);
	    entity=svr.findOne(entity);
		 entity.setDorm(d);
		 entity.setFlag(1);
		 entity.setDormStartDate(new Date());
		 svr.update(entity);
}
//查询个人信息
public void  findStuSelf() {
	out().write(svr.findStuSelf(entity));
}

//退宿申请
public void outDrom() {
	out.setSendTime(new Date());
	o_svr.save(out);
	
}
//查询退宿信息
public void Smsg() {
	
	out().write(o_svr.findMsgByStuid(out));
	
}
//查询个人申请信息
public String findStuSelf1() {
	o_list=o_svr.findMsgBySid1(out);
	return "findSelf1";
	
}
//get and set
public List<Student> getList() {
	return list;
}
public void setList(List<Student> list) {
	this.list = list;
}
public List<ClassInfo> getC_list() {
	return c_list;
}
public void setC_list(List<ClassInfo> c_list) {
	this.c_list = c_list;
}
public List<Dorm> getD_list() {
	return d_list;
}
public void setD_list(List<Dorm> d_list) {
	this.d_list = d_list;
}
public Student getEntity() {
	return entity;
}
public void setEntity(Student entity) {
	this.entity = entity;
}
public ClassInfoService getC_svr() {
	return c_svr;
}
public void setC_svr(ClassInfoService c_svr) {
	this.c_svr = c_svr;
}
public List<Charge> getH_list() {
	return h_list;
}
public void setH_list(List<Charge> h_list) {
	this.h_list = h_list;
}

public int getTeachid() {
	return teachid;
}
public void setTeachid(int teachid) {
	this.teachid = teachid;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public Charge getCh() {
	return ch;
}
public void setCh(Charge ch) {
	this.ch = ch;
}
public int getDormid() {
	return dormid;
}
public void setDormid(int dormid) {
	this.dormid = dormid;
}
public int getChid() {
	return chid;
}
public void setChid(int chid) {
	this.chid = chid;
}
public Dorm getD() {
	return d;
}
public void setD(Dorm d) {
	this.d = d;
}
public int getStuid() {
	return stuid;
}
public void setStuid(int stuid) {
	this.stuid = stuid;
}
public ChargeType getType() {
	return type;
}
public void setType(ChargeType type) {
	this.type = type;
}
public Outlt getOut() {
	return out;
}
public void setOut(Outlt out) {
	this.out = out;
}
public List<Outlt> getO_list() {
	return o_list;
}
public void setO_list(List<Outlt> o_list) {
	this.o_list = o_list;
}

}
