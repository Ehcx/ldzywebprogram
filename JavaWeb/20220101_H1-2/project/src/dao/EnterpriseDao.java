package dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import pojo.Enterprise;

import java.sql.SQLException;
import java.util.List;

public class EnterpriseDao {

    public static void addEnterprise(Enterprise enterprise) throws Exception{
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update("insert into t_enterprise_info values (?,?,?,?,?)",enterprise.getEnt_id(),
                    enterprise.getEnt_name(),enterprise.getBegin_date(),enterprise.getAddr(),enterprise.getReg_capital());        
    }

    public static List<Enterprise> getAllEnterprise() throws Exception{
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        List<Enterprise> enterpriseList = null;        
        enterpriseList = runner.query("select * from t_enterprise_info",new BeanListHandler<Enterprise>(Enterprise.class));       
        return enterpriseList;
    }

}
