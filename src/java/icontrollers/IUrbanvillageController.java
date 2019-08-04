/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package icontrollers;

import java.util.List;
import models.Urbanvillage;

/**
 *
 * @author HARRY-PC
 */
public interface IUrbanvillageController {
    public List<Urbanvillage> getAll();
    public List<Urbanvillage> getByName(String name);
    public Urbanvillage getById(String id);
    public String insert(String name, String subdistrict);
    public String update(String id, String name, String subdistrict);
    public String delete(String id);
}
