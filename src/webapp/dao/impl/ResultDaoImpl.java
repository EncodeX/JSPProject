package webapp.dao.impl;

import webapp.dao.ResultDao;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by Administrator on 2015/6/13.
 */
public class ResultDaoImpl implements ResultDao {
    Connection connection= DbConnector.getConnection();

    @Override
    public boolean isExist(String situation) {
        PreparedStatement ps;
        String sql="select DISTINCT * from result WHERE situation=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, situation);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public boolean addResult(int id, String situation) {
        PreparedStatement ps;
        String sql="INSERT INTO result(id,situation) VALUES (?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,id);
            ps.setString(2,situation);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean deleteResult(String situation) {
        PreparedStatement ps;
        String sql="delete from result where situation =?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, situation);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }
    }
}
