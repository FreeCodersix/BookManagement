package train.service.impl;


import train.dao.CompanyDao;
import train.dao.impl.CompanyDaoImpl;
import train.entity.Company;
import train.service.CompanyService;

import java.util.List;

public class CompanyServiceImpl implements CompanyService {

	private CompanyDao companyDao = new CompanyDaoImpl();
	
	@Override
	public int insert(Company company) throws Exception {
		return companyDao.insert(company);
	}

	@Override
	public int update(Company company) throws Exception {
		return companyDao.update(company);
	}

	@Override
	public int delete(int id) throws Exception {
		return companyDao.delete(id);
	}

	@Override
	public Company getOne(int id) throws Exception {
		return companyDao.getOne(id);
	}

	@Override
	public List<Company> getList(Company company) throws Exception {
		return companyDao.getList(company);
	}

}
