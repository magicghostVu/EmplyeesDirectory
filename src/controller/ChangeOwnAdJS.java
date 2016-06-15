package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import models.AdminModel;
import ultil.SessionUlti;

public class ChangeOwnAdJS extends ActionSupport {
	String userName;
	int data;
	boolean result;
	String message;
	public String execute(){
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
			Admin admin=AdminModel.getAdminById(tmpId);
			if(admin.getOwner()==false){
				result=false;
				message="You are not owner";
				return SUCCESS;
			}else{
				Admin tmpAd=AdminModel.getAdminById(userName);
				if(tmpAd==null){
					result=false;
					message="Admin is no longer exist";
					return SUCCESS;
				}else {
					if(data==1){
						tmpAd.setOwner(true);
					}else {
						if(admin.getUserName().equals(tmpAd.getUserName())){
							message="You can't unown yourself";
							result=false;
							return SUCCESS;
						}
						tmpAd.setOwner(false);
					}
					AdminModel.SaveOrUpdateAdm(tmpAd);
					message="Updated";
					result=true;
				}
			}
		}
		return SUCCESS;
	}
	public boolean isResult() {
		return result;
	}
	public String getMessage() {
		return message;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setData(int data) {
		this.data = data;
	}
	
	
	
}
