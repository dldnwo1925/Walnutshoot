package com.restauranttest;

import java.util.Scanner;

public class Rest {
	Scanner sc = new Scanner(System.in);
	public void mainProcess(){
		Table t = new Table();
		loop1 : while(true) {
			System.out.println("1.주문 2.추가 3.결제");
			System.out.println("다른키 입력시 프로그램 종료");
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
		System.out.println("1,2,3 만 눌러주세요");
	}
}