package controller;

import com.opensymphony.xwork2.ActionSupport;

import ultil.SessionUlti;

public class ChangePassFirst extends ActionSupport{
	String adminF;
	public String execute(){
		if(SessionUlti.getSession().containsKey("adminF")){
			adminF=(String)SessionUlti.getSession().get("adminF");
			return SUCCESS;
		}else{
			return ERROR;
		}
		
	}
	public String getAdminF() {
		return adminF;
	}
	
}
