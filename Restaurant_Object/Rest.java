package com.restauranttest;

import java.util.Scanner;

public class Rest {
	Scanner sc = new Scanner(System.in);
	public void mainProcess(){
		Table t = new Table();
		loop1 : while(true) {
			System.out.println("1.�ֹ� 2.�߰� 3.����");
			System.out.println("�ٸ�Ű �Է½� ���α׷� ����");
			int i = sc.nextInt();
			switch(i) {
				case 1:
					t.takeOrder();
					break;
				case 2:
					t.addOrder();
					break;
				case 3:
					t.payMoney();
					break;
				default :
					break loop1;
			}
		} 
		System.out.println("1,2,3 �� �����ּ���");
	}
}