package com.Home;

import java.util.Scanner;

public class blackJack {
	public static void main(String[] args) {
		int plst = (int)(Math.random()*10)+1;
		int comst1 =(int)(Math.random()*10)+1;
		int comst2 =(int)(Math.random()*10)+1;
		int com = comst1 + comst2;
		while ( true){
		int newcard = (int)(Math.random()*10)+1;
		if (plst <= 10) {
			if (newcard == 1 ) newcard=11;
			plst += newcard;
			if (plst >=17 && plst <= 21) {
				System.out.print("����� ī��� : "+plst+"\n");
				break;
			}
			else if (plst >21) {
				System.out.println("�����ī�� burst"+"\n");
				break;
				}
		}
		else {
			plst += newcard;
			if (plst >=17 && plst<=21) {
				System.out.print("����� ī��� : "+plst+"\n");
				break;
			}
			else if (plst >21) {
				System.out.print("����� ī��burst"+"\n");
				break;}
		}
		}
		//��ǻ�� �� �ۼ�
		while (true) {
		int comnewcard = (int)(Math.random()*10)+1;
		if (com <= 10) {
			if (comnewcard == 1 ) comnewcard=11;
			com += comnewcard;
			if (com >=17 && com <= 21) {
				System.out.println("��ǻ�� ī��� : "+com+"\n");
				break;
			}
			else if (com >21) {
				System.out.println("��ǻ�� : burst"+"\n");
				break;
				}
		}
		else {
			com += comnewcard;
			if (com >=17 && com<=21) {
				System.out.print("��ǻ�� ī��� : "+com +"\n");
				break;
			}
			else if (com >21) {
				System.out.println("��ǻ�� : burst");
				break;}
		}
		
		}
	if (plst>com) {
		System.out.println("�÷��̾� �¸�");
	
	}else if(plst < com) {
		System.out.println("���� �¸�");
	}else {
		System.out.println("�����ϴ�.");
	}
		
	}
	

	}
	
