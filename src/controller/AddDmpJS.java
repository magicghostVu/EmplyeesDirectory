package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Departments;
import entities.Employees;
import models.DepartmentModel;
import models.EmployeesModel;
import ultil.SessionUlti;

public class AddDmpJS extends ActionSupport{
	String name;
	String phone;
	int idMan=-1;
	
	boolean result=false;
	public String execute(){
		if(SessionUlti.isLogedIn()==false){
			return SUCCESS;
		}else {
			Departments d=new Departments();
			d.setName(name);
			d.setOfficeNumber(phone);
			Employees man=EmployeesModel.getEmployeeById(idMan);
			d.setEmployees(man);
			DepartmentModel.saveOrUpdateDepartment(d);
			result=true;
			return SUCCESS;
		}
	}
	
	public boolean isResult() {
		return result;
	}

	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setIdMan(int idMan) {
		this.idMan = idMan;
	}
	
	
}
