package train.service;

import train.entity.Book;
import train.entity.FeedBack;

import java.util.List;

public interface BookService {
    public int insert(Book book)throws Exception;

    public int update(Book book)throws Exception;

    public int delete(String b_id)throws Exception;

    public Book getOne(String b_id)throws Exception;

    public List<Book> getList(Book book)throws Exception;

    //新增意见反馈
    int insertFeed(FeedBack feedBack) throws Exception;
}
