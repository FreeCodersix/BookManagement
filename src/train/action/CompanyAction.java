package train.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import train.entity.Company;
import train.service.CompanyService;
import train.service.impl.CompanyServiceImpl;

@WebServlet("/company")
public class CompanyAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CompanyService companyService = (CompanyService) new CompanyServiceImpl();


    public CompanyAction() {
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
            case "input":
                input(request, response);
                break;
            case "save":
                save(request, response);
                break;
            case "delete":
                try {
                    delete(request, response);
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

        String name = request.getParameter("name");
        String c_boss = request.getParameter("c_boss");
        //String start_year = request.getParameter("c_year");
        //String end_year = request.getParameter("c_year");
        String c_city = request.getParameter("c_city");

        Company company = new Company();

        company.setname(name);
        company.setC_boss(c_boss);
        company.setC_city(c_city);

        List<Company> companyList = companyService.getList(company);
        request.setAttribute("companyList", companyList);

        request.getRequestDispatcher("company/list.jsp").forward(request, response);

    }

    private void input(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && id.length() > 0) {
            try {
                Company company = companyService.getOne(Integer.valueOf(id));
                request.setAttribute("company", company);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        request.getRequestDispatcher("company/input.jsp").forward(request, response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id").toString();
        String name = request.getParameter("name");
        String c_boss = request.getParameter("c_boss");
        String c_year = request.getParameter("c_year");
        String c_city = request.getParameter("c_city");

        Company company = new Company();
//        company.setId(Integer.parseInt(id));
        company.setname(name);
        company.setC_boss(c_boss);
        company.setC_year(new Integer(c_year));//integer.parseInt()     integer.valueof()
        company.setC_city(c_city);

        try {
            if (id != null && id.length() > 0) {
                company.setId(Integer.valueOf(id));
                companyService.update(company);
            }
            companyService.insert(company);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("company?method=list");

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            if (id != null && id.length() > 0) {
                companyService.delete(Integer.valueOf(id));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("company?method=list");
    }

}
