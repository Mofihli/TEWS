
package controllers;

import classes.AddBean;
import classes.AddDao;
import classes.AddEventBean;
import classes.AddEventDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Katleho Motloung
 */
public class EventController extends HttpServlet {

 
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
            String type=request.getParameter("txt_type"); //get textbox name "txt_name"
            String description=request.getParameter("txt_description"); //get textbox name "txt_owner"
            String distance=request.getParameter("txt_distance"); //get textbox name "txt_owner"
            String speed=request.getParameter("txt_speed"); //get textbox name "txt_owner"
            String day=request.getParameter("txt_day"); //get textbox name "txt_owner"
            String location=request.getParameter("txt_location"); //get textbox name "txt_owner"
            
            AddEventBean addEventBean=new AddEventBean(); //this class contain setting up all receive values from add.jsp page to seeter and getter method for application require effectively
            
            addEventBean.setType(type); //set name through addBean object
            addEventBean.setDescription(description); //set owner through addBean object
            addEventBean.setDistance(distance); //set owner through addBean object
            addEventBean.setSpeed(speed);
            addEventBean.setDay(day);
            addEventBean.setLocation(location);
            
            AddEventDao addEventDao=new AddEventDao(); //this class contain main logic to perform function calling and database operation
            
            String insertValidate=addEventDao.checkInsert(addEventBean); //send addBean object values into checkInsert() function in AddDao class
            
            if(insertValidate.equals("INSERT SUCCESS")) //check calling checkInsert() function receive string "INSERT SUCCESS" after redirect to index.jsp page and display record
            {
                request.setAttribute("InsertSuccessMsg",insertValidate); //setAttribute value is "InsertSuccessMsg" for insert successfully message
                RequestDispatcher rd=request.getRequestDispatcher("adminPage.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("InsertErrorMsg",insertValidate); //setAttribute value is "InsertErrorMsg" for insert fail message
                RequestDispatcher rd=request.getRequestDispatcher("addEvents.jsp");
                rd.include(request, response);
            }
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
