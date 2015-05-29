package webapp.dao.impl;

import webapp.dao.AssignDao;
import webapp.model.RecommendUnit;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by zz on 2015/5/23.
 */
public class AssignDaoImpl implements AssignDao{

    Connection connection= DbConnector.getConnection();

    @Override
    public ArrayList<RecommendUnit> getAllRecommendUnits() {
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<RecommendUnit> recommendUnits=new ArrayList<RecommendUnit>();
        try {
            ps=connection.prepareStatement("select DISTINCT * from rec_units where rec_units.unitsID>0");
            rs = ps.executeQuery();
            while(rs.next()){
                RecommendUnit ru=new RecommendUnit(rs.getString("unitsName"),rs.getString("unitsPwd"),rs.getInt("recTotal"));
                recommendUnits.add(ru);
            }
            return recommendUnits;
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]ArrayList<RecommendUnit> getAllRecommendUnits.");
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public RecommendUnit getRecommendUnitByName(String name) {
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps=connection.prepareStatement("select DISTINCT * from rec_units where unitsName=?");
            ps.setString(1,name);
            rs = ps.executeQuery();
            rs.next();
            return new RecommendUnit(rs.getString("unitsName"),rs.getString("unitsPwd"),rs.getInt("recTotal"));
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]SubjectGroup getSubjectGroupByName ERROR.");
            return null;
        }
    }

    @Override
    public boolean isExist(String name) {
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps=connection.prepareStatement("select DISTINCT * from rec_units WHERE unitsName=?");
            ps.setString(1,name);
            rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]AssignDaoImpl boolean isExist ERROR.");
            return false;
        }
    }

    @Override
    public boolean changeRecommendUnitQuota(String name, int quota) {
        PreparedStatement ps;
        try {
            ps=connection.prepareStatement("update rec_units set recTotal=? where unitsName=?");
            ps.setInt(1, quota);
            ps.setString(2, name);
            ps.execute();
            return true;
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]AssignDaoImpl boolean changeRecommendUnitQuota ERROR.");
            return false;
        }
    }
}
