package com.array;

import java.util.Scanner;

public class arrayBasic {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		//넣을 배열의 공간 수
		int[] a = new int[n];
		// n개 항을 가진 배열 a 생성
		int[] cnt = new int[n]; // 최소값이 몇개인지 세는 배열 , -> 위치 표시
		int min = 999999; //어떤 값이 와도 대체할 수 있는 수
		
		for (int i = 0; i < a.length; i++) {
			a[i] = sc.nextInt();
			
		}
		for (int i = 0; i < a.length; i++) {
			if(min >a[i]) {//최소값이 min보다 더 크다면? 그 수를 최솟값으로 대체 (최소값보다 작은 값이 나올 경우)
				min = a[i]; // 최솟값을 해당 값으로 교체
				// 모든 표식을 초기화하는 식↓
				for (int j = 0; j < cnt.length; j++) { 
					cnt[j] = 0;  
				}//
				
				cnt[i] = 1; // 해당 배열의 값이 초기값이라는 표식을 남김
			}else if (min==a[i]) {
				// 표식만 남김
				cnt[i] =1;
			}
			
			
			
		}
	}

}
