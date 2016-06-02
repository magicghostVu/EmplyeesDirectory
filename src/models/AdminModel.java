/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author magic_000
 */
import entities.*;
import java.util.List;
import org.hibernate.SessionFactory;
public class AdminModel {
    
    //static SessionFactory sf=H.getSessionFactory();
    public static List<Admin> getAllAdmin(){
        //sf=H.getSessionFactory();
    	SessionFactory sf=H.getSessionFactory();
        List<Admin> res=null;
        
        try {
            sf.getCurrentSession().beginTransaction();
            res= sf.getCurrentSession().createCriteria(Admin.class).list();
            sf.getCurrentSession().close();
            //sf.close();
            
        } catch (Exception e) {
            sf.getCurrentSession().close();
        }
        
        
        return res;
    }
    
    public static boolean containAdmin(List<Admin> all, String user, String pass){
    	all=getAllAdmin();
    	for (int i = 0; i <all.size(); i++) {
			if(user.equals(all.get(i).getUserName())&&pass.equals(all.get(i).getPass())){
				return true;
			}
		}
    	
    	return false;
    }
    public static Admin getAdminById(String Id){
    	Admin res=null;
    	SessionFactory sf=H.getSessionFactory();
    	
    	try {
			sf.getCurrentSession().beginTransaction();
			res=(Admin) sf.getCurrentSession().get(Admin.class, Id);
			sf.getCurrentSession().close();
		} catch (Exception e) {
			// TODO: handle exception
			sf.getCurrentSession().close();
		}
    	return res;
    }
    
    public static void SaveOrUpdateAdm(Admin a){
    	SessionFactory sf=H.getSessionFactory();
    	try {
			sf.getCurrentSession().beginTransaction();
			sf.getCurrentSession().saveOrUpdate(a);
			sf.getCurrentSession().getTransaction().commit();
			sf.getCurrentSession().close();
		} catch (Exception e) {
			sf.getCurrentSession().close();
		}
    }
    
    
}
