
package classes;

/**
 *
 * @author Katleho Motloung
 */
public class EditBean {
    private String name_up,surname_up,email_up,password_up,location_up,role_up;
    private int hidden_id;
    
    public String getName_UP(){
        return name_up;
    }
    public void setName_UP(String name_up){
        this.name_up=name_up;
    }
    public String getSurname_UP(){
        return surname_up;
    }
    public void setSurname_UP(String surname_up){
        this.surname_up=surname_up;
    }
    public String getEmail_UP(){
        return email_up;
    }
    public void setEmail_UP(String email_up){
        this.email_up=email_up;
    }
     public String getPassword_UP(){
        return password_up;
    }
    public void setPassword_UP(String password_up){
        this.password_up=password_up;
    }
     public String getLocation_UP(){
        return location_up;
    }
    public void setLocation_UP(String location_up){
        this.location_up=location_up;
    }
     public String getRole_UP(){
        return role_up;
    }
    public void setRole_UP(String role_up){
        this.role_up=role_up;
    }
    public int getHidden_ID(){
        return hidden_id;
    }
    public void setHidden_ID(int hidden_id){
        this.hidden_id=hidden_id;
    }
}
