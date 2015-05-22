package webapp.dao;

import webapp.model.Units;

import java.util.ArrayList;

/**
 * Created by zz on 2015/5/8.
 */
public interface ResUnitsDao {
    ArrayList<Units> getAllUnits(int page,int numPerPage);
    int getUnitsAmount();
    boolean isExist(String name);
    Units getUnitsByName(String name);
    boolean deleteUnitsByName(String name);
    boolean addUnits(Units units);

}
