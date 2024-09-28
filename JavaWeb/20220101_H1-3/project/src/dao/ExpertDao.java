package dao;

import model.Expert;
import model.Project;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ExpertDao {
    public static List<Expert> getExperts(String project_id) throws Exception{

        String sql;
        sql="SELECT *  " +
                "FROM t_expert  " +
                "WHERE Expert_id in(  " +
                "SELECT  Expert_id  " +
                "FROM t_project_expert  " +
                "WHERE Project_id=?  " +
                ")";

        QueryRunner runner=new QueryRunner(DataSourceUtils.getDataSource());
        List<Expert> experts=null;
        experts = runner.query(sql, new BeanListHandler<>(Expert.class),project_id);   
        return experts;
    }
}
