package train.action;

import com.sun.org.apache.xpath.internal.operations.Bool;
import train.entity.Book;
import train.entity.FeedBack;
import train.service.BookService;
import train.service.impl.BookServiceImpl;
import util.checkUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/book")
public class BookAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookService bookService = (BookService) new BookServiceImpl();


    public BookAction() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        String method = request.getParameter("method");

        method = method != null && method.length() > 0 ? method : "list";

        switch (method) {
            case "list":
                try {
                    list(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "borrow":
                try {
                    borrow(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "returnBooks":
                try {
                    returnBooks(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "borrowInsert":
                try {
                    borrowInsert(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "input":
                input(request, response);
                break;
            case "save":
                try {
                    save(request, response);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                try {
                    delete(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "saveFeedBack":
                try {
                    saveFeedBack(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            default:
                try {
                    list(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String b_name = request.getParameter("b_name");
        String b_class = request.getParameter("b_class");
        String b_author = request.getParameter("b_author");
        String b_publisher = request.getParameter("b_publisher");
        String b_id = request.getParameter("b_id");
        String identify = request.getParameter("identify");
        String u_id = request.getParameter("u_id");
        String isReturn = request.getParameter("isReturn");
        String queryId = request.getParameter("queryId");

        String flag = request.getParameter("flag");

        Book book = new Book();
        if (b_id == null || b_id.length() == 0) {
            b_id = "189001";
            book.setB_id(b_id);
        }
        book.setB_name(b_name);
        book.setB_class(b_class);
        book.setB_author(b_author);
        book.setB_publisher(b_publisher);

        List<Book> bookList = bookService.getList(book);
        request.setAttribute("bookList", bookList);
        if (identify.equals("admin")) {
            request.getRequestDispatcher("book/list.jsp?u_id=" + u_id + "&queryId=" + queryId + "&identify=" + identify).forward(request, response);
        } else {
            if (flag != "1") {
                request.getRequestDispatcher("book/list1.jsp?u_id=" + u_id + "&queryId=" + queryId + "&isReturn=" + isReturn + "&identify=" + identify).forward(request, response);
            } else {
                request.getRequestDispatcher("book/list1.jsp?u_id=" + u_id + "&queryId=" + queryId + "&isReturn=" + isReturn + "&flag=1" + "&identify=" + identify).forward(request, response);
            }
        }
    }

    private void input(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String b_id = request.getParameter("b_id");
        if (b_id != null && b_id.length() > 0) {
            try {
                Book book = bookService.getOne(b_id);
                request.setAttribute("book", book);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        request.getRequestDispatcher("book/input.jsp").forward(request, response);
    }

    private void borrow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String b_id = request.getParameter("b_id");
        if (b_id != null && b_id.length() > 0) {
            try {
                Book book = bookService.getOne(b_id);
                request.setAttribute("book", book);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        request.getRequestDispatcher("book/borrow.jsp").forward(request, response);
    }

    private void saveFeedBack(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id = Integer.valueOf(request.getParameter("u_id"));

        String type = request.getParameter("type");
        String content = request.getParameter("content");

        FeedBack feedBack = new FeedBack();
        feedBack.setuId(id);
        feedBack.setType(type);
        feedBack.setContent(content);
        PrintWriter out = response.getWriter();
        try {
            if(bookService.insertFeed(feedBack) == 1){
                out.write("{\"msg\":\"true\"}");
            }else{
                out.write("{\"msg\":\"false\"}");
            }
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {

        String b_id = request.getParameter("b_id");
        String b_name = request.getParameter("b_name");
        String b_class = request.getParameter("b_class");
        int b_no = Integer.valueOf(request.getParameter("b_no"));
        String b_author = request.getParameter("b_author");
        String b_publisher = request.getParameter("b_publisher");
        String str = request.getParameter("b_pubDate");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
        java.sql.Date b_pubDate = new java.sql.Date(format.parse(str).getTime());
        String b_comment = request.getParameter("b_comment");

        Book book = new Book();

        book.setB_name(b_name);
        book.setB_class(b_class);
        book.setB_no(b_no);
        book.setB_author(b_author);
        book.setB_publisher(b_publisher);
        book.setB_pubDate(b_pubDate);
        book.setB_comment(b_comment);

        try {
            if (b_id != null && b_id.length() > 0) {
                book.setB_id(b_id);
                bookService.update(book);
            }
            bookService.insert(book);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("book?method=list&identify=admin");

    }

    private void borrowInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {

        String u_id = request.getParameter("u_id");
        String b_id = request.getParameter("b_id");
        String b_name = request.getParameter("b_name");
        String loanTime = request.getParameter("loanTime");
        String returnTime = request.getParameter("returnTime");

        try {
            checkUser.borrowInsert(u_id, b_id, b_name, loanTime, returnTime);
            checkUser.updateNum(b_id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("book?method=list&identify=user&flag=1");

    }

    private void returnBooks(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String r_id = request.getParameter("rbid").split(":")[1];
        String b_id = request.getParameter("rbid").split(":")[0];
        String state = request.getParameter("state").toString();
        PrintWriter out = response.getWriter();
        Boolean isReturn = true;
        if (state.equals("归还")) {
            try {
                checkUser.increaseNum(b_id);
                checkUser.updateState(r_id, state);
//                isReturn = checkUser.increaseNum(b_id)&&checkUser.updateState(r_id, state);
                    out.write("{\"msg\":\"true\"}");

                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
//            response.sendRedirect("book?method=list&identify=user&flag=1&isReturn=" + isReturn);
        }else {
            checkUser.updateState(r_id, state);
            response.sendRedirect("book?method=list&identify=user&flag=1&isReturn=" + isReturn);
        }
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String b_id = request.getParameter("b_id");
        try {
            if (b_id != null && b_id.length() > 0) {
                bookService.delete(b_id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("book?method=list&identify=admin");
    }

}
