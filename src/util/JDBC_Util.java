package util;

import java.sql.*;

public class JDBC_Util {
    private  static  String[] default_configs = {"com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/ahstu?useUnicode=true&&characterEncoding=utf8","root","root"};
    private JDBC_Util(){}//私有构造方法
    public static Connection getConnection() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(default_configs[1],default_configs[2],default_configs[3]);
    }

    //第三方提供配置参数
    public static Connection getConnection(String... configs)throws Exception{
        if(configs == null || configs.length != 4){
            return getConnection();
        }
        default_configs = configs;
        return getConnection();
    }

    public static void close(ResultSet rs, Statement st, PreparedStatement pst, Connection con) throws Exception {
        if(rs != null) rs.close();
        if(st != null) st.close();
        if(pst != null) pst.close();
        if(con != null) con.close();
    }
}

