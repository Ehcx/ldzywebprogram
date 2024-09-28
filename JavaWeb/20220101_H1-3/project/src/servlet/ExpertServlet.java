package servlet;

import dao.ExpertDao;
import model.Expert;
import model.Project;
import service.ExpertService;
import service.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ExpertServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String action=req.getParameter("action");
        System.out.println(action);
        if (action.equals("list")){
            String project=req.getParameter("project");

            try {
              List<Expert> experts= ExpertService.getExperts(project);
              //把projects里面的记录打入jsp页面中,再把这个页面返回浏览器
              req.setAttribute("list",experts);
              req.getRequestDispatcher("expert_select.jsp").forward(req,resp);
            } catch (Exception e) {
              // TODO: handle exception
              req.getRequestDispatcher("error.html").forward(req,resp);
            }            
        }
    }
}
