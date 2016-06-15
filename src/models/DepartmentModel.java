package models;

import org.hibernate.SessionFactory;
import java.util.List;
import entities.*;
public class DepartmentModel {
	//static SessionFactory sf=H.getSessionFactory();
	// Lấy tất cả các phòng
	public static List<Departments> getAllDepartment(){
		List<Departments> res=null;
		SessionFactory sf=H.getSessionFactory();
		try {
			//SessionFactory sf=H.getSessionFactory();
			sf.getCurrentSession().beginTransaction();
			res=sf.getCurrentSession().createCriteria(Departments.class).list();
			sf.getCurrentSession().close();
		} catch (Exception e) {
			sf.getCurrentSession().close();
			// TODO: handle exception
		}
		for (int i = 0; i < res.size(); i++) {
			Integer tmpId;
			/*tmpId=res.get(i).getEmployees().getId();*/
			try {
				tmpId=res.get(i).getEmployees().getId();
			} catch (Exception e) {
				// TODO: handle exception
				tmpId=-1;
			}
			res.get(i).setEmployees(EmployeesModel.getEmployeeById(tmpId));
		}
		return res;
	}
	//lấy phòng theo id
	public static Departments getDepartmentById(int Id){
		SessionFactory sf=H.getSessionFactory();
		Departments res=null;
		try {
			sf.getCurrentSession().beginTransaction();
			res=(Departments)sf.getCurrentSession().get(Departments.class, Id);
			//sf.getCurrentSession().flush();
			sf.getCurrentSession().close();
			res.setEmployees(EmployeesModel.getEmployeeById(res.getEmployees().getId()));
		} catch (Exception e) {
			// TODO: handle exception
			sf.getCurrentSession().close();
		}
		return res;
	}
	// lấy phiên bản thu gọn của dmp
	public static Departments getDepartmentByIdMin(int id){
		SessionFactory sf=H.getSessionFactory();
		Departments res=null;
		try {
			sf.getCurrentSession().beginTransaction();
			res=(Departments)sf.getCurrentSession().get(Departments.class, id);
			//sf.getCurrentSession().flush();
			sf.getCurrentSession().close();
			//res.setEmployees(EmployeesModel.getEmployeeById(res.getEmployees().getId()));
		} catch (Exception e) {
			// TODO: handle exception
			sf.getCurrentSession().close();
		}
		return res;
	}
	//cập nhật hoặc thêm dpm
	public static void saveOrUpdateDepartment(Departments d){
		SessionFactory sf=H.getSessionFactory();
		try {
			sf.getCurrentSession().beginTransaction();
			sf.getCurrentSession().saveOrUpdate(d);
			sf.getCurrentSession().getTransaction().commit();
			//sf.getCurrentSession().flush();
			sf.getCurrentSession().close();
		} catch (Exception e) {
			// TODO: handle exception
			//sf.getCurrentSession().getTransaction().rollback();
			sf.getCurrentSession().close();
		}
	}
	// xóa dpm
	public static void deleteDpm(int idDpm){
		Departments d=DepartmentModel.getDepartmentById(idDpm);
		if(d==null) return;
		else{
			List<Employees> e=EmployeesModel.getEmployeesByDepartment(idDpm);
			for (Employees employees : e) {
				EmployeesModel.deleteEmp(employees);
			}
			
			SessionFactory sf=H.getSessionFactory();
			try {
				sf.getCurrentSession().beginTransaction();
				sf.getCurrentSession().delete(d);
				sf.getCurrentSession().getTransaction().commit();
				sf.getCurrentSession().close();
			} catch (Exception e2) {
				sf.getCurrentSession().close();
			}
		}
		
		
	}
	
	
	
}
