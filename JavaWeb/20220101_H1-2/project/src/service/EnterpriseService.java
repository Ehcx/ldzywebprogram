package service;

import dao.EnterpriseDao;
import pojo.Enterprise;

import java.util.List;

public class EnterpriseService {

    public static void addEnterprise(Enterprise enterprise) throws Exception{
        EnterpriseDao.addEnterprise(enterprise);
    }

    public static List<Enterprise> getAllEnterprise() throws Exception{
       return EnterpriseDao.getAllEnterprise();
    }
}
