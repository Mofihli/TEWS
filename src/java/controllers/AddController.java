package controllers;

import classes.AddBean;
import classes.AddDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Katleho Motloung
 */

public class AddController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("btn_add")!=null) //check button click event not null from add.jsp page after continue
        {
            String name=request.getParameter("txt_name"); //get textbox name "txt_name"
            String surname=request.getParameter("txt_surname"); //get textbox name "txt_owner"
            String email=request.getParameter("txt_email"); //get textbox name "txt_owner"
            String password=request.getParameter("txt_password"); //get textbox name "txt_owner"
            String location=request.getParameter("txt_location"); //get textbox name "txt_owner"
            String role=request.getParameter("txt_role"); //get textbox name "txt_owner"
            
            AddBean addBean=new AddBean(); //this class contain setting up all receive values from add.jsp page to seeter and getter method for application require effectively
            
            addBean.setName(name); //set name through addBean object
            addBean.setSurname(surname); //set owner through addBean object
            addBean.setEmail(email); //set owner through addBean object
            addBean.setPassword(password);
            addBean.setLocation(location);
            addBean.setRole(role);
            
            AddDao addDao=new AddDao(); //this class contain main logic to perform function calling and database operation
            
            String insertValidate=addDao.checkInsert(addBean); //send addBean object values into checkInsert() function in AddDao class
            
            if(insertValidate.equals("INSERT SUCCESS")) //check calling checkInsert() function receive string "INSERT SUCCESS" after redirect to index.jsp page and display record
            {
                request.setAttribute("InsertSuccessMsg",insertValidate); //setAttribute value is "InsertSuccessMsg" for insert successfully message
                RequestDispatcher rd=request.getRequestDispatcher("adminPage.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("InsertErrorMsg",insertValidate); //setAttribute value is "InsertErrorMsg" for insert fail message
                RequestDispatcher rd=request.getRequestDispatcher("add.jsp");
                rd.include(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
