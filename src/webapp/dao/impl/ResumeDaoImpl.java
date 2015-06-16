package webapp.dao.impl;

import webapp.dao.ResumeDao;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2015/6/13.
 */
public class ResumeDaoImpl implements ResumeDao {
    Connection connection= DbConnector.getConnection();
    @Override
    public boolean isExist(int id) {
        PreparedStatement ps;
        String sql="select DISTINCT * from resume WHERE id=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public boolean addResume(int id, Timestamp startTime, Timestamp endTime, String major) {
        PreparedStatement ps;
        String sql="INSERT INTO resume(id,starttime,endtime,major) VALUES (?,?,?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setTimestamp(2, startTime);
            ps.setTimestamp(3, endTime);
            ps.setString(4, major);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean deleteResume(int id) {
        PreparedStatement ps;
        String sql="delete from resume where id =?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }
    }
}
