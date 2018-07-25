package Home;

import java.util.Scanner;

public class Updown {
	
	
	
	public static int random() {
		return (int)(Math.random()*100)+1;
	}
	
	public static int inputNum() {
		Scanner sc = new Scanner(System.in);
		return sc.nextInt();
		
	}
	
	
	public static void Updown(int com) {
		Scanner sc = new Scanner(System.in);
		com = random();
		System.out.println(com);
		int a = 0;
		
		while (true) {
			
			int player = inputNum();
			if (player>com) {
				System.out.println("Down");
				a++;
				if(a==7) {
					System.out.println("Computer Win!"); 
					break;
				}
			}
			
			else if(player < com) {
				System.out.println("Up");
				a++;
				if(a==7) {
					System.out.println("Computer Win!"); 
					break;
				}
			}
			
			else {
				System.out.println("Player Win!");
				break;
			}
		}
		
	}
	
	
	
	
	public static void main(String[] args) {
			Updown(random());
		
	}

}
