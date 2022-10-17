package jdbc0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test05_insert {

	public static void main(String[] args) {
		// ������ �̿��ؼ� sungjuk ���̺� �� �߰� ����

		try {

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("����Ŭ DB ���� ���� ����!!");

			String name = "������";
			int kor = 99, eng = 98, mat = 100;
			String addr = "Seoul";

			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, wdate) ");
			sql.append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, sysdate) ");
			// -> ? Ư�������� ������ �� �ִ� ǥ��

			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			// -> ?�� ����, ����, �ڷ����� ��ġ�ؾ� �Ѵ�.
			pstmt.setString(1, name); // 1-> ù��° ����ǥ, unameĮ��
			pstmt.setInt(2, kor); // 2 -> �ι�° ����ǥ, korĮ��
			pstmt.setInt(3, eng); // 3 -> ����° ����ǥ ,engĮ��
			pstmt.setInt(4, mat); // 4 -> �׹�° ����ǥ ,matĮ��
			pstmt.setString(5, addr); // 5 -> �ټ���° ����ǥ ,addrĮ��

			int cnt = pstmt.executeUpdate(); // ���� ������ ���� ������ ��ȯ
			if (cnt == 0) {
				System.out.println("�� �߰� ����!!");
			} else {
				System.out.println("�� �߰� ����~~");
			} // if end

			pstmt.close();
			con.close();

		} catch (Exception e) {
			System.out.println("����: " + e);
		}

		System.out.println("END");

	}// main() end

}// class end
