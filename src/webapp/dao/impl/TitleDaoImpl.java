package webapp.dao.impl;
import webapp.dao.TitleDao;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by Administrator on 2015/6/13.
 */
public class TitleDaoImpl implements TitleDao{
        Connection connection= DbConnector.getConnection();
        @Override
        public boolean isExist(String title) {
            PreparedStatement ps;
            String sql="select DISTINCT * from title WHERE title=?";
            try {
                ps=connection.prepareStatement(sql);
                ps.setString(1, title);
                ResultSet rs = ps.executeQuery();
                return rs.next();
            }
            catch (Exception e){
                System.err.println("查询信息时出现异常" + sql + e);
                return false;
            }
        }

        @Override
        public boolean addTitle(int id,String title) {
            PreparedStatement ps;
            String sql="INSERT INTO title(id,title) VALUES (?,?);";
            try {
                ps=connection.prepareStatement(sql);
                ps.setInt(1,id);
                ps.setString(2,title);
                ps.executeUpdate();
                return true;
            }
            catch (Exception e){
                System.err.println("添加信息时出现异常"+sql+e);
                return false;
            }
        }

        @Override
        public boolean deleteTitle(String title) {
            PreparedStatement ps;
            String sql="delete from title where title =?";
            try {
                ps=connection.prepareStatement(sql);
                ps.setString(1, title);
                ps.execute();
                return true;
            }
            catch (Exception e){
                System.err.println("删除信息时出现异常"+sql+e);
                return false;
            }
        }

}
