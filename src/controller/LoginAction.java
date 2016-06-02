package controller;

import java.util.List;
import java.util.Map;
import com.opensymphony.xwork2.ActionSupport;
import entities.Admin;
import models.AdminModel;
import ultil.SessionUlti;

public class LoginAction extends ActionSupport{
	//không được sử dụng lớp này vì có chứa lỗ hổng bảo mật
	
	
	String userName, passWord;
	boolean result;
	public String execute(){
		
		List<Admin> all=AdminModel.getAllAdmin();
		if(AdminModel.containAdmin(all, userName, passWord)){
			Map<String , Object> session=SessionUlti.getSession();
			session.put("login", userName);// giá trị userName là giá trị của session
			result=true;
		}else {
			result=false;
		}
		return SUCCESS;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	
	
}
