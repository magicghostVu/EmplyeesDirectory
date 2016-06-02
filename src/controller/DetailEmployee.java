package controller;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import entities.Admin;
import entities.Departments;
import entities.Employees;
import models.AdminModel;
import models.DepartmentModel;
import models.EmployeesModel;
import ultil.SessionUlti;

public class DetailEmployee extends ActionSupport {
	Integer id=-1;
	Employees e;
	Admin admin;
	List<Departments> allD;
	boolean isLogin=false;
	public String execute(){
		if(SessionUlti.isLogedIn()){
			String tmpId=(String)SessionUlti.getSession().get("login");
			isLogin=true;
			admin=AdminModel.getAdminById(tmpId);
		}
		if(id==-1){
			return ERROR;
		}else{
			e=EmployeesModel.getEmployeeById(id);
			if(e==null){
				return ERROR;
			}
			allD=DepartmentModel.getAllDepartment();
			Departments d=DepartmentModel.getDepartmentById(e.getDepartments().getId());
			allD.remove(d);
			allD.add(0, d);
			System.out.println(allD.size());
			return SUCCESS;
		}
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Employees getE() {
		return e;
	}
	public void setE(Employees e) {
		this.e = e;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public boolean isLogin(){
		return isLogin;
	}

	public void setLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}

	public List<Departments> getAllD() {
		return allD;
	}
	
	
}
