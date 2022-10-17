package crawling0923;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test08_itwill {

	public static void main(String[] args) {
		// 연습) 솔데스크 웹페이지에서 공지사항 제목만 크롤링해서
		// soldesk.txt 파일에 저장하기

		try {
			String fileName = "I:/java202207/itwill.txt";
			FileWriter fw = new FileWriter(fileName, true);
			PrintWriter out = new PrintWriter(fw, true);

			String URL = "https://www.itwill.co.kr/cmn/board/BBSMSTR_000000000071/bbsList.do";

			for (int p = 1; p <= 4; p++) {
				String params = "?pageIndex=";

				Document doc = Jsoup.connect(URL + params + p).get();
//				System.out.println(doc.toString());

				Elements elements = doc.select(".bgcol01");
				// Elements elements = doc.select(" tbody > tr > td > a");

				for (Element element : elements) {
					out.println(element.text());
				} // for end

			} // for end

			out.close();
			fw.close();

			System.out.println("------ itwill.txt 공지사항 제목 저장 완성!!");

		} catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}

	}

}
