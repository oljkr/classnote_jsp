package crawling0923;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test07_NaverMovie {

	public static void main(String[] args) {
		// ���̹� ��ȭ ���� �ı� ũ�Ѹ��ϱ�
		// ��)"����2" ��ȭ ���� ������ ���������� ���� �� ũ�Ѹ��ϱ�(�뷫 9690��)
		// gongjo.txt ���Ͽ� �����ϱ�

		try {
			String fileName = "I:/java202207/gongjo.txt";
			FileWriter fw = new FileWriter(fileName, true);
			PrintWriter out = new PrintWriter(fw, true);

			// ���̹� ��ȭ ���� �ı� ������ �ּ�
			String URL = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";
			String params = "?code=201641"; // ��ȭ�ڵ��ȣ
			params += "&type=after&onlyActualPointYn=N&onlySpoilerPointYn=N";
			params += "&order=sympathyScore"; // ������
			params += "&page="; // �뷫 1~969������

			// ������ order=sympathyScore
			// �ֽż� order=newest
			// ���������� order=highest
			// ���������� order=lowest

			for (int p = 1; p <= 969; p++) {
				System.out.println("�����ͼ�����...");
				Document doc = Jsoup.connect(URL + params + p).get();
				for (int ment = 0; ment <= 9; ment++) {
					Elements elements = doc.select("#_filtered_ment_" + ment);
					for (Element element : elements) {
						out.println(element.text());
					}
				}
			}

			out.close();
			fw.close();

			System.out.println("------ gongjo.txt ����2 ���� ���� �ϼ�!!");

		} catch (Exception e) {
			System.out.println("ũ�Ѹ� ���� : " + e);
		}
	}

}
