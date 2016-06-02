package controller;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import entities.Employees;
import models.EmployeesModel;
import ultil.EmpMin;

public class EmployeesByDpm extends ActionSupport {
	int idDpm;

	List<EmpMin> empl;

	public String execute() {
		empl=new ArrayList<>();
		List<Employees> all=EmployeesModel.getAllEmployeeses();
		for (int i = 0; i < all.size(); i++) {
			if(all.get(i).getDepartments().getId()==idDpm){
				EmpMin tmp=new EmpMin(all.get(i).getName(), all.get(i).getId());
				empl.add(tmp);
			}
			
		}
		return SUCCESS;
	}



	public void setIdDpm(int idDpm) {
		this.idDpm = idDpm;
	}
	public List<EmpMin> getEmpl() {
		return empl;
	}
	
}
