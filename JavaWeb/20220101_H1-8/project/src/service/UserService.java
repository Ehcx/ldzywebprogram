package service;

import dao.UserDao;
import model.User;

public class UserService {
    public static User getUserById(Integer id) throws Exception{
        return UserDao.getUserById(id);
    }
}
