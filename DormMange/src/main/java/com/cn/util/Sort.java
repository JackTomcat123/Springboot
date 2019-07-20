package com.cn.util;

import java.util.Comparator;

import com.cn.zzy.entity.Role;

public class Sort implements Comparator<Role>{

	@Override
	public int compare(Role r1, Role r2) {
		// TODO Auto-generated method stub
		return r1.getR_sort()-r2.getR_sort();
	}

}
