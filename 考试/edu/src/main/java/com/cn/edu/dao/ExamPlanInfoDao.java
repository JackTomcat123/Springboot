package com.cn.edu.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cn.edu.entity.*;

/**
  *
  * <p>Title: ExamPlanInfoMapper</p>
  * <p>Description: </p>
  */

@Repository
public interface ExamPlanInfoDao {

	public List<ExamPlanInfo> getExamPlans(Map<String, Object> map);
	
	public int isAddExamPlan(ExamPlanInfo examPlan);

	public int isUpdateExamPlan(ExamPlanInfo examPlan);
	
	public ExamPlanInfo getExamPlanById(int examPlanId);
	
	//查询学生待考信息
	public List<ExamPlanInfo> getStudentWillExam(Map<String, Object> map);
	
	public int isRemoveExamPlan(int examPlanId);
}
