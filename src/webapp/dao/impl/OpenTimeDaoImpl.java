package webapp.dao.impl;

import webapp.dao.OpenTimeDao;
import webapp.util.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

/**
 * Created by zz on 2015/5/8.
 */
public class OpenTimeDaoImpl implements OpenTimeDao {

    Connection connection= DbConnection.getConnection();

    @Override
    public Timestamp getOpenTimeByType(String type) {
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            ps=connection.prepareStatement("select * from opentime where type=?");
            ps.setString(1,type);
            rs = ps.executeQuery();
            rs.next();
            return rs.getTimestamp("opentime");
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]Timestamp getOpenTimeByType ERROR.");
            return null;
        }
    }

    @Override
    public Timestamp getEndTimeByType(String type) {
        PreparedStatement ps=null;
        ResultSet rs = null;
        try {
            ps=connection.prepareStatement("select * from endtime where type=?");
            ps.setString(1,type);
            rs = ps.executeQuery();
            rs.next();
            return rs.getTimestamp("endtime");
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]Timestamp getEndTimeByType ERROR.");
            return null;
        }
    }

    @Override
    public boolean setOpenAndEndTime(String type, Timestamp openTime, Timestamp endTime) {
        PreparedStatement ps=null;
        try {
            ps=connection.prepareStatement("update opentime set opentime=?,endtime=? where type=?");
            ps.setTimestamp(1,openTime);
            ps.setTimestamp(2,endTime);
            ps.setString(3,type);

            return ps.execute();
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]boolean setOpenAndEndTime ERROR.");
            return false;
        }
    }
}
