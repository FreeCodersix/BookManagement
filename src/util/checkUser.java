package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public static void updateNum(String b_id) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "UPDATE 图书表 SET b_no = b_no - 1 WHERE b_id=" + b_id;
        PreparedStatement ps = conn.prepareStatement(sql);
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

    public static String QueryFlag(String username) throws Exception {

        String flag = "2";
        String u_id = "";
        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "select username,flag,u_id from 用户表 where username = '" + username + "'";

        PreparedStatement ps = conn.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String name = rs.getString("username");
            if (name.equals(username)) {
                flag = rs.getString("flag");
                u_id = rs.getString("u_id");
            }
        }
        String flag_id = flag + "+" + u_id;
        JDBC_Util.close(rs, null, ps, conn);
        return flag_id;
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

    public static ResultSet query(String b_name) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "SELECT  * FROM 图书表 where b_name ='" + b_name + "'";
        PreparedStatement ps = conn.prepareStatement(sql);
//        ps.setString(1, li_id);

//        util.JDBC_Util.close(conn, ps, null);
        ResultSet rs = ps.executeQuery();
        JDBC_Util.close(null, null, ps, conn);
        return rs;
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

    public static List<String> queryBcomment(List<String> list) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "SELECT  b_id,b_comment FROM 图书表";
        PreparedStatement ps = conn.prepareStatement(sql);
//        ps.setString(1, li_id);

//        util.JDBC_Util.close(conn, ps, null);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String b_id = rs.getString("b_id");
            String b_comment = rs.getString("b_comment");
            list.add(b_id + ":" + b_comment);
        }
        JDBC_Util.close(null, null, ps, conn);
        return list;
    }

    public static void borrowInsert(String u_id, String b_id, String b_name, String loanTime, String returnTime) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "insert into 借书表(u_id,b_id,b_name,state,loanTime,returnTime) values (?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);

        /*if(u_id == null||u_id.length()==0){
            u_id="233000";
        }*/
        ps.setString(1, u_id);
        ps.setString(2, b_id);
        ps.setString(3, b_name);
        ps.setString(4, "借阅");
        ps.setString(5, loanTime);
        ps.setString(6, returnTime);
        ps.executeUpdate();
//        util.JDBC_Util.close(conn, ps, null);
        JDBC_Util.close(null, null, ps, conn);
    }

    public static List<String> queryBorrow(List<String> list, String u_id) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "SELECT  * FROM 借书表 WHERE u_id =" + u_id;
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String b_id = rs.getString("b_id");
            String b_name = rs.getString("b_name");
            String loanTime = rs.getString("loanTime");
            String returnTime = rs.getString("returnTime");
            String state = rs.getString("state");
            String r_id = rs.getString("r_id");
//            list.add("\"u_id\":\"" + u_id + "\"," + "\"b_id\":\"" + b_id + "\"," + "\"b_name\":\"" + b_name + "\"," + "\"loanTime\":\"" + loanTime + "\"," + "\"returnTime\":\"" + returnTime + "\"," + "\"state\":\"" + state + "\"");
            list.add(u_id + "," + b_id + "," + b_name + "," + loanTime + "," + returnTime + "," + state + "," + r_id);
        }
        JDBC_Util.close(null, null, ps, conn);
        return list;
    }

    public static List<String> queryBorrow_admin(List<String> list, String status) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "SELECT  * FROM 借书表 WHERE state ='" + status + "'";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String b_id = rs.getString("b_id");
            String b_name = rs.getString("b_name");
            String loanTime = rs.getString("loanTime");
            String returnTime = rs.getString("returnTime");
            String u_id = rs.getString("u_id");
            String r_id = rs.getString("r_id");

            list.add(u_id + "," + b_id + "," + b_name + "," + loanTime + "," + returnTime + "," + status + "," + r_id);
        }
        JDBC_Util.close(null, null, ps, conn);
        return list;
    }

    public static List<String> queryFeedBack(List<String> list, String u_id) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "SELECT  * FROM 用户反馈表 WHERE u_id =" + u_id;
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String type = rs.getString("type");
            String content = rs.getString("content");

            list.add(u_id + "," + type + "," + content);
        }
        JDBC_Util.close(null, null, ps, conn);
        return list;
    }

    public static List<String> queryFeedBack_admin(List<String> list, String type) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "SELECT  * FROM 用户反馈表 WHERE type ='" + type +"'";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String u_id = rs.getString("u_id");
            String content = rs.getString("content");

            list.add(u_id + "," + type + "," + content);
        }
        JDBC_Util.close(null, null, ps, conn);
        return list;
    }

    public static void increaseNum(String b_id) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "UPDATE 图书表 SET b_no = b_no + 1 WHERE b_id=" + b_id;
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.executeUpdate();
        JDBC_Util.close(null, null, ps, conn);
//        return true;
    }

    public static Boolean updateState(String r_id,String state) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "UPDATE 借书表 SET state = '"+state+"' WHERE r_id=" + r_id;
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.executeUpdate();

        JDBC_Util.close(null, null, ps, conn);
        return true;
    }

    public static String queryUser(String msg, String u_id) throws Exception {

        //获取连接
        Connection conn = JDBC_Util.getConnection();

        String sql = "SELECT  * FROM 用户表 WHERE u_id =" + u_id;
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String sex = rs.getString("sex");
            int age = rs.getInt("age");
            String telephone = rs.getString("telephone");
            String address = rs.getString("address");
            Date birthday = rs.getDate("birthday");

            msg = sex + ":" + birthday + ":" + age + ":" + telephone + ":" + address;

            JDBC_Util.close(null, null, ps, conn);
        }
        return msg;
    }
}