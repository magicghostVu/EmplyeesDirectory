package controller;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import entities.Employees;
import models.EmployeesModel;
import ultil.SessionUlti;

public class DeleteSomeEmpJS extends ActionSupport {
	String lst;
	boolean result=false;
	public  String execute(){
		if(SessionUlti.isLogedIn()==false){
			return SUCCESS;
		}
		String[] arr=lst.split(",");
		int[] listId=new int[arr.length];
		for (int i = 0; i < listId.length; i++) {
			listId[i]=Integer.parseInt(arr[i]);
		}
		for (int i = 0; i < listId.length; i++) {
			Employees tmp=EmployeesModel.getEmployeeById(listId[i]);
			EmployeesModel.deleteEmp(tmp);
		}
		result=true;
		
		//System.out.println(lst);
		
		return SUCCESS;
	}
	public void setLst(String lst) {
		this.lst = lst;
	}
	public boolean isResult() {
		return result;
	}
	
}
