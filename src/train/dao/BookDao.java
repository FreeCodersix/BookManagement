package train.dao;

import train.entity.Book;

import java.util.List;

public interface BookDao {
    public int insert(Book book)throws Exception;

//    int insert(train.entity.Book book) throws Exception;

    public int update(Book book)throws Exception;

    public int delete(String b_id)throws Exception;

    public Book getOne(String b_id)throws Exception;

    public List<Book> getList(Book book)throws Exception;
}
