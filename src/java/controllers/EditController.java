
package controllers;

import classes.EditBean;
import classes.EditDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Katleeho Motloung
 */
public class EditController extends HttpServlet {


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
          if(request.getParameter("btn_edit")!=null) //check button click event not null form edit.jsp page after continue
        {
            String name_up=request.getParameter("txt_name"); //get textbox name "txt_name"
            String surname_up=request.getParameter("txt_surname"); //get textbox name "txt_owner"
            String email_up=request.getParameter("txt_email"); //get textbox name "txt_owner"
            String password_up=request.getParameter("txt_password"); //get textbox name "txt_owner"
            String location_up=request.getParameter("txt_location"); //get textbox name "txt_owner"
            String role_up=request.getParameter("txt_role"); //get textbox name "txt_owner"
            int hidden_id=Integer.parseInt(request.getParameter("hidden_id")); //get hidden id name "hidden_id"
            
            EditBean editBean=new EditBean(); //this class contain setting up all receive values from edit.jsp page to seeter and getter method for application require effectively
            
            editBean.setName_UP(name_up); 
            editBean.setSurname_UP(surname_up); //set all value through editBean object
            editBean.setEmail_UP(email_up); //set all value through editBean object
            editBean.setPassword_UP(password_up); //set all value through editBean object
            editBean.setLocation_UP(location_up); //set all value through editBean object
            editBean.setRole_UP(role_up); //set all value through editBean object
            editBean.setHidden_ID(hidden_id);
            
            EditDao editDao=new EditDao(); //this class contain main logic to perform function calling and database operation
            
            String updateValidate=editDao.checkUpdate(editBean); //send editBean object values into checkUpdate() function in EditDao class
            
            if(updateValidate.equals("UPDATE SUCCESS")) //check calling checkUpdate() function receive string "UPDATE SUCCESS" after redirect to index.jsp page and display update record
            {
                request.setAttribute("UpdateSuccessMsg",updateValidate); //setAttribute value is "UpdateSuccessMsg" for update successfully message
                RequestDispatcher rd=request.getRequestDispatcher("adminPage.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("UpdateErrorMsg",updateValidate); //setAttribute value is "UpdateErrorMsg" for update fail message
                RequestDispatcher rd=request.getRequestDispatcher("edit.jsp");
                rd.include(request, response);
            }
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
