package dao;

import entity.Step;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class StepDao {
    public static List<Step> getAllStep() throws Exception{
        List<Step> steps=null;
        QueryRunner queryRunner=new QueryRunner(DataSourceUtils.getDataSource());
        steps=queryRunner.query("select * from t_flow_step_def",new BeanListHandler<>(Step.class));        
        return steps;
    }

    public static void add(Step step) throws Exception{
        QueryRunner queryRunner=new QueryRunner(DataSourceUtils.getDataSource());
        queryRunner.update("insert into t_flow_step_def(Step_name,Limit_time,Step_des ,URL)values (?,?,?,?)",
                                    step.getStep_name(), step.getLimit_time(),
                                    step.getStep_des(),step.getUrl());        
    }

    public static void del(Step step) throws Exception{
        QueryRunner queryRunner=new QueryRunner(DataSourceUtils.getDataSource());
        queryRunner.update("delete * from t_flow_step_def where Step_no=?",step.getStep_no());        
    }
}
