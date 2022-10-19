package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.bbs.BbsDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class MemberDAO { //Data Access Object
						 //DB 접근 객체 
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public MemberDAO() {
		dbopen=new DBOpen();
	}//end

	//비지니스 로직 구현
	public String loginProc(MemberDTO dto) {
		String mlevel=null;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT mlevel ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? AND passwd=? ");
			sql.append(" AND mlevel in ('A1','B1','C1','D1') ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			rs = pstmt.executeQuery();
			if (rs.next()) { 
				mlevel=rs.getString("mlevel");
			}//if end	
			
		} catch (Exception e) {
			System.out.println("로그인실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return mlevel;
	}//loginProc() end
	
	public int duplecateID(String id) {
		int cnt=0;
		try {
			con=dbopen.getConnection();//DB연결
			
			sql = new StringBuilder();
			sql.append(" SELECT count(id) as cnt");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}//if end
			
		} catch (Exception e) {
			System.out.println("아이디 중복 확인 실패:"+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}
	
	public int duplecateEmail(String email) {
		int cnt=0;
		try {
			con=dbopen.getConnection();//DB연결
			
			sql = new StringBuilder();
			sql.append(" SELECT count(email) as cnt");
			sql.append(" FROM member ");
			sql.append(" WHERE email=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}//if end
			
		} catch (Exception e) {
			System.out.println("이메일 중복 확인 실패:"+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}
	
	public int create(MemberDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();//DB연결
			
			sql = new StringBuilder();
			sql.append(" INSERT INTO member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ");
			sql.append(" VALUES(?,?,?,?,?,?,?,?,?, 'D1', sysdate) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());	
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("회원가입실패:"+e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//create() end
	
	
	public int findID(MemberDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();//DB연결
			
			sql = new StringBuilder();
			sql.append(" SELECT count(email) as cnt");
			sql.append(" FROM member ");
			sql.append(" WHERE mname=? AND email=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMname());
			pstmt.setString(2, dto.getEmail());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}//if end
			
		} catch (Exception e) {
			System.out.println("회원 아이디 찾기 확인 실패:"+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end
		
		return cnt;
	}//findID() end
	
	public String showId(MemberDTO dto) {
		String id="";
		try {
			con=dbopen.getConnection();//DB연결
			
			sql = new StringBuilder();
			sql.append(" SELECT id");
			sql.append(" FROM member ");
			sql.append(" WHERE mname=? AND email=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMname());
			pstmt.setString(2, dto.getEmail());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				id=rs.getString("id");
			}//if end
			
		} catch (Exception e) {
			System.out.println("회원 아이디 찾기 확인 실패:"+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}//end
		
		return id;
	}//showId() end
	
	public int updateTempPw(MemberDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			
			sql.append(" UPDATE member ");
			sql.append(" SET passwd=? ");
			sql.append(" WHERE id=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getId());
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("수정 실패:"+e);
		}finally {
			DBClose.close(con, pstmt);
		}//end

		return cnt;
	}
	
	public MemberDTO read(String id) { 
		MemberDTO dto=null;
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT id, passwd, mname, tel, email, zipcode, address1, address2, job ");
			sql.append(" FROM member  ");
			sql.append(" WHERE id=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				dto=new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJob(rs.getString("job"));
			}else {
				dto=null;
			}//if end			
			
		}catch (Exception e) {
			System.out.println("회원정보 불러오기 실패:" + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return dto;
	}//read() end
	
}//class end
