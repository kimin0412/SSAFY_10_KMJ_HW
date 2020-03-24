package app;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import virus.Corona;

public class CoronaStreamTest {

	public static void main(String[] args) {
		List<Corona> list = new ArrayList<Corona>();
		Random r = new Random();

		for (int i = 0; i < 10000; i++) {
			String name = "Corona" + i;
			int level = r.nextInt(50);
			String spreadSpeed = "S" + r.nextInt(10);
			list.add(new Corona(name, level, spreadSpeed));
		}
		
		int count = (int) list.stream().filter(f -> f.getLevel() > 30).count();

		System.out.println("Corona Count : " + count);
	}


}

/**
 * 프로젝트에 클래스들이 너무 많이 필요해져서 보실때 복잡하실가봐 클래스 파일만 올렸습니다ㅠㅠ
 * 혹시 프로젝트 파일로 제출해야 한다면 다시 제출하겠습니다...!
 */
