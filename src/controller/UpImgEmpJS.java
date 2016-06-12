package controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionSupport;

import entities.Employees;
import models.EmployeesModel;
import ultil.SessionUlti;

public class UpImgEmpJS extends ActionSupport{
	File file;
	int id=-1;
	boolean result;
	
	private final String dts="C:\\Users\\magic_000\\workspace\\EmployeesDirectory\\WebContent\\img";
	private final String tmpDts="C:\\Users\\magic_000\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\EmployeesDirectory\\img";
	
	public String execute(){
		if(SessionUlti.isLogedIn()==false){
			return SUCCESS;
		}
		if(id==-1){
			return SUCCESS;
		}
		if(file==null){
			return SUCCESS;
		}
		
		Employees e=EmployeesModel.getEmployeeById(id);
		if(e==null){
			return SUCCESS;
		}
		/*System.out.println(id);
		System.out.println(file.getPath());*/
		
		File dtsFol= new File(dts);
		File tmpdtsFol=new File(tmpDts);
		
		if(e.getCusAva()==false){
			e.setCusAva(true);
			EmployeesModel.saveOrUpdateEmployees(e);
			String fileNameDts=dts+"\\"+e.getId()+".jpg";
			String fileNameTmpDts=tmpDts+"\\"+e.getId()+".jpg";
			File fileDts=new File(fileNameDts);
			File fileTmpDts=new File(fileNameTmpDts);
			try {
				fileTmpDts.createNewFile();
				fileDts.createNewFile();
				FileUtils.copyFile(file, fileDts);
				FileUtils.copyFile(file, fileTmpDts);
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
			result=true;
			
		}else {
			String fileNameDts=dts+"\\"+e.getId()+".jpg";
			String fileNameTmpDts=tmpDts+"\\"+e.getId()+".jpg";
			File fileDts=new File(fileNameDts);
			File fileTmpDts=new File(fileNameTmpDts);
			try {
				/*fileTmpDts.createNewFile();
				fileDts.createNewFile();*/
				FileUtils.copyFile(file, fileDts);
				FileUtils.copyFile(file, fileTmpDts);
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
			
			
			
			result=true;
		}
		return SUCCESS;
	}
	public boolean isResult() {
		return result;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}
