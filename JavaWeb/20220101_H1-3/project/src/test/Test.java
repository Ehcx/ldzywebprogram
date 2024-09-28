package test;

import dao.ExpertDao;
import dao.ProjectDao;
import model.Project;

public class Test {
    public static void main(String[] args) {
        System.out.println(ExpertDao.getExperts("2003-01").get(0).getExpert_name());
    }


}
