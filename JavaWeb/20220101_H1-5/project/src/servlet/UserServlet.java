package servlet;

import model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //增删改查是通过请求地址中的action变量的值来决定/userservlet?action=list
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        String action=req.getParameter("action");
        if (action.equals("list")){
            //查询所有的用户信息
            List<User> users=null;
            try {
              users=UserService.getAllUsers();
              req.setAttribute("list",users);
              req.getRequestDispatcher("manageUser.jsp").forward(req,resp);
            } catch (Exception e) {
              // TODO: handle exception
              req.getRequestDispatcher("error.html").forward(req,resp);
            }
        }else if (action.equals("add")){
            String nicheng=req.getParameter("nicheng");
            String truename=req.getParameter("truename");
            String cardid=req.getParameter("cardid");
            String email=req.getParameter("email");
            String telephone=req.getParameter("telephone");
            String qq=req.getParameter("qq");
            User user=new User();
            user.setEmail(email);
        }
    }
}
