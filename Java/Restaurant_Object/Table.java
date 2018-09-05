package com.ex0420.pm;

import java.util.Scanner;

public class Table {
	int ham ;
	int pizza;
	int coke ;
	boolean[] tableCheck = new boolean[5];
	int [][] table = new int[5][3];
	
	public void showMenu() {
		System.out.println("1. 햄버거 -- 4000원");
		System.out.println("2. 피자 -- 5000원");
		System.out.println("3. 콜라 -- 1500원");
	}
	public void takeOrder() {
		Scanner sc = new Scanner(System.in) ;
		
		System.out.println("몇 번째 테이블입니까?");
		int i = sc.nextInt()-1;
			if(tableCheck[i]) {
				System.out.println("좌석이 차 있습니다.");
			}else {
				showMenu();
				System.out.println("무엇을 주문하시겠습니까?");
				int a= sc.nextInt();
				System.out.println("얼마나 주문하시겠습니까?");
				int b =sc.nextInt();
				switch (a) {
				case 1:
					table[i][0] += b*4000;
					break;
				case 2:
					table[i][1] += b*5000;
					break;
				case 3:
					table[i][2] += b*1500;
					break;
					
				}
			tableCheck[i] = true;
			}
	}
	public void addOrder() {
		Scanner sc = new Scanner(System.in) ;
		
		System.out.println("몇 번째 테이블입니까?");
		int i = sc.nextInt()-1;
			if(!tableCheck[i]) {
				System.out.println("빈 좌석입니다.");
			}else {
				showMenu();
				System.out.println("무엇을 주문하시겠습니까?");
				int a= sc.nextInt();
				System.out.println("얼마나 주문하시겠습니까?");
				int b =sc.nextInt();
				switch (a) {
				case 1:
					table[i][0] += b*4000;
					break;
				case 2:
					table[i][1] += b*5000;
					break;
				case 3:
					table[i][2] += b*1500;
					break;
				}
			}
	}
	public	void payMoney() {
		Scanner sc = new Scanner(System.in);
		System.out.println("몇 번째 테이블 입니까?");
		int sum = 0;
		int i = sc.nextInt()-1;
		if(!tableCheck[i]) {
			System.out.println("빈 좌석입니다.");
		}else {
			for(int j = 0; j< 3; j++) {
				sum+=table[i][j];
				tableCheck[i] = false;
				table[i][j] = 0;
			}
			
		}System.out.println(sum);
	}
	
}