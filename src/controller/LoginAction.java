package controller;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork2.ActionSupport;
import entities.Admin;
import models.AdminModel;
import ultil.SessionUlti;

public class LoginAction extends ActionSupport{
	String userName, passWord;
	int result;
	public String execute(){
		//System.out.println("đã chạy qua đây");
		List<Admin> all=AdminModel.getAllAdmin();
		if(AdminModel.containAdmin(all, userName, passWord)){
			
			Admin a=AdminModel.getAdminById(userName);
			if(a.getChangedPass()==false){
				SessionUlti.getSession().put("adminF", userName);
				result=2;
				return SUCCESS;
			}
			
			Map<String , Object> session=SessionUlti.getSession();
			session.put("login", userName);
			
			
			result=0;///thành công
		}else {
			result=1;// sai pass hoặc username
		}
		return SUCCESS;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public int getResult() {
		return result;
	}
	
	
	
	
}
