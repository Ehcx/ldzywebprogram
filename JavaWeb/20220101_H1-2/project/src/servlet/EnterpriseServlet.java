package servlet;

import pojo.Enterprise;
import service.EnterpriseService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class EnterpriseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset = utf-8");
        String action = req.getParameter("action");
        if (action.equals("list")){
          try {
            List<Enterprise> allEnterprise = EnterpriseService.getAllEnterprise();
            req.setAttribute("Enterprise",allEnterprise);
            req.getRequestDispatcher("enterrpriseList.jsp").forward(req,resp);
          } catch (Exception e) {
            // TODO: handle exception
            req.getRequestDispatcher("error.html").forward(req,resp);
          }            
        }
        if (action.equals("add")){
            Enterprise enterprise = new Enterprise();
            String ent_id = req.getParameter("Ent_id");
            String ent_name = req.getParameter("Ent_name");

            // string 转 Timestamp
            String begin_date = req.getParameter("Begin_date");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = sdf.parse(begin_date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Timestamp ctime = new Timestamp(date.getTime());

            String addr = req.getParameter("Addr");
            // string 转 double
            String num = req.getParameter("Reg_capital");
            double reg_capital = Double.parseDouble(num);

            enterprise.setEnt_id(ent_id);
            enterprise.setEnt_name(ent_name);
            enterprise.setBegin_date(ctime);
            enterprise.setAddr(addr);
            enterprise.setReg_capital(reg_capital);

            try {
              EnterpriseService.addEnterprise(enterprise);
              List<Enterprise> allEnterprise = EnterpriseService.getAllEnterprise();
              req.setAttribute("Enterprise",allEnterprise);
              req.getRequestDispatcher("enterrpriseList.jsp").forward(req,resp);
            } catch (Exception e) {
              // TODO: handle exception
              req.getRequestDispatcher("error.html").forward(req,resp);
            }

            
        }

    }
}
