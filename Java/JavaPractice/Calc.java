package Home;

import java.util.Scanner;

public class Calc {

	public static int inputNum() {
		Scanner sc = new Scanner(System.in);
		return sc.nextInt();
	}
	
	public static String inputS() {
		Scanner sc = new Scanner(System.in);
		return sc.nextLine();	
	}
	
	public static void Calc() {
		int a = inputNum();
		String b = inputS();
		int c = inputNum();
		
		if (b.equals("+")) {
			System.out.println(a+c);
		}
		else if (b.equals("-")) {
			System.out.println(a-c);
		}
		else if (b.equals("*")){
			System.out.println(a*c);
		}
		else {
			System.out.println(a/c);
		}
		
		
	}
	
	
	
	public static void main(String[] args) {
		Calc();
		
		
	}

}
