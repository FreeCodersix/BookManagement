package util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

@WebServlet("/util.user_pwd")
public class user_pwd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_pwd() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        ResultSet rs = null;
        try {
            if (checkUser.check(request.getParameter("username"),request.getParameter("password"))) {
                //客户端是getJSON，则要以json格式返回数据
                out.write("{\"msg\":\"true\"}");
            } else {
                out.write("{\"msg\":\"false\"}");
            }
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
