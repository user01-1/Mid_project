package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//오라클 데이터 베이스에 연결하고
//select, insert, update, delete 작업을 실행해주는 클래스
public class MemberDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	Vector<GameListBean> v = null;

	
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스에 접근 실패");
		}
	}

	// 데이터 베이스에 한 사람의 회원 정보를 저장해주는 메소드
	public void insertMember(MemberBean bean) {
		try {
			getCon();
			String sql = "insert into member values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPass1());
			pstmt.setString(3, bean.getPass2());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getTel());
			pstmt.setString(6, bean.getAddress());

			pstmt.executeUpdate(); // insert, update, delete 시 사용하는 메소드.
			con.close();
		} catch (Exception e) {
			e.printStackTrace();		
		}
	}

	// 한 회원의 정보 출력
	public MemberBean oneSelectMember(String id) {
		getCon();
		// 한 사람에 대한 정보만 리턴하기에 bean 클래스 객체 생성
		MemberBean bean = new MemberBean();
		try {
			String sql = "select * from member where id=?"; // 조건
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // 1번 물음표에 id값 매핑

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setPass2(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setTel(rs.getString(5));
				bean.setAddress(rs.getString(6));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 한 회원의 정보를 수정하는 메소드
	public void updateMember(MemberBean bean) {
		getCon();
		
		try {
			String sql = "update member set email=?, tel=?, address=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getAddress());
			pstmt.setString(4, bean.getId());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 한 회원의 정보를 삭제하는 메소드
	public void deleteMember(String id) {

		getCon();

		try {
			String sql = "delete from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	//password값 얻는 것
	public String getPass(String id) {
		String pass = "";
		try {
			getCon();
			String sql = "select pass1 from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pass = rs.getString(1); // 패스워드 값이 저장된 칼럼 인덱스가 1번임.
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass;
	}
	
	// 회원 정보가 존재하는지 비교
	public int getMember(String id, String pass) {
		int result = 0; // 0이면 회원X
		getCon();

		try {
			String sql = "select count(*) from member where id=? and pass1=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return result;
	}
}
