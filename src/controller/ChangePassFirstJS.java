package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import models.AdminModel;
import ultil.SessionUlti;

public class ChangePassFirstJS extends ActionSupport{
	String password;
	boolean result;
	public String execute(){
		String adminF;
		if(SessionUlti.getSession().containsKey("adminF")){
			adminF=(String)SessionUlti.getSession().get("adminF");
			Admin a=AdminModel.getAdminById(adminF);
			SessionUlti.getSession().remove("adminF");
			a.setPass(password);
			a.setChangedPass(true);
			AdminModel.SaveOrUpdateAdm(a);
			result=true;
		}else{
			result=false;
		}
		return SUCCESS;
	}
	public boolean isResult() {
		return result;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
