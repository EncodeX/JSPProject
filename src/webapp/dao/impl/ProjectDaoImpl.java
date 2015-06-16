package webapp.dao.impl;

import webapp.dao.ProjectDao;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by Administrator on 2015/6/13.
 */
public class ProjectDaoImpl implements ProjectDao {
    Connection connection= DbConnector.getConnection();

    @Override
    public boolean isExist(String pname) {
        PreparedStatement ps;
        String sql="select DISTINCT * from project WHERE pname=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, pname);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public boolean addProject(int id, String pname, String unit, String role, String money) {
        PreparedStatement ps;
        String sql="INSERT INTO project(id,pname,unit,role,money) VALUES (?,?,?,?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, pname);
            ps.setString(3, unit);
            ps.setString(4, role);
            ps.setString(5, money);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean deleteProject(String pname) {
        PreparedStatement ps;
        String sql="delete from project where pname=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, pname);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }
    }
}
