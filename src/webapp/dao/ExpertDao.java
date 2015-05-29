package webapp.dao;

import webapp.model.Committee;
import webapp.model.Expert;

import java.util.ArrayList;
import java.util.Vector;

/**
 * Created by zz on 2015/5/8.
 */
public interface ExpertDao {
    boolean addExpert(String expName, String expPwd, int groupID,int status);
    boolean deleteExpert(String name);
    boolean updateExpert(String exOldname,String expName, String expPwd, int groupID,int status);
    Vector<Expert> updateExpert();
    ArrayList<Expert> getAllExperts(int page,int numPerPage);
    int getExpertAmount();
    boolean isExist(String expName);
    Expert getExpertByName(String name);


    //by zz
    ArrayList<Expert> getAllExpertsByGroupId(int groupId,int status);
    ArrayList<Expert> getAllExpertsByStatus(int status);
    Expert getExpertByExpertID(int expertID);
    ArrayList<Committee> getAllCommittees();
}
