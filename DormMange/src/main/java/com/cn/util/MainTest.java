package com.cn.util;
public class MainTest {
	public static void main(String[] args) {
		// List random = new RandomNumber().random();
		// String str = "";
		// for (int i = 0; i < random.size(); i++) {
		// // System.out.print(random.get(i) + "\t");
		// str += random.get(i);
		// }
		// System.out.println(str);

		String str = new RandomNumber().randomNumber();
		System.out.println(str);
	}
}
