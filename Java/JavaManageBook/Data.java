package P_ManageBook;

public class Data {
	private int month;
	private int day ;
	private String goods ;
	private int price;
	
	
	@Override
	public String toString() {
		return "날짜 : " + month+"월" + day +"일"+ " / 물품이름 : " + goods + " / 물품가격 : " + price + "원";
	}
	public int getMonth() {return month;}
	public void setMonth(int month) {this.month = month;}
	public Data(){
		
	}
	public Data(int month,int day, String goods, int price) {
		this.day = day;
		this.month = month;
		this.goods = goods;
		this.price = price;
		
	}
	
	public int getDay() {return day;}
	public void setDay(int day) {this.day = day;}
	public String getGoods() {return goods;	}
	public void setGoods(String goods) {this.goods = goods;}
	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}
	
}
