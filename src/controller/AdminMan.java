package controller;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import models.AdminModel;
import ultil.SessionUlti;

public class AdminMan extends ActionSupport {
	
	Admin admin;
	boolean isLogin=false;
	List<Admin> allAd;
	public String execute(){
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
			isLogin=true;
			admin=AdminModel.getAdminById(tmpId);
			if(admin.getOwner()==true){
				allAd=AdminModel.getAllAdmin();
				return SUCCESS;
			}
			return ERROR;
		}else{
			return ERROR;
		}
		//turn SUCCESS;
	}
	public Admin getAdmin() {
		return admin;
	}
	public boolean isLogin() {
		return isLogin;
	}
	public List<Admin> getAllAd() {
		return allAd;
	}
	
	
}
