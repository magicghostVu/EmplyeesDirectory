package controller;

import java.util.List;
import java.util.Random;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import models.AdminModel;
import sendMail.SendMail;
import ultil.SessionUlti;

public class AddUserJS extends ActionSupport {
	boolean result;
	String message;
	String userName;
	String email;

	public String execute() {
		if (SessionUlti.isLogedIn() == false) {
			message = "Error, try login again";
			return SUCCESS;
		}
		List<Admin> all = AdminModel.getAllAdmin();
		for (int i = 0; i < all.size(); i++) {
			if (userName.equals(all.get(i).getUserName()) || email.equals(all.get(i).getEmail())) {
				result = false;
				message = "Email or username has existed, try different";

				return SUCCESS;
			}
		}

		int passInt = new Random().nextInt(8999) + 1000;
		Admin a = new Admin(userName, Integer.toString(passInt), email);
		String content = "Your password is " + passInt;
		try {
			SendMail.sendMailTo(email, content);
		} catch (Exception e) {
			message = "Send mail error";
			result = true;
			return SUCCESS;
		}
		AdminModel.SaveOrUpdateAdm(a);
		message = "Add user successfully";
		result = true;
		return SUCCESS;
	}

	public boolean isResult() {
		return result;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

}
