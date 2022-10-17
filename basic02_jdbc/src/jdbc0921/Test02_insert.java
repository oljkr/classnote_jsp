package jdbc0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test02_insert {

	public static void main(String[] args) {
		// sungjuk ���̺� �� �߰� ����

		try {

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			System.out.println("����Ŭ DB ���� ���� ����!!");

			// 4)SQL�ۼ�
			// ->���ǻ���)SQL ���Ṯ�� ; �� ���� ������.
			StringBuilder sql = new StringBuilder();
			sql.append(" insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)");
			sql.append(" values (sungjuk_seq.nextval, '�����', 99, 98, 97, 'Seoul', sysdate)");
			// System.out.println(sql.toString());

			// 5)SQL�������� ��ȯ
			PreparedStatement pstmt = con.prepareStatement(sql.toString());

			// 6)SQL�� ����
			int cnt = pstmt.executeUpdate(); // INSERT, UPDATE, DELETE�� ����

			System.out.println("������ : " + cnt);

		} catch (Exception e) {
			System.out.println("����: " + e);
		}

		System.out.println("END");

	}// main() end

}// class end
