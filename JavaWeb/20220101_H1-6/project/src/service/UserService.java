package service;

import dao.UserDao;
import model.User;

import java.util.List;

public class UserService {
    public static List<User> getAllUser() throws Exception{
        return UserDao.getAllUser();
    }
    public static User getAllUserByname(String name) throws Exception{
        return UserDao.getAllUserByname(name);
    }
}
