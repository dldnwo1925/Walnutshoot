package Home;
import java.util.Scanner;
public class Cafe {

	public static void menu() { // �޴� ����
	      System.out.println("1. �Ƹ޸�ī�� 3000��");
	      System.out.println("2. ī��� �����ƶ� 4500��");
	      System.out.println("3. �׸�Ƽ ����Ǫġ�� 5500��");
	      System.out.println("4. ��Ϻ극�� 3500��");
	      
	   }
	      
	      
	      public static int ea() { // ���� �Է� �޼���
	      Scanner sc = new Scanner(System.in);
	      
	      return  sc.nextInt() ; 
	      } 
	      
	      public static int price (int menuNum , int ea) { //���� * ���ݱ��ϴ¹�
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
	      
	      public static String ques() { // �籸�� �ǵ�
	         Scanner sc = new Scanner(System.in);
	         return sc.nextLine();
	         
	         
	      }
	   public static void main(String[] args) {
	         int a = 0 ;
	         
	         
	      while  (true){
	         menu(); // �޴� ����
	         System.out.println("�޴��� �����ϼ���");
	         int c = ea();
	         System.out.println(c+"�� �޴�") ; // �޴� ����
	         System.out.println("������ �Է��ϼ���");
	         int d = ea();      
	         System.out.println(d + "��"); // ���� ����
	         System.out.println("���Ÿ� �� �Ͻǰǰ���? Y,N");
	         	if (ques().equals("Y")){
	         		a += price(c,d) ;
	         		continue;
	         	}else {
	         		a += price(c,d);
	         		break;
	         	} 
	      }
	      System.out.println(a+"��");
	      }
}
