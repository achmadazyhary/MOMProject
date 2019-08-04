/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GenericDAO;
import icontrollers.IUrbanvillageController;
import idaos.IGenericDAO;
import java.math.BigDecimal;
import java.util.List;
import models.Subdistrict;
import models.Urbanvillage;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author HARRY-PC
 */
public class UrbanvillageController implements IUrbanvillageController{
    
    private IGenericDAO iGenericDAO;
    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    
    public UrbanvillageController(){
        iGenericDAO = new GenericDAO(Urbanvillage.class, sessionFactory);
    }

    @Override
    public List<Urbanvillage> getAll() {
        return iGenericDAO.getAll();
    }

    @Override
    public List<Urbanvillage> getByName(String name) {
        return iGenericDAO.getByName(name);
    }

    @Override
    public Urbanvillage getById(String id) {
        return (Urbanvillage) iGenericDAO.getById(id);
    }

    @Override
    public String insert(String name, String subdistrict) {
        String result = "";
        Subdistrict subdist = new Subdistrict(new BigDecimal(subdistrict));
        Urbanvillage urban = new Urbanvillage(name, subdist);
        if(iGenericDAO.insert(urban)){
            result = "Data berhasil disimpan";
        }else{
            result = "Maaf Data gagal disimpan";
        }
        return result;
    }

    @Override
    public String update(String id, String name, String subdistrict) {
        String result = "";
        Subdistrict subdist = new Subdistrict(new BigDecimal(subdistrict));
        Urbanvillage urban = new Urbanvillage(new BigDecimal(id), name, subdist);
        if(iGenericDAO.update(urban)){
            result = "Data berhasil disimpan";
        }else{
            result = "Maaf Data gagal disimpan";
        }
        return result;
    }

    @Override
    public String delete(String id) {
        String result = "";
        if(iGenericDAO.delete(new Urbanvillage(new BigDecimal(id)))){
            result = "Data berhasil dihapus";
        }else{
            result = "maaf data gagal dihapus";
        }
        return result;
    }
    
}
