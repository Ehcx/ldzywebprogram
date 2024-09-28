package service;

import dao.ProjectDao;
import entity.Project;

import java.util.List;

public class ProjectService {
    public static void add(Project project) throws Exception{
        ProjectDao.add(project);
    }
    public static List<Project> getAllProject() throws Exception{
        return ProjectDao.getAllProject();
    }
}
