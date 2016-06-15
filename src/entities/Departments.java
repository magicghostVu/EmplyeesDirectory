package entities;
// Generated Jun 15, 2016 8:14:01 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Departments generated by hbm2java
 */
public class Departments  implements java.io.Serializable {


     private Integer id;
     private Employees employees;
     private String name;
     private String officeNumber;
     private Set employeeses = new HashSet(0);

    public Departments() {
    }

	
    public Departments(String name) {
        this.name = name;
    }
    public Departments(Employees employees, String name, String officeNumber, Set employeeses) {
       this.employees = employees;
       this.name = name;
       this.officeNumber = officeNumber;
       this.employeeses = employeeses;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Employees getEmployees() {
        return this.employees;
    }
    
    public void setEmployees(Employees employees) {
        this.employees = employees;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getOfficeNumber() {
        return this.officeNumber;
    }
    
    public void setOfficeNumber(String officeNumber) {
        this.officeNumber = officeNumber;
    }
    public Set getEmployeeses() {
        return this.employeeses;
    }
    
    public void setEmployeeses(Set employeeses) {
        this.employeeses = employeeses;
    }




}


