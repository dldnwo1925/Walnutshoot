package com.array;

import java.util.Scanner;

public class arrayBasic {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		//���� �迭�� ���� ��
		int[] a = new int[n];
		// n�� ���� ���� �迭 a ����
		int[] cnt = new int[n]; // �ּҰ��� ����� ���� �迭 , -> ��ġ ǥ��
		int min = 999999; //� ���� �͵� ��ü�� �� �ִ� ��
		
		for (int i = 0; i < a.length; i++) {
			a[i] = sc.nextInt();
			
		}
		for (int i = 0; i < a.length; i++) {
			if(min >a[i]) {//�ּҰ��� min���� �� ũ�ٸ�? �� ���� �ּڰ����� ��ü (�ּҰ����� ���� ���� ���� ���)
				min = a[i]; // �ּڰ��� �ش� ������ ��ü
				// ��� ǥ���� �ʱ�ȭ�ϴ� �ġ�
				for (int j = 0; j < cnt.length; j++) { 
					cnt[j] = 0;  
				}//
				
				cnt[i] = 1; // �ش� �迭�� ���� �ʱⰪ�̶�� ǥ���� ����
			}else if (min==a[i]) {
				// ǥ�ĸ� ����
				cnt[i] =1;
			}
			
			
			
		}
	}

}
