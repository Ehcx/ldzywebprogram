package dao;

import model.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDao {
    public static List<User> getAllUsers() throws Exception{
        List<User> users=null;
        QueryRunner queryRunner=new QueryRunner(DataSourceUtils.getDataSource());
        users = queryRunner.query("select * from t_user", new BeanListHandler<>(User.class));       
        return users;
    }
}
