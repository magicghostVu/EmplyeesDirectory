package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import models.AdminModel;
import ultil.SessionUlti;

public class DeleteAdminJS extends ActionSupport {
	String userName;
	boolean result;
	String message="m";
	public String execute(){
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
			Admin admin=AdminModel.getAdminById(tmpId);
			if(userName.equals(admin.getUserName())){
				message="You can't delete yourself";
				result=false;
				return SUCCESS;
			}
			if(admin.getOwner()==true){
				Admin tmp=AdminModel.getAdminById(userName);
				if(tmp==null){
					result=false;
				}else{
					AdminModel.DeteleAdmin(tmp);
					
					message="Deleted";
					result=true;
				}
				return SUCCESS;
			}
			return SUCCESS;
		}else{
			return SUCCESS;
		}
		//return SUCCESS;
	}
	public boolean isResult() {
		return result;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMessage() {
		return message;
	}
	
	
}
