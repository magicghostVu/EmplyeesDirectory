package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import models.AdminModel;
import ultil.SessionUlti;

public class ChangePassJS extends ActionSupport{
	String oldPass, newPass;
	boolean result=false;
	public String execute(){
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
		 	Admin	admin=AdminModel.getAdminById(tmpId);
		 	if(oldPass.equals(admin.getPass())){
		 		admin.setPass(newPass);
		 		AdminModel.SaveOrUpdateAdm(admin);
		 		SessionUlti.getSession().remove("login");
		 		result=true;
		 	}else {
				result=false;
			}
		}
		
		return SUCCESS;
	}
	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}
	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	public boolean isResult() {
		return result;
	}
	
	
	
}
