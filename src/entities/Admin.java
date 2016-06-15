package entities;
// Generated Jun 15, 2016 8:14:01 PM by Hibernate Tools 4.3.1



/**
 * Admin generated by hbm2java
 */
public class Admin  implements java.io.Serializable {


     private String userName;
     private String pass;
     private String email;
     private Boolean changedPass;
     private Boolean owner;

    public Admin() {
    }

	
    public Admin(String userName, String pass, String email) {
        this.userName = userName;
        this.pass = pass;
        this.email = email;
    }
    public Admin(String userName, String pass, String email, Boolean changedPass, Boolean owner) {
       this.userName = userName;
       this.pass = pass;
       this.email = email;
       this.changedPass = changedPass;
       this.owner = owner;
    }
   
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPass() {
        return this.pass;
    }
    
    public void setPass(String pass) {
        this.pass = pass;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public Boolean getChangedPass() {
        return this.changedPass;
    }
    
    public void setChangedPass(Boolean changedPass) {
        this.changedPass = changedPass;
    }
    public Boolean getOwner() {
        return this.owner;
    }
    
    public void setOwner(Boolean owner) {
        this.owner = owner;
    }




}


