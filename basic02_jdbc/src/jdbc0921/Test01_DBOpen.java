package jdbc0921;

import java.sql.DriverManager;

public class Test01_DBOpen {

	public static void main(String[] args) {
		// Oracle DB 18c XE 연결

		try {

			// 1) 오라클 DB 서버 연결 관련 정보
			// String url = "localhost:1521:xe"; // localhost대신 127.0.0.1라고 적어도 됨.
			// localhost를 쓰면 상대적인 개념으로 나의 pc를 의미하므로 요즘엔 local host라고 많이 쓴다.
			// 포트번호를 1521로 줬다. 그리고 우리가 설치한 버전은 xe버전이라는 뜻.
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc8.jar

			// 2)드라이버 로딩
			Class.forName(driver); // 클래스를 만들어줌. 길을 깔아놓는다고 생각하면 됨.

			// 3)오라클 DB 서버 연결
			DriverManager.getConnection(url, user, password);
			System.out.println("오라클 DB 서버 연결 성공!!");

		} catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		} // end

	}

}
