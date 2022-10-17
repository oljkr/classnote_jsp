package crawling0923;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test03_choongang {

	public static void main(String[] args) {
		// �߾�����ó���п� ���������� �������� ���� ũ�Ѹ� �ϱ�
		try {
			String URL = "https://www.choongang.co.kr/html/sub07_01_n.php";

			// �������� �������� 1~11 �ҽ� ��������
			for (int p = 1; p <= 11; p++) {
				String params = "?page=" + p + "&mod=&idx=";
				// System.out.println(params);
				Document doc = Jsoup.connect(URL + params).get();
				// System.out.println(doc.toString());

				// ��� �����ϱ�
				/**
				 * <tr class="board_dafault_list">
				 * <td class="default_title">[22�� 9�� 02��] 9�� ����� ��û ��� Ư��</td>
				 */
				// Elements elements = doc.select(".default_title");
				Elements elements = doc.select(".board_default_list .default_title");
				for (Element element : elements) { // for(����:���)
					System.out.println(element.text());
				} // for end

			} // for end

		} catch (Exception e) {
			System.out.println("ũ�Ѹ� ���� : " + e);
		}

	}

}
