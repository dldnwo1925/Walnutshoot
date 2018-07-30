package P_ManageBook;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class ManageBook {
	Scanner sc = new Scanner(System.in);
	
	Map<Integer,Data> dayData = new HashMap<Integer,Data>();
	Map<Integer,Data> monthData = new HashMap<Integer,Data>();
	
	//조회기능
	public void printData() {
		if(dayData.size()== 0) {
			System.out.println("정보가 없습니다 입력해주세요");
		}else {
			for (Data a : dayData.values()) {
				System.out.println(a);
			}
		}
	}
	
	//추가기능
	public void addData() {
		int month;
		System.out.println("몇월인지 입력해 주세요(숫자만 입력)");
		month = sc.nextInt();
		int day;
		System.out.println("몇일인지 입력해 주세요(숫자만 입력)");
		day = sc.nextInt();
		sc.nextLine();
		String goods;
		System.out.println("지출물품 이름입력");
		goods = sc.nextLine();
		int price;
		System.out.println("물품 가격을 입력해주세요");
		price = sc.nextInt();
		System.out.println("몇 번째 거래내역?");
		int a = sc.nextInt();
		if(dayData.containsKey(a)) {
			System.out.println("이미 존재하는 거래번호입니다\n"+
								"다음 번호로 입력해주세요");
		}else {
		dayData.put(a, new Data(month,day,goods,price));
		}
	}
	
	//삭제기능
	public void deleteData() {
		System.out.println("몇 번째 거래내역을 지우시겠습니까?");
		int a= sc.nextInt();
		dayData.remove(a);
	}
	//수정기능
	public void modifyData() {
		System.out.println("몇 번째 거래내역을 수정하시겠습니까?");
		int a = sc.nextInt();
		System.out.println("무엇을 수정하시겠습니까? \n"
				+ "1. 월" + "2. 일" + "3. 물품이름" + "4.가격");
		switch(sc.nextInt()) {
		case 1:
			System.out.println("수정할 월을 입력해주세요");
			dayData.get(a).setMonth(sc.nextInt());
			break;
		case 2:
			System.out.println("수정할 일을 입력해주세요");
			dayData.get(a).setDay(sc.nextInt());
			break;
		case 3:
			System.out.println("수정할 물품이름을 입력해주세요");
			dayData.get(a).setGoods(sc.nextLine());
			break;
		case 4:
			System.out.println("수정할 가격을 입력해주세요");
			dayData.get(a).setPrice(sc.nextInt());
			break;
		default :
			System.out.println("1,2,3,4만 입력해주세요");
		}
	}
	public void pritnValue() {
		System.out.println(dayData.get(1).getGoods());
	}
	//일별합계, 월별합계 만들기
	public void sumDay() {
		int sum = 0;
		System.out.println("몇 월 입력해주세요");
		int i = sc.nextInt();
		System.out.println("몇 일 입력해주세요");
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
		System.out.println("몇 월 지출을 계산하시겠습니까?");
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
			System.out.println("무엇을 하시겠습니까? \n" + 
		"1.가계부 조회 2.지출 등록  3.목록 삭제  4.목록 수정 5.일별합계조회 6.월별합계조회");
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
				System.out.println("1~6숫자만 입력!");
			}
		}
	}
	
	
}
