package acmicpc;

import java.util.Scanner;

public class Casio180807 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		long x=  sc.nextLong();
		long y= sc.nextLong();
		
		if(x==y) {
			System.out.println(1);
		} else {
			System.out.println(0);
		}
	}
}
