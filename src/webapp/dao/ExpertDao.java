package webapp.dao;

import webapp.model.Expert;

import java.util.Vector;

/**
 * Created by zz on 2015/5/8.
 */
public interface ExpertDao {
    public boolean addExpert(String expName, String expPwd, String expID, int groupID);
    public boolean deleteExpert(String expID);
    public boolean updateExpert(String expName, String expPwd, String expID, int groupID);
    public Vector<Expert> updateExpert();
}
