package servlet;

import entity.Step;
import service.StepService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class StepServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        String action=req.getParameter("action");
        if (action.equals("list")){
            List<Step> steps=null;
            try {
              steps= StepService.getAllStep();
              req.setAttribute("list",steps);
              req.getRequestDispatcher("flow_def.jsp").forward(req,resp);
            } catch (Exception e) {
              // TODO: handle exception
              req.getRequestDispatcher("error.html").forward(req,resp);
            }
            
        }else if (action.equals("add")){
            String textfield2=req.getParameter("textfield2");
            String textfield3=req.getParameter("textfield3");
            Integer url= Integer.valueOf(textfield3);
            String textfield4=req.getParameter("textfield4");
            String textfield5=req.getParameter("textfield5");
            Step step=new Step();
            step.setStep_name(textfield2);
            step.setLimit_time(url);
            step.setStep_des(textfield4);
            step.setUrl(textfield5);
            try {
              StepService.add(step);
              List<Step> steps=StepService.getAllStep();
              req.setAttribute("list",steps);
              req.getRequestDispatcher("flow_def.jsp").forward(req,resp);
            } catch (Exception e) {
              // TODO: handle exception
              req.getRequestDispatcher("error.html").forward(req,resp);
            }  
        }else if (action.equals("del")){

        }
    }
}
