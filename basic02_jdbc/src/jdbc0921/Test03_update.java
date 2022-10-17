package jdbc0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test03_update {

	public static void main(String[] args) {
		// sungjuk 테이블 행 수정 연습

		try {

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("오라클 DB 서버 연결 성공!!");

			// 4)SQL작성
			// ->주의사항)SQL 종결문자 ; 를 쓰면 오류남.
			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET tot=kor+eng+mat ");
			sql.append(" , aver=(kor+eng+mat)/3 ");
			sql.append(" WHERE sno=61 ");

			PreparedStatement pstmt = con.prepareStatement(sql.toString());

			int cnt = pstmt.executeUpdate(); // 실행 했을때 행의 갯수가 반환
			if (cnt == 0) {
				System.out.println("행 수정 실패!!");
			} else {
				System.out.println("행 수정 성공~~");
			} // if end

			// 자원반납(순서주의)
			pstmt.close();
			con.close();

		} catch (Exception e) {
			System.out.println("실패: " + e);
		}

		System.out.println("END");

	}// main() end

}// class end
