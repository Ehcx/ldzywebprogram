package servlet;


import model.Project;
import service.ProjectService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ProjectServlet extends HttpServlet {
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
            try {
              List<Project> projects= ProjectService.getAllProject();
              //把projects里面的记录打入jsp页面中,再把这个页面返回浏览器
              req.setAttribute("list",projects);
              req.getRequestDispatcher("project_list.jsp").forward(req,resp);
            } catch (Exception e) {
              // TODO: handle exception
              req.getRequestDispatcher("error.html").forward(req,resp);
            }            
        }else if (action.equals("add")){
            String project_id=req.getParameter("project_id");
            String project_name=req.getParameter("project_name");
            System.out.println(project_name);
            String deputy_name=req.getParameter("deputy_name");
            String telephone=req.getParameter("telephone");
            String addr=req.getParameter("addr");
            Project project=new Project();
            project.setProject_id(project_id);
            project.setProject_name(project_name);
            project.setDeputy_name(deputy_name);
            project.setAddr(addr);
            project.setTelephone(telephone);
            try {
              ProjectService.add(project);
              List<Project> projects= ProjectService.getAllProject();
              //把projects里面的记录打入jsp页面中,再把这个页面返回浏览器
              req.setAttribute("list",projects);
              req.getRequestDispatcher("project_list.jsp").forward(req,resp);
            } catch (Exception e) {
              // TODO: handle exception
              req.getRequestDispatcher("error.html").forward(req,resp);
            }  
        }else if (action.equals("edit")){
            System.out.println(req.getParameter("project_id"));
        }
    }
}
