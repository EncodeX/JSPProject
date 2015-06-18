package webapp.dao;

import webapp.model.Units;
import webapp.model.Proposer;

import java.util.ArrayList;

/**
 * Created by zz on 2015/5/8.
 */
public interface ResUnitsDao {



    ArrayList<Units> getAllUnits(int page,int numPerPage);

    ArrayList<Units> getAllUnitsName();
    ArrayList<Units> getPartUnits(int limit1, int limit2);
    int getUnitsAmount();
    boolean isExist(String name);
    Units getUnitsByName(String name);
    boolean deleteUnitsByName(String name);
    boolean addUnits(Units units);

}
