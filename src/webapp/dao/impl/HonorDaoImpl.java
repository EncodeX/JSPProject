package webapp.dao.impl;

import webapp.dao.HonorDao;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2015/6/13.
 */
public class HonorDaoImpl implements HonorDao {
    Connection connection= DbConnector.getConnection();

    @Override
    public boolean isExist(String hname) {
        PreparedStatement ps;
        String sql="select DISTINCT * from honor WHERE hname=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, hname);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public boolean addHonor(int id, String hname, String unit, Timestamp htime, int total, int rank) {
        PreparedStatement ps;
        String sql="INSERT INTO honor(id,hname,unit,htime,total,rank) VALUES (?,?,?,?,?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, hname);
            ps.setString(3, unit);
            ps.setTimestamp(4, htime);
            ps.setInt(5, total);
            ps.setInt(6, rank);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean deleteHonor(String hname) {
        PreparedStatement ps;
        String sql="delete from resume where hname=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, hname);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }
    }
}
