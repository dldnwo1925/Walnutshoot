package P_ManageBook;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ManageBook {
	Scanner sc = new Scanner(System.in);
	
	Map<Integer,Data> dayData = new HashMap<Integer,Data>();
	Map<Integer,Data> monthData = new HashMap<Integer,Data>();
	
	//��ȸ���
	public void printData() {
		if(dayData.size()== 0) {
			System.out.println("������ �����ϴ� �Է����ּ���");
		}else {
			for (Data a : dayData.values()) {
				System.out.println(a);
			}
		}
	}
	
	//�߰����
	public void addData() {
		int month;
		System.out.println("������� �Է��� �ּ���(���ڸ� �Է�)");
		month = sc.nextInt();
		int day;
		System.out.println("�������� �Է��� �ּ���(���ڸ� �Է�)");
		day = sc.nextInt();
		sc.nextLine();
		String goods;
		System.out.println("���⹰ǰ �̸��Է�");
		goods = sc.nextLine();
		int price;
		System.out.println("��ǰ ������ �Է����ּ���");
		price = sc.nextInt();
		System.out.println("�� ��° �ŷ�����?");
		int a = sc.nextInt();
		if(dayData.containsKey(a)) {
			System.out.println("�̹� �����ϴ� �ŷ���ȣ�Դϴ�\n"+
								"���� ��ȣ�� �Է����ּ���");
		}else {
		dayData.put(a, new Data(month,day,goods,price));
		}
	}
	
	//�������
	public void deleteData() {
		System.out.println("�� ��° �ŷ������� ����ðڽ��ϱ�?");
		int a= sc.nextInt();
		dayData.remove(a);
	}
	//�������
	public void modifyData() {
		System.out.println("�� ��° �ŷ������� �����Ͻðڽ��ϱ�?");
		int a = sc.nextInt();
		System.out.println("������ �����Ͻðڽ��ϱ�? \n"
				+ "1. ��" + "2. ��" + "3. ��ǰ�̸�" + "4.����");
		switch(sc.nextInt()) {
		case 1:
			System.out.println("������ ���� �Է����ּ���");
			dayData.get(a).setMonth(sc.nextInt());
			break;
		case 2:
			System.out.println("������ ���� �Է����ּ���");
			dayData.get(a).setDay(sc.nextInt());
			break;
		case 3:
			System.out.println("������ ��ǰ�̸��� �Է����ּ���");
			dayData.get(a).setGoods(sc.nextLine());
			break;
		case 4:
			System.out.println("������ ������ �Է����ּ���");
			dayData.get(a).setPrice(sc.nextInt());
			break;
		default :
			System.out.println("1,2,3,4�� �Է����ּ���");
		}
	}
	public void pritnValue() {
		System.out.println(dayData.get(1).getGoods());
	}
	//�Ϻ��հ�, �����հ� �����
	public void sumDay() {
		int sum = 0;
		System.out.println("�� �� �Է����ּ���");
		int i = sc.nextInt();
		System.out.println("�� �� �Է����ּ���");
		int j = sc.nextInt();
		System.out.println();
		
		for (Data a : dayData.values() ) {
			if(a.getMonth()==i && a.getDay()==j) {
					sum += a.getPrice();
			}
		}
		System.out.println(sum);
	}
	public void sumMonth() {
		int sum = 0;
		System.out.println("�� �� ������ ����Ͻðڽ��ϱ�?");
		int i = sc.nextInt();
		
		for (Data a : dayData.values()) {
			if(a.getMonth()==i) {
					sum += a.getPrice();
			}
		}
		System.out.println(sum);
	}
	
	public void doProcess() {
		while(true) {
			System.out.println("������ �Ͻðڽ��ϱ�? \n" + 
		"1.����� ��ȸ 2.���� ���  3.��� ����  4.��� ���� 5.�Ϻ��հ���ȸ 6.�����հ���ȸ");
			switch(sc.nextInt()) {
			case 1:
				printData();
				break;
			case 2:
				addData();
				break;
			case 3:
				deleteData();
				break;
			case 4:
				modifyData();
				break;
			case 5:
				sumDay();
				break;
			case 6:
				sumMonth();
				break;
			default :
				System.out.println("1~6���ڸ� �Է�!");
			}
		}
	}
	
	
}
