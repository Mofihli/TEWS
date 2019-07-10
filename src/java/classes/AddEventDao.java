
package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Katleho Motloung
 */
public class AddEventDao {
    
    public String checkInsert(AddEventBean addEventBean)
    {
        String type=addEventBean.getType(); //get name through addBean object and store in temporary variable "name"
        String description=addEventBean.getDescription(); //get owner through addBean object and store in temporary variable "owner"
        String distance=addEventBean.getDistance(); //get owner through addBean object and store in temporary variable "owner"
        String speed=addEventBean.getSpeed(); //get owner through addBean object and store in temporary variable "owner"
        String day=addEventBean.getDay(); //get owner through addBean object and store in temporary variable "owner"
        String location=addEventBean.getLocation(); //get owner through addBean object and store in temporary variable "owner"
        
        String url="jdbc:mysql://localhost:3306/tews"; //database connection url string
        String username="root"; //database connection username
        String password1=""; //database password
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(url,username,password1); //create connection
            
            PreparedStatement pstmt=null; //create statement
            
            pstmt=con.prepareStatement("insert into tewsevents(type,description,distance,speed,day,location) values(?,?,?,?,?,?)"); //sql insert query
            pstmt.setString(1,type);
            pstmt.setString(2,description);
            pstmt.setString(3,distance);
            pstmt.setString(4,speed);
            pstmt.setString(5,day);
            pstmt.setString(6,location);
            pstmt.executeUpdate(); //execute query
            
            pstmt.close(); //close statement
            
            con.close(); //close connection
            
            return "INSERT SUCCESS"; //if valid return "INSERT SUCCESS" string
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return "FAIL INSERT"; //if invalid return "FAIL INSERT" string
    }
    
}
