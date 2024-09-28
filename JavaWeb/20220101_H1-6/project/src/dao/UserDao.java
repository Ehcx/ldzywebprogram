package dao;

import model.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDao {
    public static List<User> getAllUser() throws Exception {
        List<User> users = null;
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        users = queryRunner.query("select * from t_user", new BeanListHandler<>(User.class));
        return users;
    }

    public static User getAllUserByname(String name)  throws Exception{
        User usersname = null;
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        usersname = queryRunner.query("select * from t_user where name=?",new BeanHandler<>(User.class),name);
        return usersname;
    }
}
