package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class checkUser {

    public static void update(String username, String password) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "INSERT  INTO users(username,password) VALUES (?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.executeUpdate();
        JDBC_Util.close(null, null, ps, conn);
    }

//    public static boolean check(String username) throws Exception{
//
//        //获取连接
//        Connection conn = JDBC_Util.getConnection();
//
//        String sql = "select name from company where name = '"+username+"'";
//
//        PreparedStatement ps = conn.prepareStatement(sql);
//
//        ResultSet rs = ps.executeQuery();
//        if(rs.next())return false;
//        else return true;
//    }


    public static boolean check(String username, String password) throws Exception {
        boolean flag = false;

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "select username,password from 用户表 where username = '" + username + "'";

        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String name = rs.getString("username");
            String pawd = rs.getString("password");
            if (name.equals(username) && pawd.equals(password)) flag = true;
        }

        JDBC_Util.close(rs, null, ps, conn);
        return flag;
    }

    public static boolean checkpwd(String username, String password, String repwd) throws Exception {
        boolean flag = true;

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "select username from 用户表 where username = '" + username + "'";

        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        boolean bool = false;
        bool = password.equals(repwd);
        if (rs.next() || bool == false) {
            flag = false;
        }

        JDBC_Util.close(rs, null, ps, conn);
        return flag;
    }

    public static void stateSave(String username, String li_id, int st) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "update " + username + " set state = " + st + " where li_id ='" + li_id + "'";
        PreparedStatement ps = conn.prepareStatement(sql);
//        ps.setString(1, li_id);
        ps.executeUpdate();
//        util.JDBC_Util.close(conn, ps, null);
        JDBC_Util.close(null, null, ps, conn);
    }

    public static void createSTable(String username) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "create table " + username + "(flag int(100) primary key ,li_id varchar(255),state int(20))";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.executeUpdate();
//        util.JDBC_Util.close(conn, ps, null);
        JDBC_Util.close(null, null, ps, conn);
    }


    public static void Insert(String username, String password, String sex, Date birthday, int age, String tel, String addr) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "insert into 用户表(username,password,sex,age,telephone,address,birthday) values (?,?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, sex);
        ps.setInt(4, age);
        ps.setString(5, tel);
        ps.setString(6, addr);
        ps.setDate(7, (java.sql.Date) birthday);
        ps.executeUpdate();
//        util.JDBC_Util.close(conn, ps, null);
        JDBC_Util.close(null, null, ps, conn);
    }

    public static List<Integer> getState(String username, List<Integer> stateList) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "select state from " + username + "";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        int state = 0;
        while (rs.next()) {
            state = rs.getInt("state");
            stateList.add(state);
        }
//        util.JDBC_Util.close(conn, ps, rs);
        JDBC_Util.close(rs, null, ps, conn);
        return stateList;
    }

    public static void SaveAll() throws SQLException {

        //获取连接
//        Connection conn = util.JDBC_Util.getConn();
//        Connection conn = util.JDBC_Util.getConn();


    }
}
