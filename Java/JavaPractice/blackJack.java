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
				System.out.print("사용자 카드는 : "+plst+"\n");
				break;
			}
			else if (plst >21) {
				System.out.println("사용자카드 burst"+"\n");
				break;
				}
		}
		else {
			plst += newcard;
			if (plst >=17 && plst<=21) {
				System.out.print("사용자 카드는 : "+plst+"\n");
				break;
			}
			else if (plst >21) {
				System.out.print("사용자 카드burst"+"\n");
				break;}
		}
		}
		//컴퓨터 문 작성
		while (true) {
		int comnewcard = (int)(Math.random()*10)+1;
		if (com <= 10) {
			if (comnewcard == 1 ) comnewcard=11;
			com += comnewcard;
			if (com >=17 && com <= 21) {
				System.out.println("컴퓨터 카드는 : "+com+"\n");
				break;
			}
			else if (com >21) {
				System.out.println("컴퓨터 : burst"+"\n");
				break;
				}
		}
		else {
			com += comnewcard;
			if (com >=17 && com<=21) {
				System.out.print("컴퓨터 카드는 : "+com +"\n");
				break;
			}
			else if (com >21) {
				System.out.println("컴퓨터 : burst");
				break;}
		}
		
		}
	if (plst>com) {
		System.out.println("플레이어 승리");
	
	}else if(plst < com) {
		System.out.println("딜러 승리");
	}else {
		System.out.println("비겼습니다.");
	}
		
	}
	

	}
	
