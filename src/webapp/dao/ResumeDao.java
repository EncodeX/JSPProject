package webapp.dao;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2015/6/13.
 */
public interface ResumeDao {
    boolean isExist(int id);
    boolean addResume(int id,Timestamp startTime,Timestamp endTime,String major);
    boolean deleteResume(int id);
}
