package controller;

import com.opensymphony.xwork2.ActionSupport;

import ultil.SessionUlti;

public class ChangePass extends ActionSupport{
	String id;
	public String execute(){
		if(SessionUlti.isLogedIn()){
			id=(String)SessionUlti.getSession().get("login");
			return SUCCESS;
		}
		
		else {
			return ERROR;
		}
	}
	public String getId() {
		return id;
	}
	
	
}
