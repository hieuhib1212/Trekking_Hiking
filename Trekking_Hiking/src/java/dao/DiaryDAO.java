/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.DiaryItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Hiệu Bùi
 */
public class DiaryDAO {
    public ArrayList<DiaryItem> getDiary() throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<DiaryItem> listDiary = new ArrayList<>();
        try {
            String query = "SELECT [ID]\n"
                    + "      ,[Title]\n"
                    + "      ,[Image_Url]\n"
                    + "      ,[Content]\n"
                    + "  FROM [Diary]";
            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                DiaryItem diary = new DiaryItem();
                diary.setId(rs.getInt("ID"));
                diary.setTitle(rs.getString("Title"));
                diary.setContent(rs.getString("Content"));
                diary.setImg_url(rs.getString("Image_Url"));
                listDiary.add(diary);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return listDiary;
    }
    public ArrayList<DiaryItem> getDiaryWithPaging(int index) throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<DiaryItem> listDiary = new ArrayList<>();
        int linkTo = index * db.getdiaryPagingSize();
        int linkFrom = linkTo - db.getdiaryPagingSize() + 1;
        try {
            String sql = "SELECT * FROM\n"
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY [ID] ASC) as rn,* from Diary) AS rnNumber\n"
                    + "WHERE rn between ? and ?";
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, linkFrom);
            ps.setInt(2, linkTo);
            rs = ps.executeQuery();
            while (rs.next()) {
                DiaryItem diary = new DiaryItem();
                diary.setId(rs.getInt("ID"));
                diary.setTitle(rs.getString("Title"));
                diary.setContent(rs.getString("Content"));
                diary.setImg_url(rs.getString("Image_Url"));
                listDiary.add(diary);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return listDiary;
    }
    public int countDiary() throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) as numberDiary FROM Diary";
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("numberDiary");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return count;
    }
}
