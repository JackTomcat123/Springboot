package com.example.iphone;

import java.util.Random;
import java.util.Scanner;
import java.util.UUID;

@SuppressWarnings("unused")
public class Test {
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		/**
		 * 随机一个5位的验证码
		 * 1. UUID是利用当前网卡地址，纳秒级时间，芯片ID码和许多数字 随机 组成的
		 * 保证了在同一时间内根本不存在一串与其相同的一串字符串
		 */
		//String StochasticNum = UUID.randomUUID().toString().substring(0, 5);
		
	
		/***
		 * 2.利用随机数加上for循环产生的一个随机验证码
		 * 虽然重复的可能性极其小  但是也要避免这种情况
		 */
		Random ran = new Random();
		String StochasticNum = "";
		for (int i = 0; i < 5; i++) {
			int num = ran.nextInt(10);
			StochasticNum += num+"";
		}
		
		System.out.println(StochasticNum);
		System.out.println("请输入手机号:");
		String Phone = input.next();
		String TemplateNum = "dFqtt1";// 但是这个好像也是一个模板的ID
		System.out.println("验证码:"+StochasticNum);
		System.out.println("手机号:"+Phone);
		MessageUtil.SendMessage(Phone, StochasticNum,"skuvj3");// 这里呢 参数: 模板ID
		System.out.println("----------------------------------------------------------");
		System.out.println("请输入您获取到的验证码：");
		String UserRandomNumber = input.next();
		if(UserRandomNumber.equalsIgnoreCase(StochasticNum)){
			System.out.println("通过。");
		}else{
			System.out.println("失败。");
		}
	}
}