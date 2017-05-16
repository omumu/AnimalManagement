package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Care;
import com.model.Show;
import com.util.DbUtil;

public class CareDao {
	public boolean addCare(Care c) {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		int result = 0;
		sql = "insert t_care values(NULL,?,?,?,0,?,?,?)";
		try {
			con = DbUtil.getCon();
			pst = con.prepareStatement(sql);
			pst.setString(1, c.getCareDesc());
			pst.setInt(2, c.getCareTime());
			pst.setInt(3, c.getCareUser());
			pst.setString(4, c.getCarePhone());
			pst.setString(5, c.getCareStartDate());
			pst.setBigDecimal(6, c.getCarePrice());
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

	public List<Care> getCareList(int start, String searchContent) throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		if (searchContent == null || "".equals(searchContent)) {
			sql = "SELECT t_care.*,t_user.`user_realname` FROM t_care LEFT JOIN t_user ON t_care.`care_user`=t_user.`user_id`"
					+ "  LIMIT ?,10;";
			con = DbUtil.getCon();
			pst = con.prepareStatement(sql);
			pst.setInt(1, start);
		} else {
			sql = "SELECT t_care.*,t_user.`user_realname` FROM t_care LEFT JOIN t_user ON t_care.`care_user`=t_user.`user_id`"
					+ "  WHERE t_care.`care_desc` LIKE ? OR t_care.`care_phone` LIKE ? OR t_user.`user_realname` LIKE ?;";
			con = DbUtil.getCon();
			pst = con.prepareStatement(sql);
			pst.setString(1, "%" + searchContent + "%");
			pst.setString(2, "%" + searchContent + "%");
			pst.setString(3, "%" + searchContent + "%");
		}
		ResultSet rs = pst.executeQuery();
		List<Care> cList = new ArrayList<Care>();
		while (rs.next()) {
			Care c = new Care();
			c.setCareDesc(rs.getString("care_desc"));
			c.setCareId(rs.getInt("care_id"));
			c.setCarePhone(rs.getString("care_phone"));
			c.setCareState(rs.getInt("care_state"));
			c.setCareTime(rs.getInt("care_time"));
			c.setCareUserRealName(rs.getString("user_realname"));
			c.setCarePrice(rs.getBigDecimal("care_price"));
			c.setCareStartDate(rs.getString("care_start_date"));
			cList.add(c);
		}
		return cList;
	}


	public List<Care> getMyCareList(int careUser) throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		sql = "SELECT t_care.*,t_user.`user_realname` FROM t_care LEFT JOIN t_user ON t_care.`care_user`=t_user.`user_id` WHERE t_care.`care_user` =?;";
		con = DbUtil.getCon();
		pst = con.prepareStatement(sql);
		pst.setInt(1, careUser);
		ResultSet rs = pst.executeQuery();
		List<Care> cList = new ArrayList<Care>();
		while (rs.next()) {
			Care c = new Care();
			c.setCareDesc(rs.getString("care_desc"));
			c.setCareId(rs.getInt("care_id"));
			c.setCarePhone(rs.getString("care_phone"));
			c.setCareState(rs.getInt("care_state"));
			c.setCareTime(rs.getInt("care_time"));
			c.setCareUserRealName(rs.getString("user_realname"));
			c.setCarePrice(rs.getBigDecimal("care_price"));
			c.setCareStartDate(rs.getString("care_start_date"));
			cList.add(c);
		}
		return cList;
	}

	public Integer getCareListNums() throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		sql = "SELECT COUNT(*) AS totalNums FROM t_care;";
		con = DbUtil.getCon();
		pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();

		if (rs.next()) {
			return rs.getInt("totalNums");
		}
		return 0;
	}

	public boolean updateCareState(int careId) throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		sql = "UPDATE t_care set care_state=1 where care_id = ?;";
		con = DbUtil.getCon();
		pst = con.prepareStatement(sql);
		pst.setInt(1, careId);
		int result = pst.executeUpdate();
		if (result > 0) {
			return true;
		}
		return false;
	}

	public boolean deleteCare(int careId) throws Exception {
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		sql = "delete from t_care where care_id=?;";
		con = DbUtil.getCon();
		pst = con.prepareStatement(sql);
		pst.setInt(1, careId);
		int result = pst.executeUpdate();
		if (result > 0) {
			return true;
		}
		return false;
	}
}
