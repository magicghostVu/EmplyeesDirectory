package controller;

import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import ultil.SessionUlti;

public class LogoutAction extends ActionSupport{
	private boolean res1, res2;
	public String execute(){
		Map<String , Object> session=SessionUlti.getSession();
		if(session.containsKey("login")){
			
			
			session.remove("login");
			res1=true;
		}
		return SUCCESS;
	}
	
	
	public boolean isRes1() {
		return res1;
	}


	public void setRes1(boolean res1) {
		this.res1 = res1;
	}


	public boolean isRes2() {
		return res2;
	}
	public void setRes2(boolean res2) {
		this.res2 = res2;
	}
	
}
