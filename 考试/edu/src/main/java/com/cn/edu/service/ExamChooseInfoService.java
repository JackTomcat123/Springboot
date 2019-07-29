package com.cn.edu.service;

import com.cn.edu.dao.ExamChooseInfoDao;
import com.cn.edu.entity.ExamChooseInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
  *
  * <p>Title: ExamChooseInfoServiceImpl</p>
  * <p>Description: </p>
  */

@Service
public class ExamChooseInfoService{

	@Autowired
	private ExamChooseInfoDao examChooseInfoMapper;

	//根据学生编号，试卷编号，试题编号获取选择记录
	public ExamChooseInfo getChooseWithIds(Map<String, Object> map) {
		return examChooseInfoMapper.getChooseWithIds(map);
	}

	//修改选择记录
	public int updateChooseWithIds(ExamChooseInfo examChoose) {
		return examChooseInfoMapper.updateChooseWithIds(examChoose);
	}

	//添加选择记录
	public int addChoose(Map<String, Object> map) {
		return examChooseInfoMapper.addChoose(map);
	}

	public List<ExamChooseInfo> getChooseInfoWithSumScore(
			Map<String, Object> map) {
		return examChooseInfoMapper.getChooseInfoWithSumScore(map);
	}

	public List<ExamChooseInfo> getChooseInfoWithExamSubject(
			Map<String, Object> map) {
		return examChooseInfoMapper.getChooseInfoWithExamSubject(map);
	}


}
