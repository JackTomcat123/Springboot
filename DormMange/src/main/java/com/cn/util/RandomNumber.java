package com.cn.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * ����������ظ���6λ��
 * 
 * @author gaopeng
 */

@SuppressWarnings({ "rawtypes", "unchecked" })
public class RandomNumber {

	public List random() {
		ArrayList list = new ArrayList();
		int n = 10;
		Random rand = new Random();
		boolean[] bool = new boolean[n];

		int num = 0;

		for (int i = 0; i < 6; i++) {
			do {
				// �������������ͬ����ѭ��
				num = rand.nextInt(n);

			} while (bool[num]);

			bool[num] = true;

			list.add(num);
		}

		System.out.println(list);
		return list;
	}

	public String randomNumber() {
		ArrayList list = new ArrayList();
		int n = 10;
		Random rand = new Random();
		boolean[] bool = new boolean[n];

		int num = 0;

		for (int i = 0; i < 6; i++) {
			do {
				// �������������ͬ����ѭ��
				num = rand.nextInt(n);

			} while (bool[num]);

			bool[num] = true;

			list.add(num);
		}

		// System.out.println(list);

		String str = "";
		for (int i = 0; i < list.size(); i++) {
			// System.out.print(random.get(i) + "\t");
			str += list.get(i);
		}
		return str;
	}
}
