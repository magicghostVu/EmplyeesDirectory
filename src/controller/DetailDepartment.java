package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import entities.Departments;
import models.AdminModel;
import models.DepartmentModel;
import ultil.SessionUlti;

public class DetailDepartment extends ActionSupport {
	int id=-1;
	Departments department;
	Admin admin;
	boolean isLogin=false;
	public String execute(){
		if(id==-1){
			return ERROR;
		}else{
			if(SessionUlti.isLogedIn()){
				String tmpId=(String)SessionUlti.getSession().get("login");
				isLogin=true;
				admin=AdminModel.getAdminById(tmpId);
			}
			
			department=DepartmentModel.getDepartmentById(id);
			if(department==null){
				return ERROR;
			}
			return SUCCESS;
		}
		
	}
	
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public boolean isLogin() {
		return isLogin;
	}

	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}

	public Departments getDepartment() {
		return department;
	}

	public void setDepartment(Departments department) {
		this.department = department;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
}
