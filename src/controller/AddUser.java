package controller;

import com.opensymphony.xwork2.ActionSupport;

import ultil.SessionUlti;

public class AddUser extends ActionSupport {
	public String execute(){
		if(SessionUlti.isLogedIn()){
			return SUCCESS;
		}else {
			return ERROR;
		}
		
	}
}
