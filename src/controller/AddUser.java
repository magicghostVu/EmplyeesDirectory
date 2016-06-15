package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import models.AdminModel;
import ultil.SessionUlti;

public class AddUser extends ActionSupport {
	public String execute(){
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
			Admin admin=AdminModel.getAdminById(tmpId);
			if(admin.getOwner()==true){
				return SUCCESS;
			}else {
				return ERROR;
			}
			
		}else {
			return ERROR;
		}
		
	}
}
