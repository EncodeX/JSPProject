package webapp.dao.impl;

import webapp.dao.ResUnitsDao;
import webapp.model.Proposer;
import webapp.model.Units;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by y on 2015/5/15.
 */
public class ResUnitsDaoImpl implements ResUnitsDao{

    Connection connection= DbConnector.getConnection();


    public ArrayList<Units> getAllUnits(int page, int numPerPage) {
        PreparedStatement ps;
        ArrayList<Units> Units=new ArrayList<Units>();
        String sql="select * from rec_units where rec_units.unitsID>0 limit ?,?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,(page-1)*numPerPage);
            ps.setInt(2,numPerPage);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Units units=new Units(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
                Units.add(units);
            }
            return Units;
        }
        catch (Exception e){
            System.err.println("从数据库获取信息失败"+sql+e);
            return null;
        }
    }
    @Override
    public ArrayList<Units> getAllUnitsName() {
        PreparedStatement ps;
        ArrayList<Units> unitses=new ArrayList<Units>();
        String sql="select * from rec_units where rec_units.unitsID>0 ";
        try {
            ps=connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Units units=new Units(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
                unitses.add(units);
            }
            return unitses;
        }
        catch (Exception e){
            System.err.println("从数据库获取信息失败"+sql+e);
            return null;
        }
    }
    @Override
    public int getUnitsAmount() {
        PreparedStatement ps;
        String sql="select count(*)  from rec_units where rec_units.unitsID>0";
        try {
            ps=connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return 0;
        }
    }

    @Override
    public boolean isExist(String name) {
        PreparedStatement ps;
        String sql="select DISTINCT * from rec_units WHERE unitsName=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public Units getUnitsByName(String name) {

        PreparedStatement ps;
        String sql="select DISTINCT * from rec_units where unitsName=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Units units=new Units(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));

            return units;
        }
        catch (Exception e){
            System.err.println("获取信息时出现异常"+sql+e);
            return null;
        }
    }

    @Override
    public boolean deleteUnitsByName(String name) {
        PreparedStatement ps;
        String sql="delete from rec_units where unitsName=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }

    }

    @Override
    public boolean addUnits(Units units) {
        PreparedStatement ps;
        String sql="INSERT INTO rec_units(unitsname,unitsPwd,rectotal) " +
                "VALUES (?,?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, units.getUnitsName());
            ps.setString(2, units.getUnitsPwd());
            ps.setInt(3, units.getRecTotal());
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }
}
