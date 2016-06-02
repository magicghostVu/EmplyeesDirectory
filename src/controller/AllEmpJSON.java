package controller;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import entities.Employees;
import models.EmployeesModel;
import ultil.EmpMin;

public class AllEmpJSON extends ActionSupport {
	List<EmpMin> all;
	public String execute(){
		all=new ArrayList<>();
		List<Employees> alle=EmployeesModel.getAllEmployeeses();
		for (int i = 0; i < alle.size(); i++) {
			EmpMin tmp=new EmpMin(alle.get(i).getName(), alle.get(i).getId());
			all.add(tmp);
		}
		
		return SUCCESS;
	}
	public List<EmpMin> getAll() {
		return all;
	}
	
	
}
