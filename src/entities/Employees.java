package entities;
// Generated Jun 14, 2016 1:07:24 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Employees generated by hbm2java
 */
public class Employees  implements java.io.Serializable {


     private Integer id;
     private Departments departments;
     private String name;
     private String jobTitle;
     private String email;
     private String phone;
     private Boolean cusAva;
     private Set departmentses = new HashSet(0);

    public Employees() {
    }

	
    public Employees(Departments departments, String name, String jobTitle) {
        this.departments = departments;
        this.name = name;
        this.jobTitle = jobTitle;
    }
    public Employees(Departments departments, String name, String jobTitle, String email, String phone, Boolean cusAva, Set departmentses) {
       this.departments = departments;
       this.name = name;
       this.jobTitle = jobTitle;
       this.email = email;
       this.phone = phone;
       this.cusAva = cusAva;
       this.departmentses = departmentses;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Departments getDepartments() {
        return this.departments;
    }
    
    public void setDepartments(Departments departments) {
        this.departments = departments;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getJobTitle() {
        return this.jobTitle;
    }
    
    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public Boolean getCusAva() {
        return this.cusAva;
    }
    
    public void setCusAva(Boolean cusAva) {
        this.cusAva = cusAva;
    }
    public Set getDepartmentses() {
        return this.departmentses;
    }
    
    public void setDepartmentses(Set departmentses) {
        this.departmentses = departmentses;
    }




}


