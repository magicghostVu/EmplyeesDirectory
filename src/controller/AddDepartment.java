package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import models.AdminModel;
import ultil.SessionUlti;

public class AddDepartment extends ActionSupport {
	Admin admin;
	boolean isLogin=false;
	public String execute() {
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
			isLogin=true;
			admin=AdminModel.getAdminById(tmpId);
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
	
}
