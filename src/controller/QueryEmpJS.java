package controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import entities.Employees;
import models.EmployeesModel;
import ultil.EmpMin;

public class QueryEmpJS extends ActionSupport{
	String name="";
	int idDpm;
	List<EmpMin> result;
	
	public static boolean isInRes(Employees e, String name, int dpmId){
		String nameLowerCase= e.getName().toLowerCase();
		String tmpName=name.toLowerCase();
		if(dpmId==0&&nameLowerCase.contains(tmpName)){
			return true;
		}
		if(nameLowerCase.contains(tmpName)&&e.getDepartments().getId()==dpmId){
			return true;
		}else
		return false;
	}
	
	public String execute(){
		result=new ArrayList<>();
		List<Employees> allE=EmployeesModel.getAllEmployeeses();
		for (Employees employees : allE) {
			if(isInRes(employees, name, idDpm)){
				result.add(new EmpMin(employees));
			}
		}
		return SUCCESS;
		
		
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setIdDpm(int idDpm) {
		this.idDpm = idDpm;
	}
	public List<EmpMin> getResult() {
		return result;
	}
	
}
