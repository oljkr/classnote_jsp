package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test04_selectAvg {

	public static void main(String[] args) {
		// ����) �ּҰ� ������ ����� ������ ��հ��� ���Ͻÿ�
		// (��, �Ҽ����� �ݿø��ؼ� ��°�ڸ������� ǥ��)
		String addr = "Seoul";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			System.out.println("����Ŭ DB ���� ���� ����!!");

			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT round(avg(kor),2) as avg_kor ");
			sql.append(" , round(avg(eng),2) as avg_eng ");
			sql.append(" , round(avg(mat),2) as avg_mat ");
			sql.append(" FROM sungjuk ");
			sql.append(" WHERE addr=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, addr);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("�ڷ�����~~");
				// 1)Į������ ����
				System.out.printf("�������:%.2f\n", rs.getDouble(1));
				System.out.printf("�������:%.2f\n", rs.getDouble(2));
				System.out.printf("�������:%.2f\n", rs.getDouble(3));

				// 1)Į���� ����
				System.out.printf("�������:%.2f\n", rs.getDouble("avg_kor"));
				System.out.printf("�������:%.2f\n", rs.getDouble("avg_eng"));
				System.out.printf("�������:%.2f\n", rs.getDouble("avg_mat"));

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
				if (con != null) { con.close(); }
			} catch (Exception e) {}
		}

		System.out.println("END");
	}// main() end

}
