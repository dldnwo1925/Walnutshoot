package com.ex0420.pm;

import java.util.Scanner;

public class Table {
	int ham ;
	int pizza;
	int coke ;
	boolean[] tableCheck = new boolean[5];
	int [][] table = new int[5][3];
	
	public void showMenu() {
		System.out.println("1. �ܹ��� -- 4000��");
		System.out.println("2. ���� -- 5000��");
		System.out.println("3. �ݶ� -- 1500��");
	}
	public void takeOrder() {
		Scanner sc = new Scanner(System.in) ;
		
		System.out.println("�� ��° ���̺��Դϱ�?");
		int i = sc.nextInt()-1;
			if(tableCheck[i]) {
				System.out.println("�¼��� �� �ֽ��ϴ�.");
			}else {
				showMenu();
				System.out.println("������ �ֹ��Ͻðڽ��ϱ�?");
				int a= sc.nextInt();
				System.out.println("�󸶳� �ֹ��Ͻðڽ��ϱ�?");
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
		
		System.out.println("�� ��° ���̺��Դϱ�?");
		int i = sc.nextInt()-1;
			if(!tableCheck[i]) {
				System.out.println("�� �¼��Դϴ�.");
			}else {
				showMenu();
				System.out.println("������ �ֹ��Ͻðڽ��ϱ�?");
				int a= sc.nextInt();
				System.out.println("�󸶳� �ֹ��Ͻðڽ��ϱ�?");
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
		System.out.println("�� ��° ���̺� �Դϱ�?");
		int sum = 0;
		int i = sc.nextInt()-1;
		if(!tableCheck[i]) {
			System.out.println("�� �¼��Դϴ�.");
		}else {
			for(int j = 0; j< 3; j++) {
				sum+=table[i][j];
				tableCheck[i] = false;
				table[i][j] = 0;
			}
			
		}System.out.println(sum);
	}
	
}