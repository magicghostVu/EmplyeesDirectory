package controller;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import entities.Departments;
import models.AdminModel;
import models.DepartmentModel;
import ultil.SessionUlti;

public class AddEmp extends ActionSupport {
	
	Admin admin;
	boolean isLogin=false;
	List<Departments> allD;
	public String execute(){
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
			isLogin=true;
			admin=AdminModel.getAdminById(tmpId);
			allD=DepartmentModel.getAllDepartment();
			return SUCCESS;
		}else{
			return ERROR;
			
		}
		
		
	}
	public Admin getAdmin() {
		return admin;
	}
	public boolean isLogin() {
		return isLogin;
	}
	public List<Departments> getAllD() {
		return allD;
	}
	
	
}
