package service;

import dao.UserDao;
import model.User;

import java.util.List;

public class UserService {
    public static List<User> getAllUsers() throws Exception{
        return UserDao.getAllUsers();
    }
}
