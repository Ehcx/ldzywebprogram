package dao;

import model.Message;
import model.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class MessageDao {

    public static Message getMessageById(Integer id) throws Exception{
        Message message=null;
        QueryRunner queryRunner=new QueryRunner(DataSourceUtils.getDataSource());
        message = queryRunner.query("select * from t_message where id=?",new BeanHandler<>(Message.class),id);        
        return message;
    }

    public static void del(Integer id) throws Exception{
        QueryRunner queryRunner=new QueryRunner(DataSourceUtils.getDataSource());
        queryRunner.update("delete from t_message where id=?", id);
    }

    public static List<Message> getAllMessage() throws Exception{
        List<Message> list=null;
        QueryRunner queryRunner=new QueryRunner(DataSourceUtils.getDataSource());
        list = queryRunner.query("select * from t_message", new BeanListHandler<>(Message.class));        
        return list;
    }
}
