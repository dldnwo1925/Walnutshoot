import java.util.*;

public class HashMapNation {

	public static void main(String[] args){

		System.out.println("나라 이름과 인구를 5개 입력하세요(예 : Korea 5000)");

		HashMap<String, Integer> h = new HashMap<String,Integer>();

		Scanner scanner = new Scanner(System.in);

		for(int i=0;i<5;i++){

			System.out.print("나라 이름, 인구 >>");

			String nation = scanner.next();

			int population = scanner.nextInt();

			h.put(nation,population);

		}

		int max = 0;

		String nation = "";

		Set<String> names = h.keySet();

		Iterator<String> it = names.iterator();

		while(it.hasNext()){

			String name = it.next();

			int n = h.get(name);

			if(max < n){

				max = n;

				nation = name;

			}

		}

		System.out.println("제일 인구가 많은 나라는 (" + nation +"," + max +")");		

	}

}

