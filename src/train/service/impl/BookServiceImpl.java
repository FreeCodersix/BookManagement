package train.service.impl;

import train.dao.BookDao;
import train.dao.impl.BookDaoImpl;
import train.entity.Book;
import train.service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService{

    private  BookDao bookDao = new BookDaoImpl();

    @Override
    public int insert(Book book) throws Exception {
        return bookDao.insert(book);
    }

    @Override
    public int update(Book book) throws Exception {
        return bookDao.update(book);
    }

    @Override
    public int delete(String b_id) throws Exception {
        return bookDao.delete(b_id);
    }

    @Override
    public Book getOne(String b_id) throws Exception {
        return bookDao.getOne(b_id);
    }

    @Override
    public List<Book> getList(Book book) throws Exception {
        return bookDao.getList(book);
    }
}
