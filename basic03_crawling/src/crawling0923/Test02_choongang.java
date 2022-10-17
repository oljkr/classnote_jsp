package crawling0923;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Test02_choongang {

	public static void main(String[] args) {
		// �߾�����ó���п� ���������� �������� ���� ũ�Ѹ� �ϱ�
		try {
			String URL = "https://www.choongang.co.kr/html/sub07_01_n.php";

			// �������� �������� 1~11 �ҽ� ��������
			for (int p = 1; p <= 11; p++) {
				String params = "?page=" + p + "&mod=&idx=";
				// System.out.println(params);
				Document doc = Jsoup.connect(URL + params).get();
				System.out.println(doc.toString());

			} // for end

		} catch (Exception e) {
			System.out.println("ũ�Ѹ� ���� : " + e);
		}

	}

}
