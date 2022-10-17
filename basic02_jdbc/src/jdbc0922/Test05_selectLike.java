package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test05_selectLike {

	public static void main(String[] args) {
		// Like ������ ����
		// ����) �̸��� '��' ���� �ִ� ���� ��ȸ�Ͻÿ�
		String col = "uname"; // �˻�Į�� keyfield
		String word = "��"; // �˻��� keyword

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
			sql.append(" SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate ");
			sql.append(" FROM sungjuk ");

			// �˻�� �����ϴ���?
			if (word.length() > 0) {
				// where uname like '%��%'
				String where = " WHERE " + col + " LIKE '%" + word + "%' ";
				sql.append(where);
			} // if end

			sql.append(" ORDER BY sno DESC ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("�ڷ�����~~");

				do {
					System.out.print(rs.getInt("sno") + " ");
					System.out.print(rs.getString("uname") + " ");
					System.out.print(rs.getInt("kor") + " ");
					System.out.print(rs.getInt("eng") + " ");
					System.out.print(rs.getInt("mat") + " ");
					System.out.print(rs.getInt("tot") + " ");
					System.out.print(rs.getInt("aver") + " ");
					System.out.print(rs.getString("addr") + " ");
					System.out.print(rs.getString("wdate") + " ");
					System.out.println();
				} while (rs.next());

			} else {
				System.out.println("�ڷ����!!");
			}

		} catch (Exception e) {
			System.out.println("����: " + e);
		} finally {// �ڿ��ݳ�(��������)
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
			}

			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
			}
		}

		System.out.println("END");
	}// main() end

}
