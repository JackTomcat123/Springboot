package com.cn.edu.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cn.edu.entity.*;

/**
  *
  * <p>Title: ExamHistoryPaperMapper</p>
  * <p>Description: </p>
  * @author: taohan
  * @date: 2018-8-29
  * @time: 下午4:44:07
  * @version: 1.0
  */

@Repository
public interface ExamHistoryPaperDao {

	//查询考试历史信息，针对前台学生查询
	public List<ExamHistoryPaper> getExamHistoryToStudent(int studentId);
	
	public int isAddExamHistory(Map<String, Object> map);
	
	public int getHistoryInfoWithIds(Map<String, Object> map);
	
	//查询考试历史信息，针对后台教师查询
	public List<ExamHistoryInfo> getExamHistoryToTeacher();
}
