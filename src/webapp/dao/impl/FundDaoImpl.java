package webapp.dao.impl;

import webapp.dao.FundDao;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by Administrator on 2015/6/13.
 */
public class FundDaoImpl implements FundDao {
    Connection connection= DbConnector.getConnection();

    @Override
    public boolean isExist(String fname) {
        PreparedStatement ps;
        String sql="select DISTINCT * from fund WHERE fname=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, fname);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public boolean addFund(int id, String fname, String rank, String way, String situation) {
        PreparedStatement ps;
        String sql="INSERT INTO fund(id,fname,rank,way,situation) VALUES (?,?,?,?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, fname);
            ps.setString(3, rank);
            ps.setString(4, way);
            ps.setString(5, situation);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean deleteFund(String fname) {
        PreparedStatement ps;
        String sql="delete from fund where fname=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, fname);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }
    }
}
