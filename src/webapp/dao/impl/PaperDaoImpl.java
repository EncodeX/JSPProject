package webapp.dao.impl;

import webapp.dao.PaperDao;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by Administrator on 2015/6/13.
 */
public class PaperDaoImpl implements PaperDao{
    Connection connection= DbConnector.getConnection();

    @Override
    public boolean isExist(String paper) {
        PreparedStatement ps;
        String sql="select DISTINCT * from paper WHERE paper=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, paper);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public boolean addPaper(int id, String paper) {
        PreparedStatement ps;
        String sql="INSERT INTO paper(id,paper) VALUES (?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,id);
            ps.setString(2,paper);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean deletePaper(String paper) {
        PreparedStatement ps;
        String sql="delete from paper where paper =?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, paper);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }
    }
}
