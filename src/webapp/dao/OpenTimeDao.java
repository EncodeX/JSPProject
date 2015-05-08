package webapp.dao;

import java.sql.Timestamp;

/**
 * Created by zz on 2015/5/8.
 */
public interface OpenTimeDao {
    public Timestamp getOpenTimeByType(String type);
    public Timestamp getEndTimeByType(String type);
    public boolean setOpenAndEndTime(String type,Timestamp openTime,Timestamp endTime);
}
