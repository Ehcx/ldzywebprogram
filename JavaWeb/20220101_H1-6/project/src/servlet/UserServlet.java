package servlet;

import model.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          request.setCharacterEncoding("utf-8");
          response.setContentType("text/html;charset=utf-8");
          String action=request.getParameter("action");
          if (action.equals("list")){
            try {
              List<User> Users= UserService.getAllUser();
              request.setAttribute("list",Users);
              request.getRequestDispatcher("manageUser.jsp").forward(request,response);
            } catch (Exception e) {
              // TODO: handle exception
              request.getRequestDispatcher("error.html").forward(request,response);
            }
              
          }else if (action.equals("name")){
            try {
              User user=UserService.getAllUserByname(request.getParameter("name"));
              request.setAttribute("user",user);
              
            } catch (Exception e) {
              // TODO: handle exception
              request.getRequestDispatcher("error.html").forward(request,response);
            }
              
          }
    }
}
