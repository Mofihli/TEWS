
package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Katleho Motloung
 */
public class EditDao {
    public String checkUpdate(EditBean editBean)
    {
        String name_up=editBean.getName_UP();
        String surname_up=editBean.getSurname_UP(); //get all value through editBean object and store in temporary variable
        String email_up=editBean.getEmail_UP(); //get all value through editBean object and store in temporary variable
        String password_up=editBean.getPassword_UP();
        String location_up=editBean.getLocation_UP();
        String role_up=editBean.getRole_UP();
        int hidden_id=editBean.getHidden_ID();
        
        String url="jdbc:mysql://localhost:3306/tews"; //database connection url string
        String username="root"; //database connection username
        String password=""; //database password
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con =DriverManager.getConnection(url,username,password); //create connection
            
            PreparedStatement pstmt=null; //create statement
            
            pstmt=con.prepareStatement("update tewslogin set name=?,surname=?,email=?,password=?,location=?,role=? where id=? "); //sql update query
            pstmt.setString(1,name_up);
            pstmt.setString(2,surname_up);
            pstmt.setString(3,email_up);
            pstmt.setString(4,password_up);
            pstmt.setString(5,location_up);
            pstmt.setString(6,role_up);
            pstmt.setInt(7,hidden_id);
            pstmt.executeUpdate(); //execute query
            
            pstmt.close(); //close statement
            
            con.close(); //close connection
            
            return "UPDATE SUCCESS"; //if valid return "UPDATE SUCCESS" string
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return "FAIL UPDATE"; //if invalid return "FAIL UPDATE" string
    }
}
