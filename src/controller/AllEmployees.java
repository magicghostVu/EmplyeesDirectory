package controller;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import entities.Departments;
import entities.Employees;
import models.AdminModel;
import models.DepartmentModel;
import models.EmployeesModel;
import ultil.SessionUlti;

public class AllEmployees  extends ActionSupport{
	Admin admin;
	boolean isLogin=false;
	private List<Employees> allEmployees;
	private List<Departments> alldpm;
	public String execute(){
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
			isLogin=true;
			admin=AdminModel.getAdminById(tmpId);
		}
		allEmployees=EmployeesModel.getAllEmployeeses();
		//System.out.println(allEmployees.get(0).getDepartments());
		
		alldpm=DepartmentModel.getAllDepartment();
		return SUCCESS;
	}
	public Admin getAdmin() {
		return admin;
	}
	
	public boolean isLogin() {
		return isLogin;
	}
	public List<Employees> getAllEmployees() {
		return allEmployees;
	}
	public List<Departments> getAlldpm() {
		return alldpm;
	}
	
	
	
}
