package models;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import entities.Departments;
import entities.Employees;

public class EmployeesModel {
	// lấy tất cả nhân viên
	public static List<Employees> getAllEmployeeses(){
		List<Employees> allEmp = null;
        SessionFactory sf = H.getSessionFactory();
        try {
            sf.getCurrentSession().beginTransaction();
            allEmp = sf.getCurrentSession().createCriteria(Employees.class).list();
            sf.getCurrentSession().close();
            Departments tmpd;
            for (int i = 0; i < allEmp.size(); i++) {
                tmpd=DepartmentModel.getDepartmentById(allEmp.get(i).getDepartments().getId());
                allEmp.get(i).setDepartments(tmpd);
            }
            //sf.close();
        } catch (Exception e) {
            // TODO: handle exception
            sf.getCurrentSession().close();
        }
        return allEmp;
	}
	
	// lấy nhân viên theo id
	public static Employees getEmployeeById(Integer id){
		SessionFactory sf=H.getSessionFactory();
		Employees res=null;
		try {
			sf.getCurrentSession().beginTransaction();
			res= (Employees) sf.getCurrentSession().get(Employees.class, id);
			sf.getCurrentSession().close();
			Departments d= DepartmentModel.getDepartmentByIdMin(res.getDepartments().getId());
			res.setDepartments(d);
		} catch (Exception e) {
			sf.getCurrentSession().close();
		}
		return res;
	}
	// cập nhật hoặc thêm nhân viên
	public static void saveOrUpdateEmployees(Employees e){
		SessionFactory sf=H.getSessionFactory();
		
		try {
			sf.getCurrentSession().beginTransaction();
			sf.getCurrentSession().saveOrUpdate(e);
			sf.getCurrentSession().getTransaction().commit();
			sf.getCurrentSession().close();
		} catch (Exception e2) {
			sf.getCurrentSession().close();
		}
	}
	// lấy nhân viên theo phòng
	public static List<Employees> getEmployeesByDepartment(int idDepart){
		List<Employees> all=getAllEmployeeses();
		List<Employees> res=new ArrayList<>();
		for (int i = 0; i < all.size(); i++) {
			if(all.get(i).getDepartments().getId()==idDepart){
				res.add(all.get(i));
			}
		}
	
		return res;
	}
	// xóa nhân viên
	public static void deleteEmp(Employees e){
		SessionFactory sf=H.getSessionFactory();
		try {
			sf.getCurrentSession().beginTransaction();
			sf.getCurrentSession().delete(e);
			sf.getCurrentSession().getTransaction().commit();
			sf.getCurrentSession().close();
		} catch (Exception e2) {
			sf.getCurrentSession().close();
		}
	}
	
	// trả về xem nhân viên có phải quản lý của phòng nào đấy không . 
	public static int isMan(Employees e){
		List<Departments> all=DepartmentModel.getAllDepartment();
		for(int i=0;i<all.size();++i){
			if(all.get(i).getEmployees()==null){
				continue;
			}
			if(e.getId()==all.get(i).getEmployees().getId()){
				return all.get(i).getId();
			}
		}
		return -1;
	}
	
}
