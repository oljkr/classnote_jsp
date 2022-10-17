package crawling0923;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test04_choongang {

	public static void main(String[] args) {
		// �߾�����ó���п� ���������� �������� ���� ũ�Ѹ��ؼ�
		// choongang.txt ���Ͽ� �����ϱ�

		try {
			String fileName = "I:/java202207/choongang.txt";
			FileWriter fw = new FileWriter(fileName, true);
			PrintWriter out = new PrintWriter(fw, true);

			String URL = "https://www.choongang.co.kr/html/sub07_01_n.php";

			for (int p = 1; p <= 11; p++) {
				String params = "?page=" + p + "&mod=&idx=";
				Document doc = Jsoup.connect(URL + params).get();
				Elements elements = doc.select(".board_default_list .default_title");
				for (Element element : elements) {
					out.println(element.text()); // choongang.txt ����ϱ�
				} // for end

			} // for end

			out.close();
			fw.close();

			System.out.println("------ choongang.txt �������� ���� ���� �ϼ�!!");

		} catch (Exception e) {
			System.out.println("ũ�Ѹ� ���� : " + e);
		}

	}

}
