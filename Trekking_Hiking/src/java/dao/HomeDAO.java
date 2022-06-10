/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Page;
import entity.Share;
import entity.Welcome;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Hiệu Bùi
 */
public class HomeDAO {

    public ArrayList<Page> getPages() throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Page> pageList = new ArrayList<>();
        try {
            String query = "SELECT * FROM [Pages]";
            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Page page = new Page();
                page.setPageName(rs.getString("Page_Name"));
                page.setPageDes(rs.getString("Page_Des"));
                page.setPageImage(rs.getString("Page_Image"));
                page.setPageUrl(rs.getString("Page_Link"));
                pageList.add(page);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return pageList;
    }
    public Welcome getWelcome() throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Welcome wel = new Welcome();
        try {
            String query = "SELECT * FROM [Welcome]";
            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                wel.setDes(rs.getString("Description"));
                wel.setImage(rs.getString("Image"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return wel;
    }
    public ArrayList<Share> getSharePanel() throws Exception {
        DBContext db = new DBContext();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Share> shareList = new ArrayList<>();
        try {
            String query = "SELECT * FROM [Shares]";
             connection = db.getConnection();
            ps = connection.prepareStatement(query);

            rs = ps.executeQuery();
            
            while (rs.next()) {
            Share share = new Share();
                share.setTitle(rs.getString("title"));
                share.setIcon_source(rs.getString("icon"));
                share.setLink(rs.getString("link"));
                shareList.add(share);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        } finally {
            db.closeConnection(rs, ps, connection);
        }
        return shareList;
    }
}
