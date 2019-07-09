package train.dao.impl;

import train.DbUtil;
import train.dao.BookDao;
import train.entity.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class BookDaoImpl implements BookDao{
    private Connection con = null;
    private Statement st = null;


    @Override
    public int insert(Book book) throws Exception {
        con = DbUtil.getConnection();
        st = con.createStatement();
        String sql = "INSERT  INTO 图书表(b_id,b_name,b_class,b_no,b_author,b_publisher,b_pubDate,b_comment) VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, book.getB_id());
        ps.setString(2, book.getB_name());
        ps.setString(3, book.getB_class());
        ps.setInt(4, book.getB_no());
        ps.setString(5, book.getB_author());
        ps.setString(6,book.getB_publisher());
        ps.setDate(7,(java.sql.Date) book.getB_pubDate());
        ps.setString(8,book.getB_comment());

//        ps.executeUpdate();

        int result = ps.executeUpdate();
        DbUtil.close(null,st,ps,con);
        return result;
    }

    @Override
    public int update(Book book) throws Exception {
        con = DbUtil.getConnection();
        st = con.createStatement();
        String sql = "UPDATE 图书表 SET b_name='"+book.getB_name()
                +"',b_class='"+book.getB_class()
                +"',b_no="+book.getB_no()+",b_author='"+book.getB_author()+"',b_publisher='"+book.getB_publisher()+"',b_pubDate='"+book.getB_pubDate()+"',b_comment='"+book.getB_comment()+"' WHERE b_id ='"+book.getB_id()+"'";
        PreparedStatement ps = con.prepareStatement(sql);

//        ps.executeUpdate();

        int result = ps.executeUpdate();
        DbUtil.close(null,st,ps,con);
        return result;
    }

    @Override
    public int delete(String b_id) throws Exception {
        con = DbUtil.getConnection();
        st = con.createStatement();
        String sql = "delete from 图书表 where b_id=" + b_id;
        int result = st.executeUpdate(sql);
        DbUtil.close(null,st,null,con);
        return result;
    }

    @Override
    public Book getOne(String b_id) throws Exception {
        con = DbUtil.getConnection();
        st = con.createStatement();
        String sql = "select * from 图书表 where b_id ="+b_id;
        ResultSet rs = st.executeQuery(sql);
        Book book = new Book();
        if(rs!=null) {
            while(rs.next()) {
                book.setB_id(rs.getString("b_id"));
                book.setB_name(rs.getString("b_name"));
                book.setB_class(rs.getString("b_class"));
                book.setB_no(rs.getInt("b_no"));
                book.setB_author(rs.getString("b_author"));
                book.setB_publisher(rs.getString("b_publisher"));
                book.setB_pubDate(rs.getDate("b_pubDate"));
                book.setB_comment(rs.getString("b_comment"));
            }
        }
        DbUtil.close(null,st,null,con);
        return book;
    }

    @Override
    public List<Book> getList(Book book) throws Exception {
        con = DbUtil.getConnection();
        st = con.createStatement();
        String sql = "select * from 图书表";
        ResultSet rs = st.executeQuery(sql);
        List<Book> list= new LinkedList<Book>();
        if(rs!=null) {
            while(rs.next()) {
//				Company cp = new Company();
                list.add(getBookByResultSet(rs));
            }
        }
        DbUtil.close(null,st,null,con);
        return list;
    }

    private Book getBookByResultSet(ResultSet rs) throws Exception {
        Book book = new Book();
        book.setB_id(rs.getString("b_id"));
        book.setB_name(rs.getString("b_name"));
        book.setB_class(rs.getString("b_class"));
        book.setB_no(rs.getInt("b_no"));
        book.setB_author(rs.getString("b_author"));
        book.setB_publisher(rs.getString("b_publisher"));
        book.setB_pubDate(rs.getDate("b_pubDate"));
        book.setB_comment(rs.getString("b_comment"));
        return book;

    }
}
