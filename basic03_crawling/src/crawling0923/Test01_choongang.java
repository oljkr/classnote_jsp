package crawling0923;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Test01_choongang {

	public static void main(String[] args) {
		// �߾�����ó���п� ���������� �������� ���� ũ�Ѹ� �ϱ�
		try {
			String URL = "https://www.choongang.co.kr/html/sub07_01_n.php?page=1&mod=&idx=";

			// �������� �ҽ� ��������
			Document doc = Jsoup.connect(URL).get();
			System.out.println(doc.toString());

		} catch (Exception e) {
			System.out.println("ũ�Ѹ� ���� : " + e);
		}

	}

}
