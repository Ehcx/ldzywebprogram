package service;

import dao.MessageDao;
import model.Message;

import java.util.List;

public class MessageService {
    public static List<Message> getAllMessage() throws Exception{
        return MessageDao.getAllMessage();
    }

    public static Message getMessageById(Integer id) throws Exception{
        return MessageDao.getMessageById(id);
    }

    public static void del(Integer id) throws Exception{
        MessageDao.del(id);
    }
}
