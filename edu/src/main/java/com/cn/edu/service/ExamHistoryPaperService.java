package com.cn.edu.service;

import com.cn.edu.dao.ExamHistoryPaperDao;
import com.cn.edu.entity.ExamHistoryInfo;
import com.cn.edu.entity.ExamHistoryPaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
  *
  * <p>Title: ExamHistoryPaperServiceImpl</p>
  * <p>Description: </p>
 */

@Service
public class ExamHistoryPaperService {

	@Autowired
	private ExamHistoryPaperDao examHistoryPaperMapper;
	
	public List<ExamHistoryPaper> getExamHistoryToStudent(int studentId) {
		return examHistoryPaperMapper.getExamHistoryToStudent(studentId);
	}

	public int isAddExamHistory(Map<String, Object> map) {
		return examHistoryPaperMapper.isAddExamHistory(map);
	}

	public int getHistoryInfoWithIds(Map<String, Object> map) {
		return examHistoryPaperMapper.getHistoryInfoWithIds(map);
	}

	public List<ExamHistoryInfo> getExamHistoryToTeacher() {
		return examHistoryPaperMapper.getExamHistoryToTeacher();
	}

}
