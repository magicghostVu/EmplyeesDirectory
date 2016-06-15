package controller;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import entities.*;
import models.*;
import ultil.SessionUlti;
public class Home extends ActionSupport{
	Admin admin;
	// kiểm tra đăng nhập
	boolean isLogin=false;
	List<Departments> allDepartment;
	public String execute(){
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
			isLogin=true;
			admin=AdminModel.getAdminById(tmpId);
		}
		allDepartment=DepartmentModel.getAllDepartment();
		return SUCCESS;
		
	}
	public boolean isLogin() {
		return isLogin;
	}


	public List<Departments> getAllDepartment() {
		return allDepartment;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public void setAllDepartment(List<Departments> allDepartment) {
		this.allDepartment = allDepartment;
	}
}
