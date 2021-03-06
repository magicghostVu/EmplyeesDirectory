package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Departments;
import entities.Employees;
import models.DepartmentModel;
import models.EmployeesModel;
import ultil.SessionUlti;

public class UpdateEmp extends ActionSupport{
	int id;
	String name;
	String jobTitle;
	int idDepartment;
	String phone;
	String email;
	
	boolean result;
	
	
	public String execute(){
		boolean isLogin=SessionUlti.isLogedIn();
		if(isLogin==false){
			result=false;
			return SUCCESS;
		}else {
			Employees e=EmployeesModel.getEmployeeById(id);
			if(e==null){
				result=false;
				return SUCCESS;
			}
			e.setEmail(email);
			e.setJobTitle(jobTitle);
			e.setName(name);
			e.setPhone(phone);
			
			
			int dmpId=EmployeesModel.isMan(e);
			//System.out.println(dmpId);
			if(dmpId!=-1){// nếu nó là trưởng phòng nào đấy
				if(dmpId!=idDepartment){// nếu cái phòng đang định cập nhật không phải phòng nó ở hiện tại
					Departments d=DepartmentModel.getDepartmentById(dmpId);
					System.out.println(d.getName());
					d.setEmployees(null);
					DepartmentModel.saveOrUpdateDepartment(d);
					e.setDepartments(DepartmentModel.getDepartmentById(idDepartment));
				}else{
					e.setDepartments(DepartmentModel.getDepartmentById(idDepartment));
					//System.out.println();
				}
				
			}else{
				e.setDepartments(DepartmentModel.getDepartmentById(idDepartment));
			}
			EmployeesModel.saveOrUpdateEmployees(e);
			result=true;
			return SUCCESS;
		}
		
		
	}


	public boolean isResult() {
		return result;
	}


	public void setId(int id) {
		this.id = id;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}


	public void setIdDepartment(int idDepartment) {
		this.idDepartment = idDepartment;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setEmail(String email) {
		this.email = email;
	}
}
