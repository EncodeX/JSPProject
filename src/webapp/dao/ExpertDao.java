package webapp.dao;

import webapp.model.Expert;

import java.util.ArrayList;
import java.util.Vector;

/**
 * Created by zz on 2015/5/8.
 */
public interface ExpertDao {
    public boolean addExpert(String expName, String expPwd, int groupID);
    public boolean deleteExpert(String expID);
    public boolean updateExpert(String expName, String expPwd,int expID, int groupID);
    public Vector<Expert> updateExpert();
    public ArrayList<Expert> getAllExperts(int page,int numPerPage);
    public int getExpertAmount();
    boolean isExist(String expName);
}
