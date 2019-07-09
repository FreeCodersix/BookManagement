package train.dao.impl;

import train.DbUtil;
import train.dao.CompanyDao;
import train.entity.Company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class CompanyDaoImpl implements CompanyDao {

    private Connection con = null;
    private Statement st = null;
    
    @Override
    public int insert(Company company) throws Exception {
    	
		con = DbUtil.getConnection();
        st = con.createStatement();
        String sql = "INSERT  INTO company(id,name,c_boss,c_city,c_year) VALUES (?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, company.getId());
        ps.setString(2, company.getname());
        ps.setString(3, company.getC_boss());
        ps.setString(4, company.getC_city());
        ps.setInt(5, company.getC_year());
//        ps.executeUpdate();

        int result = ps.executeUpdate();
        DbUtil.close(null,st,ps,con);
        return result;


    }

    @Override
    public  int update(Company company) throws Exception {
    	con = DbUtil.getConnection();
        st = con.createStatement();
        StringBuilder sb = new StringBuilder("update company set ");
        sb.append("name = '").append(company.getname()).append("',");
        sb.append("c_boss = '").append(company.getC_boss()).append("',");
        sb.append("c_city = '").append(company.getC_city()).append("',");
        sb.append("c_year = ").append(company.getC_year()).append(" ");
        sb.append("where id = ").append(company.getId());

        int result = st.executeUpdate(sb.toString());
        DbUtil.close(null,st,null,con);
        return result;
    }

    @Override
    public int delete(int id) throws Exception {
        con = DbUtil.getConnection();
        st = con.createStatement();
        String sql = "delete from company where id=" + id;
        int result = st.executeUpdate(sql);
        DbUtil.close(null,st,null,con);
        return result;
    }

    @Override
    public Company getOne(int id) throws Exception {
    	con = DbUtil.getConnection();
		st = con.createStatement();
		String sql = "select * from company where id ="+id;
		ResultSet rs = st.executeQuery(sql);
		Company company = new Company();
		if(rs!=null) {
			while(rs.next()) {
				company.setId(rs.getInt("id"));
				company.setC_boss(rs.getString("c_boss"));
				company.setC_city(rs.getString("c_city"));
				company.setname(rs.getString("name"));
				company.setC_year(rs.getInt("c_year"));
			}
		}
		DbUtil.close(null,st,null,con);
		return company;
    }

    @Override
    public List<Company> getList(Company company) throws Exception {
    	con = DbUtil.getConnection();
		st = con.createStatement();
		String sql = "select * from company";
		ResultSet rs = st.executeQuery(sql);
		List<Company> list= new LinkedList<Company>();
		if(rs!=null) {
			while(rs.next()) {
//				Company cp = new Company();
				list.add(getCompanyByResultSet(rs));
			}
		}
		DbUtil.close(null,st,null,con);
		return list;
    }
    
    private Company getCompanyByResultSet(ResultSet rs) throws Exception {
    	Company company = new Company();
    	company.setId(rs.getInt("id"));
		company.setC_boss(rs.getString("c_boss"));
		company.setC_city(rs.getString("c_city"));
		company.setname(rs.getString("name"));
		company.setC_year(rs.getInt("c_year"));
		return company;
	}
}
