package com.cn.edu.controller;
import com.google.gson.Gson;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.cn.edu.service.*;
/**
  *
  * <p>Title: AdminHomeHandler</p>
  * <p>Description: 后台首页相关</p>
  */
@Controller
public class AdminHomeController {

	@Autowired
	ExamPaperService examPaperInfoService;
	@Autowired
	SubjectInfoService subjectInfoService;
	@Autowired
	TeacherInfoService teacherInfoService;
	@Autowired
	StudentInfoService studentInfoService;
	@Autowired
	Gson gson;
	
	private Logger logger = Logger.getLogger(AdminHomeController.class);
	
	
	@RequestMapping("/homeInfo")
	public void homeInfo(HttpServletResponse response) throws IOException {
		logger.info("加载后台首页相关数据");
		
		int examPaperTotal = examPaperInfoService.getExamPpaerTotal();
		int subjectTotal = subjectInfoService.getSubjectTotal();
		int teacherTotal = teacherInfoService.getTeacherTotal();
		int studentTotal = studentInfoService.getStudentTotal();
		
		String json = "{\"examPaperTotal\":"+examPaperTotal+", " +
				"\"subjectTotal\":"+subjectTotal+", " +
				"\"teacherTotal\":"+teacherTotal+", " +
				"\"studentTotal\":"+studentTotal+"}";
		response.getWriter().print(json);
	}
}
