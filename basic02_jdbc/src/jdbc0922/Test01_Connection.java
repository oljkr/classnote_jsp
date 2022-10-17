package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test01_Connection {

	public static void main(String[] args) {
		// sungjuk 테이블의 행의 갯수를 출력하시오
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select문을 실행한 결과(논리적테이블)을 저장
		// 이 3개는 db와 관련된 인터페이스이기 때문에 다 썼으면 자원반납을 해야한다.
		// 아래 finally문에서 자원 반납을 해 준다.

		try {

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			System.out.println("오라클 DB 서버 연결 성공!!");

			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT COUNT(*) AS cnt ");
			sql.append(" FROM sungjuk ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery(); // select문 실행
			// cursor: 행을 가리키는 값. 이동할 수 있다
			if (rs.next()) { // cursor가 있는지?
				System.out.println("자료있음~~");
				// 1)칼럼 순서 접근
				System.out.println("전체 행 갯수 : " + rs.getInt(1)); // 1번칼럼
				// 2)칼럼명으로 접근
				// ->select cnt ~~~
				System.out.println("전체 행 갯수 : " + rs.getInt("cnt"));

			} else {
				System.out.println("자료없음!!");
			}

		} catch (Exception e) {
			System.out.println("실패: " + e);
		} finally {// 자원반납(순서주의)
			try {
				if (rs != null) { rs.close(); }
			} catch (Exception e) {}

			try {
				if (pstmt != null) { pstmt.close();	}
			} catch (Exception e) {}

			try {
				if (con != null) { con.close();	}
			} catch (Exception e) {}
		}

		System.out.println("END");

	}// main() end

}
