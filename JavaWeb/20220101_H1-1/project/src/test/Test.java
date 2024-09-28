package test;

import dao.ProjectDao;
import entity.Project;

public class Test {
    public static void main(String[] args) {
        Project project=new Project();
        project.setProject_id("2022-08");
        project.setProject_name("ldzy");

        ProjectDao.edit(project);
    }
}
