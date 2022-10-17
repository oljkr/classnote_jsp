package crawling0923;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test06_NaverMovie {

	public static void main(String[] args) {
		// ���̹� ��ȭ ���� �ı� ũ�Ѹ��ϱ�
		// ��)"����2" ��ȭ ���� ������ ���������� ���� �� ũ�Ѹ��ϱ�(1������)

		try {

			// ���̹� ��ȭ ���� �ı� ������ �ּ�
			String URL = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";
			String params = "?code=201641"; // ��ȭ�ڵ��ȣ
			params += "&type=after&onlyActualPointYn=N&onlySpoilerPointYn=N";
			params += "&order=sympathyScore"; // ������
			params += "&page=1";

			Document doc = Jsoup.connect(URL + params).get();
			// System.out.println(doc.toString());

			/*
			 * // 1. ���� ������ �ִ� ��� // <span id="_filtered_ment_0"> </span> // ... // <span
			 * id="_filtered_ment_9"> </span>
			 * 
			 * for (int ment = 0; ment <= 9; ment++) { Elements elements =
			 * doc.select("#_filtered_ment_" + ment); for (Element element : elements) {
			 * System.out.println(element.text()); } // for end } // for end
			 */
			////////////////////////////////////////////////////

			// 2. ���� ������ �ִ� ���
			/*
			 * <div class="score_reple"> <p> <span class="ico_viewer">������</span> <span
			 * id="_filtered_ment_0"> ���� �ٴϿ� ��� ���ߤ��� </span> </p> </div>
			 */
			Elements elements = doc.select(".score_reple p");
			// ���ʿ��� ��� �����ϱ� <span class="ico_viewer">������</span>
			elements.select(".ico_viewer").remove();

			for (Element element : elements) {
				System.out.println(element.text());
			} // for end

		} catch (Exception e) {
			System.out.println("ũ�Ѹ� ���� : " + e);
		}
	}

}
