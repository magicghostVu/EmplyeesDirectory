package ultil;

import entities.Employees;

public class EmpMin {
	String name;
	int id;
	String dpmName;
	String jobTitle;
	String email;
	public EmpMin() {
		name="NULL";
		id=0;
		dpmName="NULL";
		email="NULL";
		jobTitle="Null";
	}
	public EmpMin(String name,int id, String dmpName, String email, String jobTitle){
		this.name=name;
		this.id=id;
		this.dpmName=dmpName;
		this.email=email;
		this.jobTitle=jobTitle;
	}
	public EmpMin(String name, int id){
		this.name=name;
		this.id=id;
	}
	public EmpMin(Employees e){
		this.id=e.getId();
		this.name=e.getName();
		this.dpmName=e.getDepartments().getName();
		this.email=e.getEmail();
		this.jobTitle=e.getJobTitle();
	}
	public String getName() {
		return name;
	}
	public int getId() {
		return id;
	}
	public String getDpmName() {
		return dpmName;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public String getEmail() {
		return email;
	}
	
	
}
