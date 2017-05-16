package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Show;
import com.util.DbUtil;

public class ShowDao {
	public boolean addShow(Show s) {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		int result = 0;
		sql = "insert t_show values(NULL,?,0,?,?)";
		try {
			con = DbUtil.getCon();
			pst = con.prepareStatement(sql);
			pst.setString(1, s.getShowTitle());
			pst.setInt(2, s.getShowUser());
			pst.setString(3, s.getShowFileName());
			result = pst.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (result > 0) {
			return true;
		}
		return false;
	}

	public List<Show> getShowList(int start) throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		sql = "SELECT t_show.*,t_user.`user_realname` FROM t_show LEFT JOIN t_user ON t_user.`user_id`=t_show.`show_user` LIMIT ?,6;";
		con = DbUtil.getCon();
		pst = con.prepareStatement(sql);
		pst.setInt(1, start);
		ResultSet rs = pst.executeQuery();
		List<Show> sList = new ArrayList<Show>();
		while (rs.next()) {
			Show s = new Show();
			s.setShowFileName(rs.getString("show_file_name"));
			s.setShowId(rs.getInt("show_id"));
			s.setShowStars(rs.getInt("show_stars"));
			s.setShowTitle(rs.getString("show_title"));
			s.setUserName(rs.getString("user_realname"));
			s.setShowUser(rs.getInt("show_user"));
			sList.add(s);
		}
		return sList;
	}

	public Integer getShowListNums() throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		sql = "SELECT COUNT(*) AS totalNums FROM t_show;";
		con = DbUtil.getCon();
		pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();

		if (rs.next()) {
			return rs.getInt("totalNums");
		}
		return 0;
	}

	public boolean isStarShow(int starUser, int starShow) throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		sql = "SELECT * FROM t_show_star WHERE star_user =? AND star_show=?;";
		con = DbUtil.getCon();
		pst = con.prepareStatement(sql);
		pst.setInt(1, starUser);
		pst.setInt(2, starShow);
		ResultSet rs = pst.executeQuery();

		if (rs.next()) {
			return true;
		}
		return false;
	}
	
	public boolean addStarShow(int starUser, int starShow) throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		sql = "INSERT INTO t_show_star VALUES(NULL,?,?);";
		con = DbUtil.getCon();
		pst = con.prepareStatement(sql);
		pst.setInt(1, starShow);
		pst.setInt(2, starUser);
		int result =pst.executeUpdate();
		if (result>0) {
			return true;
		}
		return false;
	}
	
	public boolean updateShowStars( int showId) throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		sql = "UPDATE t_show SET show_stars=show_stars+1 WHERE show_id=?;";
		con = DbUtil.getCon();
		pst = con.prepareStatement(sql);
		pst.setInt(1, showId);
		int result =pst.executeUpdate();
		if (result>0) {
			return true;
		}
		return false;
	}

}
