package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test07_selectPaging {

	public static void main(String[] args) {
		// ����¡
		// ����) sungjuk���̺��� �̸������� ������ ���ȣ 4~6�� ��ȸ�Ͻÿ�
		int start = 4; // ���� ���ȣ
		int end = 6; // �� ���ȣ

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

			sql.append(" select * ");
			sql.append(" from( ");
			sql.append(" select BB.sno, BB.uname, BB.addr, rownum as rnum ");
			sql.append(" from ( ");
			sql.append("     select AA.sno,AA.uname, AA.addr ");
			sql.append("     from ( ");
			sql.append("         select sno, uname, addr ");
			sql.append("         from sungjuk ");
			sql.append("         order by uname ");
			sql.append("         )AA ");
			sql.append("     )BB ");
			sql.append(" ) ");
			sql.append(" where ?<=rnum and rnum<=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("�ڷ�����~~");

				do {
					System.out.print(rs.getInt("sno") + " ");
					System.out.print(rs.getString("uname") + " ");
					System.out.print(rs.getString("addr") + " ");
					System.out.print(rs.getInt("rnum") + " ");
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
