/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Hiệu Bùi
 */
public class AlbumDAO {
    public ArrayList<Image> getPhotoWithPaging(int index) throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Image> listPhoto = new ArrayList<>();
        int linkTo = index * db.getImagePagingSize();
        int linkFrom = linkTo - db.getImagePagingSize() + 1;
        try {
            String sql = "SELECT * FROM\n"
                    + "(SELECT ROW_NUMBER() OVER (ORDER BY [id] ASC) as rn,* from Images) AS rnNumber\n"
                    + "WHERE rn between ? and ?";
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, linkFrom);
            ps.setInt(2, linkTo);
            rs = ps.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setId(rs.getInt("id"));
                image.setImage_url(rs.getString("image_url"));
                listPhoto.add(image);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return listPhoto;
    }
    public int countImage() throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) as numberDiary FROM Images";
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
