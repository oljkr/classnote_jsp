package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test06_quiz {

	public static void main(String[] args) {
		// ��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
		/*
		 * g1001 p001 OOP g1001 p003 JSP g1001 d001 HTML
		 */
		String hakno = "g1001";

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

			sql.append(" SELECT SU.hakno, SU.gcode, GW.gname ");
			sql.append(" FROM tb_sugang SU join tb_gwamok GW ");
			sql.append(" ON SU.gcode = GW.gcode ");
			sql.append(" WHERE SU.hakno=? ");
			sql.append(" ORDER BY SU.gcode ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, hakno);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("�ڷ�����~~");

				do {
					System.out.print(rs.getString("hakno") + " ");
					System.out.print(rs.getString("gcode") + " ");
					System.out.print(rs.getString("gname") + " ");
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
