package servlet;

import model.Message;
import model.User;
import model.UserAndMessagePO;
import service.MessageService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class MessageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action=req.getParameter("action");
        if (action.equals("list")){
            showAllMessages(req,resp);
        }else if (action.equals("answer")){
            String id=req.getParameter("id");
            try {
              Message message=MessageService.getMessageById(Integer.valueOf(id));
              req.setAttribute("message",message);
              req.getRequestDispatcher("editLeaveword.jsp").forward(req,resp);
            } catch (Exception e) {
              // TODO: handle exception
              req.getRequestDispatcher("error.html").forward(req,resp);
            }
            
        }else if (action.equals("del")){
            String[] ids=req.getParameterValues("ids");
            for (String id:ids){
                Integer mid=Integer.valueOf(id);
                //调用service该留言
                try {
                  MessageService.del(mid);
                  showAllMessages(req,resp);
                } catch (Exception e) {
                  // TODO: handle exception
                  req.getRequestDispatcher("error.html").forward(req,resp);
                }
                
            }
            
        }
    }

    private void showAllMessages(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UserAndMessagePO> poList=new ArrayList<>();
        List<Message> messageList=MessageService.getAllMessage();
        for (Message message:messageList){
            UserAndMessagePO po=new UserAndMessagePO();
            po.setMessage(message);
            User user=UserService.getUserById(message.getUserId());
            po.setUser(user);
            poList.add(po);
        }
        req.setAttribute("poList",poList);
        req.getRequestDispatcher("manageLeaveword.jsp").forward(req,resp);
    }
}
