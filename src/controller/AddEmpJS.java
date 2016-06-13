package controller;

import com.opensymphony.xwork2.ActionSupport;

import entities.Employees;
import models.DepartmentModel;
import models.EmployeesModel;
import ultil.SessionUlti;

public class AddEmpJS extends ActionSupport {
	String name, jobTitle, phone, email;
	int dmpId;
	boolean result;

	public String execute() {
		if (SessionUlti.isLogedIn()) {
			Employees e = new Employees();
			e.setDepartments(DepartmentModel.getDepartmentById(dmpId));
			e.setName(name);
			e.setEmail(email);
			e.setJobTitle(jobTitle);
			e.setPhone(phone);
			System.out.println(phone);
			e.setCusAva(false);
			EmployeesModel.saveOrUpdateEmployees(e);
			result=true;
		} else {
			result=false;
		}
		
		return SUCCESS;
	}

	public boolean isResult() {
		return result;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setDmpId(int dmpId) {
		this.dmpId = dmpId;
	}

}
