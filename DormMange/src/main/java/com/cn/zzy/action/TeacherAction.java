package com.cn.zzy.action;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cn.util.BaseAction;
import com.cn.util.RandomNumber;
import com.cn.zzy.entity.Building;
import com.cn.zzy.entity.Charge;
import com.cn.zzy.entity.ChargeType;
import com.cn.zzy.entity.Dorm;
import com.cn.zzy.entity.Outlt;
import com.cn.zzy.entity.Student;
import com.cn.zzy.entity.Teacher;
import com.cn.zzy.entity.TeacherType;
import com.cn.zzy.entity.Users;
import com.cn.zzy.service.BuildingService;
import com.cn.zzy.service.ChargeService;
import com.cn.zzy.service.ChargeTypeService;
import com.cn.zzy.service.DormService;
import com.cn.zzy.service.OutltService;
import com.cn.zzy.service.StudentService;
import com.cn.zzy.service.TeacherService;
import com.cn.zzy.service.TeacherTypeService;
import com.cn.zzy.service.UsersService;

@Controller
public class TeacherAction extends BaseAction{
private List<Teacher>list;
private List<TeacherType> t_list;
private List<Student> s_list;
private List<Outlt> o_list;
private  String sex;
private String Tmemo;
private Teacher entity=new Teacher();
private Student stu=new Student();
private Dorm dorm =new Dorm();
private Outlt o=new Outlt();
private Charge c=new Charge();
private ChargeType ctype=new ChargeType();
private int dormid;
private int id;
private int stuid;
private int o_id;
private double price;
@Autowired
private OutltService o_svr;
@Autowired
private TeacherService svr;
@Autowired
private TeacherTypeService t_svr;
@Autowired
private UsersService u_svr;
@Autowired
private StudentService s_svr;
@Autowired
private BuildingService b_svr;
@Autowired
private DormService d_svr;
@Autowired
private ChargeService c_svr;
@Autowired
private ChargeTypeService ct_svr;
public String toInsert() {
	t_list=t_svr.findAll();
	return "toInsert";
}
public String insert() {
	//随机生成用户编号
	String str = new RandomNumber().randomNumber();
	entity.setTeachUserName(str);
	//默认密码
	entity.setTeachPass("0000");
	//入职日期：
	entity.setHireDate(new Date());
	//生成相应的用户
	Users users=new Users();
	users.setU_name(entity.getTeachUserName());
	users.setU_pass(entity.getTeachPass());
	users.setU_rename(entity.getTeachName());
	users.setU_type("老师");
	users.setU_role(entity.getType().getTypename());
	svr.save(entity);
	users.setU_num(entity.getTeachId());
	users.getTeacher().add(entity);
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
	t_list=t_svr.findAll();
	return "toUpdate";
}
public String findAll() {
	list=svr.findAll();
	return "list";
}
public String tofindOne() {
	entity=svr.findOne(entity);
	t_list=t_svr.findAll();
	return"tofindOne";
}
//查询学生管理入住
public void findbylike()
{
	out().write(s_svr.findbylike(stu));
	
}

//办理学生入住
public String DepartStudent() {
	s_list=s_svr.findStudentbyId(stu);
	return "DepartStudent";
}
//查询宿舍楼层bysex
public void findBuildbySex() {
	out().write(b_svr.findBuildBySex(sex));
	
}
//查询宿舍
public void findDorm() {
	
	out().write(d_svr.findDormBybid(dorm));
}
//查询宿舍的学生
public void findPerson() {
	
	out().write(s_svr.findPersonbydid(stu));
}
//查询消息
public void Tmsg() {
	
	out().write(o_svr.findMsgByTid(o));
	
}
//审核通过
public void Pass() {
	o=o_svr.findOne(o);
	o.setFlag(2);
	o.setTcheckTime(new Date());
	o.setTmemo("同意,已经提交给宿管！");
	o_svr.update(o);
	
}
//审核不过
public void NotPass() {
	o=o_svr.findOne(o);
	o.setTcheckTime(new Date());
	o.setFlag(1);
	o.setTmemo(Tmemo);
	o_svr.update(o);
	
}
//查询宿管接受的消息
public void Dmsg() {
	out().write(o_svr.findMsgByDid());
	
}
//执行退宿
public void Dpass() {
	//退宿记录
		o=o_svr.findOne(o);
		o.setFlag(3);
		o.setDmemo("已经办理退宿");
		o.setDcheckTime(new Date());
		o_svr.update(o);
	//宿舍
	dorm.setDormId(dormid);
	dorm=d_svr.findOne(dorm);
	int count=dorm.getPersonCount()-1;
	dorm.setPersonCount(count);
	d_svr.update(dorm);

	//学生
	stu=s_svr.findOne(stu);
	stu.setDorm(null);
	stu.setDormStartDate(null);
	stu.setDormEndDate(null);
	stu.setFlag(0);
	s_svr.update(stu);

	
}
public void stu() {
	stu=s_svr.findOne(stu);
	Dorm d=new Dorm();
	stu.setDorm(d);
	stu.setDormStartDate(null);
	stu.setDormEndDate(null);
	stu.setFlag(0);
	s_svr.update(stu);
}
public String  findTMsg(){
	entity.setTeachId(id);
	o.setTeach(entity);
	o_list=o_svr.findTMsg(o);
	return "findTMsg";
}
public String findDMsg() {
	o_list=o_svr.findDMsg();
	return "findDMsg";
	
	
}
//换宿查询信息
public String findOMsg() {
	o=o_svr.findOne(o);
	return "findOMsg";
}
//查询楼
public void findBuild() {
	out().write(b_svr.findbuildBysex(sex));
}
//查询宿舍
public void findDormByBid() {
	Building b=new Building();
	b.setBuildid(id);
	dorm.setBuild(b);
	out().write(d_svr.findDormByBid(dorm));
	
}
//查询宿舍详情
public void findDetil() {
	dorm.setDormId(id);
	out().write(d_svr.findDormById(dorm));
}
public void findDetil2() {
	dorm.setDormId(id);
	out().write(d_svr.findDormById2(dorm));
}



//执行换宿
public void change() {
	//换宿记录
	//新宿舍id
	//System.out.println(id);
	//学生id21
	//System.out.println(stuid);
	//旧宿舍id8
	//System.out.println(dormid);
	//单号7
	//System.out.println(o_id);
	    o.setO_id(o_id);
		o=o_svr.findOne(o);
		o.setFlag(4);
	    o.setDmemo("已经办理换宿");
		o.setDcheckTime(new Date());
		o_svr.update(o);
	//宿舍
	dorm.setDormId(dormid);
	dorm=d_svr.findOne(dorm);
	int count=dorm.getPersonCount()-1;
	dorm.setPersonCount(count);
	d_svr.update(dorm);

	//学生
	stu.setStuId(stuid);
	stu=s_svr.findOne(stu);
	Dorm d=new Dorm();
	d.setDormId(id);
	d=d_svr.findOne(d);
	d.setPersonCount(d.getPersonCount()+1);
	d_svr.update(d);
	stu.setDorm(d);
	stu.setDormStartDate(new Date());
	stu.setDormEndDate(null);
	s_svr.update(stu);

	
}
//换宿失败
public  void Nochange() {
	 o.setO_id(o_id);
		o=o_svr.findOne(o);
		o.setFlag(5);
	    o.setDmemo("该宿舍没有空床位，换宿失败！");
		o.setDcheckTime(new Date());
		o_svr.update(o);
}
//回绝
public  void Tochange() {
	 o.setO_id(o_id);
		o=o_svr.findOne(o);
		o.setFlag(6);
	    o.setDmemo("请到财务补缴款！");
		o.setDcheckTime(new Date());
		o_svr.update(o);
	
}
//查询学生管理换宿
public void findbylike1()
{
	out().write(s_svr.findbylike1(stu));
	
}
//查询申请信息
public String findOutlt() {
	
	 stu.setStuId(stuid); 
	 o.setStu(stu);
	 o_list=o_svr.findMsgBySid1(o);
		 
	return "findOutlt";
}
//预支付
public void PrePay() {
	//teacher
	entity.setTeachId(id);
	c.setTeacher(entity);
	//stu
	stu.setStuId(stuid);
	stu=s_svr.findOne(stu);
	ServletActionContext.getRequest().getSession().setAttribute("fstu",stu);
	c.setStu(stu);
	//dorm
	dorm.setDormId(dormid);
	dorm=d_svr.findOne(dorm);
	ServletActionContext.getRequest().getSession().setAttribute("dorm",dorm);
	//out
	o.setO_id(o_id);
	o=o_svr.findOne(o);
	o.setFlag(7);
	o.setDmemo("财务已处理");
	o.setDcheckTime(new Date());
	o_svr.update(o);
	//price
	ctype.setFlag(0);
	ctype.setTypename("支付宝支付");
	ctype.setUnitprice(price);
	ct_svr.save(ctype);
	ServletActionContext.getRequest().getSession().setAttribute("ctype",ctype);
	c.setChargeDate(new Date());
	c.setPayMoney(price);
	c.setType(ctype);
	c.setMemo("住宿补费");
	c_svr.save(c);
	ServletActionContext.getRequest().getSession().setAttribute("c",c);
}
//支付成功
public void Pay() {
	//宿舍
		dorm.setDormId(dormid);
		dorm=d_svr.findOne(dorm);
		int count=dorm.getPersonCount()-1;
		dorm.setPersonCount(count);
		d_svr.update(dorm);

		//学生
		stu.setStuId(stuid);
		stu=s_svr.findOne(stu);
		Dorm d=new Dorm();
		d.setDormId(id);
		d=d_svr.findOne(d);
		d.setPersonCount(d.getPersonCount()+1);
		d_svr.update(d);
		stu.setDorm(d);
		stu.setDormStartDate(new Date());
		stu.setDormEndDate(null);
		s_svr.update(stu);
		//业务订单
		ctype=ct_svr.findOne(ctype);
		ctype.setFlag(1);
		ct_svr.update(ctype);

	
}

//get and set

public List<Teacher> getList() {
	return list;
}
public Outlt getO() {
	return o;
}
public void setO(Outlt o) {
	this.o = o;
}
public void setList(List<Teacher> list) {
	this.list = list;
}
public List<TeacherType> getT_list() {
	return t_list;
}
public void setT_list(List<TeacherType> t_list) {
	this.t_list = t_list;
}
public Teacher getEntity() {
	return entity;
}
public void setEntity(Teacher entity) {
	this.entity = entity;
}
public Student getStu() {
	return stu;
}
public void setStu(Student stu) {
	this.stu = stu;
}
public List<Student> getS_list() {
	return s_list;
}
public void setS_list(List<Student> s_list) {
	this.s_list = s_list;
}
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public Dorm getDorm() {
	return dorm;
}
public void setDorm(Dorm dorm) {
	this.dorm = dorm;
}
public String getTmemo() {
	return Tmemo;
}
public void setTmemo(String tmemo) {
	Tmemo = tmemo;
}
public int getDormid() {
	return dormid;
}
public void setDormid(int dormid) {
	this.dormid = dormid;
}
public List<Outlt> getO_list() {
	return o_list;
}
public void setO_list(List<Outlt> o_list) {
	this.o_list = o_list;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getStuid() {
	return stuid;
}
public void setStuid(int stuid) {
	this.stuid = stuid;
}
public int getO_id() {
	return o_id;
}
public void setO_id(int o_id) {
	this.o_id = o_id;
}
public Charge getC() {
	return c;
}
public void setC(Charge c) {
	this.c = c;
}
public ChargeType getCtype() {
	return ctype;
}
public void setCtype(ChargeType ctype) {
	this.ctype = ctype;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}

}
