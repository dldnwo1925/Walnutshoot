package Home;
import java.util.Scanner;
public class Cafe {

	public static void menu() { // 메뉴 제공
	      System.out.println("1. 아메리카노 3000원");
	      System.out.println("2. 카라멜 마끼아또 4500원");
	      System.out.println("3. 그린티 프라푸치노 5500원");
	      System.out.println("4. 허니브레드 3500원");
	      
	   }
	      
	      
	      public static int ea() { // 개수 입력 메서드
	      Scanner sc = new Scanner(System.in);
	      
	      return  sc.nextInt() ; 
	      } 
	      
	      public static int price (int menuNum , int ea) { //수량 * 가격구하는법
	         if (menuNum==1) {
	            return (ea * 3000);
	         }
	         else if(menuNum==2) {
	            return (ea * 4500);
	         }
	         else if(menuNum==3) {
	            return (ea * 5500);
	         }
	         else{
	            return (ea*3500 );
	         }
	      }
	      
	      public static String ques() { // 재구매 의도
	         Scanner sc = new Scanner(System.in);
	         return sc.nextLine();
	         
	         
	      }
	   public static void main(String[] args) {
	         int a = 0 ;
	         
	         
	      while  (true){
	         menu(); // 메뉴 공개
	         System.out.println("메뉴를 선택하세요");
	         int c = ea();
	         System.out.println(c+"번 메뉴") ; // 메뉴 선택
	         System.out.println("수량을 입력하세요");
	         int d = ea();      
	         System.out.println(d + "개"); // 개수 선택
	         System.out.println("구매를 더 하실건가요? Y,N");
	         	if (ques().equals("Y")){
	         		a += price(c,d) ;
	         		continue;
	         	}else {
	         		a += price(c,d);
	         		break;
	         	} 
	      }
	      System.out.println(a+"원");
	      }
}
