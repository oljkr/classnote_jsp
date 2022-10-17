package jdbc0921;

import java.sql.DriverManager;

public class Test01_DBOpen {

	public static void main(String[] args) {
		// Oracle DB 18c XE ����

		try {

			// 1) ����Ŭ DB ���� ���� ���� ����
			// String url = "localhost:1521:xe"; // localhost��� 127.0.0.1��� ��� ��.
			// localhost�� ���� ������� �������� ���� pc�� �ǹ��ϹǷ� ���� local host��� ���� ����.
			// ��Ʈ��ȣ�� 1521�� ���. �׸��� �츮�� ��ġ�� ������ xe�����̶�� ��.
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc8.jar

			// 2)����̹� �ε�
			Class.forName(driver); // Ŭ������ �������. ���� ��Ƴ��´ٰ� �����ϸ� ��.

			// 3)����Ŭ DB ���� ����
			DriverManager.getConnection(url, user, password);
			System.out.println("����Ŭ DB ���� ���� ����!!");

		} catch (Exception e) {
			System.out.println("����Ŭ DB ���� ���� : " + e);
		} // end

	}

}
