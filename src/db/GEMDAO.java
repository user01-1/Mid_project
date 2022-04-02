package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GEMDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	Vector<GameListBean> v = null;

	// 커넥션 풀을 이용한 db 연결
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

	// 최신순 게임을 리턴하는 메소드
	public Vector<GameListBean> SelectGame() {
		getCon();
		Vector<GameListBean> v = new Vector<>();

		try {
			String sql = "select * from game order by release desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0;

			while (rs.next()) {
				GameListBean bean = new GameListBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));

				v.add(bean);
				count++;
				if (count > 2)
					break;
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return v;
	}

	// 카테고리별 게임 리스트 저장하는 메소드
	public Vector<GameListBean> getTypeGame(String type) {
		getCon();
		Vector<GameListBean> v = new Vector<>();
		GameListBean bean = null;

		try {
			String sql = "select *from game where gameType=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();

			// 반복문 돌면서 데이터 저장
			while (rs.next()) {
				bean = new GameListBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));
				// 벡터에 bean클래스 저장
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}

		return v;
	}
	


	// 모든 게임을 검색하는 메소드
	public Vector<GameListBean> getAllGame() {
		Vector<GameListBean> v = new Vector<>();
		// 데이터 저장할 bean 클래스 선언
		// 지역변수라서 null로 초기화
		GameListBean bean = null;
		getCon();

		try {
			String sql = "select *from game";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 반복문 돌면서 데이터 저장
			while (rs.next()) {
				bean = new GameListBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));
				// 벡터에 bean클래스 저장
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}

		return v;
	}

	// 하나의 게임 정보를 리턴하는 메소드
	public GameListBean getOneGame(String gameName) {
		GameListBean bean = new GameListBean();
		getCon();

		try {
			String sql = "select *from game where gameName=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gameName);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}

		return bean;
	}

	// 장바구니에 하나의 게임 추가
	public void setBasketInsert(GameListBean bean) {

		try {
			getCon();
			String sql = "insert into basket values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getGameName());
			pstmt.setInt(2, bean.getPrice());
			pstmt.setString(3, bean.getImg());
			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 장바구니 모두 출력
	public Vector<BasketBean> BasketAllList() {
		Vector<BasketBean> v = new Vector<>();
		BasketBean bean = null;
		getCon();

		try {
			String sql = "select *from basket";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new BasketBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setImg(rs.getString(3));
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return v;
	}

	// 장바구니 초기화
	public void BasketALLClean() {
		getCon();
		try {
			String sql = "truncate table basket";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// 구매한 게임을 내 게임 데이터 베이스로 보냄.
	public void setMyGameInsert(GameListBean bean) {

		try {
			getCon();
			String sql = "insert into Mygame values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getGameName());
			pstmt.setInt(2, bean.getPrice());
			pstmt.setString(3, bean.getGameInfo());
			pstmt.setString(4, bean.getGameType());
			pstmt.setInt(5, bean.getRelease());
			pstmt.setString(6, bean.getDeveloper());
			pstmt.setString(7, bean.getEvaluation());
			pstmt.setString(8, bean.getImg());

			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 내 게임 모두 출력
	public Vector<GameListBean> MyGameAllList() {
		Vector<GameListBean> v = new Vector<>();
		GameListBean bean = null;
		getCon();

		try {
			String sql = "select *from mygame";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new GameListBean();
				bean.setGameName(rs.getString(1));
				bean.setPrice(rs.getInt(2));
				bean.setGameInfo(rs.getString(3));
				bean.setGameType(rs.getString(4));
				bean.setRelease(rs.getInt(5));
				bean.setDeveloper(rs.getString(6));
				bean.setEvaluation(rs.getString(7));
				bean.setImg(rs.getString(8));
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		return v;
	}

	// 로그아웃하면 게임 다 없어진다
	public void MyGameALLClean() {
		getCon();
		try {
			String sql = "truncate table MyGame";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// 장바구니 항목 제거 메소드
	public void BasketRemove(String gameName) {
		getCon();
		try {
			
			String sql = "delete from basket where gameName=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gameName);
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
		}
}
