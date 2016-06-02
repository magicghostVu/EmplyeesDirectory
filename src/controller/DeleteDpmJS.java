package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Departments;
import models.DepartmentModel;
import ultil.SessionUlti;

public class DeleteDpmJS extends ActionSupport{
	int id;
	boolean result;
	public String execute(){
		if(SessionUlti.isLogedIn()==false){
			result=false;
		}else{
			Departments d=DepartmentModel.getDepartmentById(id);
			if(d==null){
				result=false;
				System.out.println("do d bi null");
			}else {
				DepartmentModel.deleteDpm(id);
				result=true;
				
			}
		}
		
		//if
		return SUCCESS;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isResult() {
		return result;
	}
	
	
}
