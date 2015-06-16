package webapp.dao;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2015/6/13.
 */
public interface HonorDao {
    boolean isExist(String hname);
    boolean addHonor(int id,String hname,String unit,Timestamp htime,int total,int rank);
    boolean deleteHonor(String hname);
}
