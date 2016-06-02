package controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionSupport;
public class FileUpLoadEx extends ActionSupport{
	File file;
	boolean result;
	public String execute(){
		File f=new File("E:\\e.dat");
		if (f.exists()==false) {
			try {
				f.createNewFile();
				//FileUtils.copyFile(file, f);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}
		
		if(file==null){
			result=false;
			
			System.out.println("do file null");
		}else {
			
			System.out.println(file);
			result=true;
			try {
				FileUtils.copyFile(file, f);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		}
		return SUCCESS;
	}
	public boolean isResult() {
		return result;
	}
	public void setFile(File file) {
		this.file = file;
	}
	
	
}
