package dao;

import entity.Project;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ProjectDao {

    public static void add(Project project) throws Exception{
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());        
        runner.update("insert into t_project values (?,?,?,?,?)",
                    project.getProject_id(), project.getProject_name(),
                    project.getDeputy_name(), project.getTelephone(), project.getAddr());       
    }

    public static void del(Project project) throws Exception{
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        runner.update("delete from t_project where Project_id=? ",project.getProject_id());        
    }

    public static void edit(Project project) throws Exception{
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        runner.update("update t_project set Project_name=? where Project_id=? ",project.getProject_name(),project.getProject_id());        
    }

    public static List<Project> getAllProject() throws Exception{
        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        List<Project> projects=null;
        projects = runner.query("select * from t_project", new BeanListHandler<>(Project.class));        
        return projects;
    }
}
