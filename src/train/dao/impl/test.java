package train.dao.impl;


import train.dao.CompanyDao;
import train.entity.Company;

import java.util.LinkedList;
import java.util.List;

public class test {
public static void main(String[] args) throws Exception {
	CompanyDao companyDao = new CompanyDaoImpl();
	Company company = new Company();
	//company.setId(3);
	company.setC_city("����");
	company.setC_boss("С��");
	company.setname("��Ϊ�Ƽ�");
	company.setC_year(10);
	
	//���Ը���
	//int rs = companyDao.update(company);
	
	//���Բ�ѯȫ��
	List<Company> list= new LinkedList<Company>();
	list = (LinkedList<Company>) companyDao.getList(company);
	//companyDao.getList(new Company()).forEach(x -> System.out.println(x));
	companyDao.getList(new Company()).forEach(System.out::println);

}
}
