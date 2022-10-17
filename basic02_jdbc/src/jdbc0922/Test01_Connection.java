package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test01_Connection {

	public static void main(String[] args) {
		// sungjuk ���̺��� ���� ������ ����Ͻÿ�
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select���� ������ ���(�������̺�)�� ����
		// �� 3���� db�� ���õ� �������̽��̱� ������ �� ������ �ڿ��ݳ��� �ؾ��Ѵ�.
		// �Ʒ� finally������ �ڿ� �ݳ��� �� �ش�.

		try {

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			System.out.println("����Ŭ DB ���� ���� ����!!");

			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT COUNT(*) AS cnt ");
			sql.append(" FROM sungjuk ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery(); // select�� ����
			// cursor: ���� ����Ű�� ��. �̵��� �� �ִ�
			if (rs.next()) { // cursor�� �ִ���?
				System.out.println("�ڷ�����~~");
				// 1)Į�� ���� ����
				System.out.println("��ü �� ���� : " + rs.getInt(1)); // 1��Į��
				// 2)Į�������� ����
				// ->select cnt ~~~
				System.out.println("��ü �� ���� : " + rs.getInt("cnt"));

			} else {
				System.out.println("�ڷ����!!");
			}

		} catch (Exception e) {
			System.out.println("����: " + e);
		} finally {// �ڿ��ݳ�(��������)
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
