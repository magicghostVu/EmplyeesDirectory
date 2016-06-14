package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Departments;
import entities.Employees;
import models.DepartmentModel;
import models.EmployeesModel;
import ultil.SessionUlti;

public class UpdateDepartment extends ActionSupport {
	int id;
	int idMan;
	String name;
	String officeNumber;
	
	boolean result;
	public String execute(){
		if(SessionUlti.isLogedIn()==false){
			result=false;
			return SUCCESS;
		}
		Departments d=DepartmentModel.getDepartmentById(id);
		if(d==null){
			result=false;
			return SUCCESS;
		}
		d.setName(name);
		d.setOfficeNumber(officeNumber);
		Employees e=EmployeesModel.getEmployeeById(idMan);
		
		
		
		
		int wasMan=EmployeesModel.isMan(e);
		if(wasMan!=-1&&wasMan!=id){
			Departments tmpd=DepartmentModel.getDepartmentById(wasMan);
			tmpd.setEmployees(null);
			DepartmentModel.saveOrUpdateDepartment(tmpd);
		}else{
			
		}
		e.setDepartments(d);
		EmployeesModel.saveOrUpdateEmployees(e);
		
		
		
		
		d.setEmployees(e);
		DepartmentModel.saveOrUpdateDepartment(d);
		result=true;
		return SUCCESS;
	}
	public boolean isResult() {
		return result;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setIdMan(int idMan) {
		this.idMan = idMan;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setOfficeNumber(String officeNumber) {
		this.officeNumber = officeNumber;
	}
	
	
}
