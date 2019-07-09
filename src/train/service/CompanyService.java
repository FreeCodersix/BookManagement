package train.service;
import java.util.*;

import train.entity.Company;

public interface CompanyService {
	public int insert(Company company)throws Exception;

    public int update(Company company)throws Exception;

    public int delete(int id)throws Exception;

    public Company getOne(int id)throws Exception;

    public List<Company> getList(Company company)throws Exception;
}
