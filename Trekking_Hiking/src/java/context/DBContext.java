package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;

public class DBContext {

    private InitialContext initial;
    private Context context;
    private String dbname, serverName, portNumber, image, username, password,
            diaryPagingSize, albumPagingSize;

    public DBContext() throws Exception {
        try {
            initial = new InitialContext();
            Object obj = initial.lookup("java:comp/env");
            context = (Context) obj;
            serverName = context.lookup("serverName").toString();
            dbname = context.lookup("dbName").toString();
            portNumber = context.lookup("portNumber").toString();
            image = context.lookup("image").toString();
            username = context.lookup("username").toString();
            password = context.lookup("password").toString();
            diaryPagingSize = context.lookup("homePagingSize").toString();
            albumPagingSize = context.lookup("galleryPagingSize").toString();
        } catch (Exception e) {
            throw e;
        }

    }

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbname;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, username, password);
    }
    //    public Connection getConnection() throws ClassNotFoundException, SQLException {
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbname +";integratedSecurity=true";
//        Connection conn = DriverManager.getConnection(url);
//        
//        return conn;
//    }

    public void closeConnection(ResultSet rs, PreparedStatement ps, Connection con) throws SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }
        if (ps != null && !ps.isClosed()) {
            ps.close();
        }
        if (con != null && !con.isClosed()) {
            con.close();
        }
    }

    public String getImagePath() throws Exception {
        return image;
    }

    public int getdiaryPagingSize() throws Exception{
        int diarySize = 0;
        try {
            diarySize = Integer.parseInt(diaryPagingSize);
        } catch (NumberFormatException e) {
            throw e;
        }
        return diarySize;
    }

    public int getImagePagingSize() throws Exception{
        int albumSize = 0;
        try {
            albumSize = Integer.parseInt(albumPagingSize);
        } catch (NumberFormatException e) {
            throw e;
        }
        return albumSize;
    }

}
