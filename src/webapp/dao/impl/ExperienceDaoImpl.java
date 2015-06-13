package webapp.dao.impl;

import webapp.dao.ExperienceDao;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by Administrator on 2015/6/13.
 */
public class ExperienceDaoImpl implements ExperienceDao {
    Connection connection= DbConnector.getConnection();
    @Override
    public boolean isExist(String experience) {
        PreparedStatement ps;
        String sql="select DISTINCT * from experience WHERE experience=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, experience);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public boolean addExperience(int id, String experience) {
        PreparedStatement ps;
        String sql="INSERT INTO experience(id,experience) VALUES (?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,id);
            ps.setString(2,experience);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean deleteExperience(String experience) {
        PreparedStatement ps;
        String sql="delete from experience where experience =?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, experience);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }
    }
}
