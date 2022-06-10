/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.TrekkingLink;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Hiệu Bùi
 */
public class LinkDAO {

    public ArrayList<TrekkingLink> getTrekkingLink() throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<TrekkingLink> listTrekking = new ArrayList<>();
        try {
            String query = "SELECT [ID]\n"
                    + "      ,[Title]\n"
                    + "      ,[Content]\n"
                    + "      ,[Link_Url]\n"
                    + "  FROM [Trekking_Links]";
            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                TrekkingLink link = new TrekkingLink();
                link.setId(rs.getInt("ID"));
                link.setTitle(rs.getString("Title"));
                link.setContent(rs.getString("Content"));
                link.setUrl(rs.getString("Link_Url"));
                listTrekking.add(link);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return listTrekking;
    }

    public ArrayList<TrekkingLink> getLinkWithPaging(int index) throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<TrekkingLink> listTrekking = new ArrayList<>();
        int linkTo = index * db.getdiaryPagingSize();
        int linkFrom = linkTo - db.getdiaryPagingSize() + 1;
        try {
            String sql = "SELECT * FROM\n"
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY [ID] ASC) as rn,* from Trekking_Links) AS rnNumber\n"
                    + "WHERE rn between ? and ?";
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, linkFrom);
            ps.setInt(2, linkTo);
            rs = ps.executeQuery();
            while (rs.next()) {
                TrekkingLink link = new TrekkingLink();
                link.setId(rs.getInt("ID"));
                link.setTitle(rs.getString("Title"));
                link.setContent(rs.getString("Content"));
                link.setUrl(rs.getString("Link_Url"));
                listTrekking.add(link);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return listTrekking;
    }

    public int countLink() throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) as numberLinks FROM Trekking_Links";
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("numberLinks");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return count;
    }
}
