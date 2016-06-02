package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Employees;
import models.EmployeesModel;
import ultil.SessionUlti;

public class DeleteEmpJS extends ActionSupport {
	int id;
	boolean result;
	public String execute(){
		
		if(SessionUlti.isLogedIn()==false){
			result=false;
			System.out.println("do chưa đăng nhập");
		}else {
			Employees e=EmployeesModel.getEmployeeById(id);
			if(e==null){
				result=false;
				System.out.println("do e null");
			}else{
				EmployeesModel.deleteEmp(e);
				result=true;
			}
		}
		return SUCCESS;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public boolean isResult() {
		return result;
	}
	
	
}
