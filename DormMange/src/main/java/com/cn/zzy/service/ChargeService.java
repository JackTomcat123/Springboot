package com.cn.zzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.util.BaseDao;
import com.cn.util.BaseService;
import com.cn.zzy.dao.ChargeDao;
import com.cn.zzy.entity.Charge;

@Service
public class ChargeService extends BaseService<Charge>{
@Autowired
ChargeDao dao;
	@Override
	public BaseDao<Charge> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
//通过学生id查询缴费记录
	public  List<Charge> findChargebystuid(Charge entity){
		return dao.findChargeBystuid(entity);
	}
}
