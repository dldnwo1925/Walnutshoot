import java.util.*;

public class TravelManager {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);

		ArrayList<Location> al = new ArrayList<Location>();

		System.out.println("쥐가 이동한 위치(x,y)를 5개 입력하라.");

		al.add(new Location(0, 0));

		for (int i = 0; i < 5; i++) {

			System.out.print(">>");

			al.add(new Location(scanner.nextInt(), scanner.nextInt()));

		}

		al.add(new Location(0, 0));

		double sum, tz = 0;

		for (int i = 1; i < al.size(); i++) {

			Location p = al.get(i - 1);// 이전 위치

			double x = p.getX();

			double y = p.getY();



			Location p2 = al.get(i);// 현재 위치

			double x2 = p2.getX();

			double y2 = p2.getY();



			double tx = x2 - x;

			double ty = y2 - y;



			sum = (tx * tx) + (ty * ty); // 피타고라스 정리

			tz = tz + Math.sqrt(sum); // 제곱근, 이동거리 누적

		}

		System.out.println("총 이동 거리는 " + tz);

	}

}

