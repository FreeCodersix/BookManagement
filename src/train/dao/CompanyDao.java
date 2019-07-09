package train.dao;

import train.entity.Company;

import java.util.List;

public interface CompanyDao {
    public int insert(Company company)throws Exception;

    public int update(Company company)throws Exception;

    public int delete(int id)throws Exception;

    public Company getOne(int id)throws Exception;

    public List<Company> getList(Company company)throws Exception;
}
