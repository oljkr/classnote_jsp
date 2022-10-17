package jdbc0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test04_delete {

	public static void main(String[] args) {
		// sungjuk ���̺� �� ���� ����

		try {

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("����Ŭ DB ���� ���� ����!!");

			StringBuilder sql = new StringBuilder();
			sql.append(" DELETE FROM sungjuk WHERE sno=61 ");

			PreparedStatement pstmt = con.prepareStatement(sql.toString());

			int cnt = pstmt.executeUpdate(); // ���� ������ ���� ������ ��ȯ
			if (cnt == 0) {
				System.out.println("�� ���� ����!!");
			} else {
				System.out.println("�� ���� ����~~");
			} // if end

			pstmt.close();
			con.close();

		} catch (Exception e) {
			System.out.println("����: " + e);
		}

		System.out.println("END");

	}// main() end

}// class end
