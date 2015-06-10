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
    @Override
    public int showProposerNum() {
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps=connection.prepareStatement("select COUNT(*) as num from  proposer WHERE userId");
            rs = ps.executeQuery();
            rs.next();

            return rs.getInt("num");
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]ResUnitsDaoImpl int showProposerNum ERROR.");
            return Integer.parseInt(null);
        }
    }

    @Override
    public ArrayList<Units> getAllUnitsinfo() {
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<Units> unit_Users=new ArrayList<Units>();
        try {
            ps = connection.prepareStatement("SELECTs * from rec_units");
            rs = ps.executeQuery();
            while (rs.next()) {
                Units us = new Units( rs.getInt("unitsID"),rs.getString("unitsName"), rs.getInt("recTotal"));
                unit_Users.add(us);
            }
            return (unit_Users);
        }
        catch(Exception ex){
            System.err.println("[DB ERROR]ResUnitsDaoImpl ArrayList<Units> getAllUnitsinfo() ERROR.");
            return null;
        }
    }

    @Override
    public ArrayList<Proposer> searchInfoByUnitsName(String unitsName) {
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<Proposer> unit_Users= new ArrayList();
        try {
            ps = connection.prepareStatement("SELECT * from proposer where subClass=?");
            ps.setString(1, unitsName);
            rs = ps.executeQuery();
            while (rs.next()) {
                Proposer us;
                us = new Proposer(rs.getString("subClass"), rs.getInt("userID"), rs.getString("name"));
                unit_Users.add(us);
            }
            return (unit_Users);
        }
            catch(Exception ex){
                System.err.println("[DB ERROR]ResUnitsDaoImpl ArrayList<User> searchInfoByUnitsName ERROR.");
                return null;
            }



    }

    @Override
    public ArrayList<Proposer> searchInfoByUnitsId(int unitsID) {
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<Proposer> unit_Users=new ArrayList<Proposer>();
        try {
            ps = connection.prepareStatement("SELECT * from proposer where subID=?");
            ps.setInt(1, unitsID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Proposer us = new Proposer(rs.getString("subClass"), rs.getInt("userID"), rs.getString("name"));
                unit_Users.add(us);
            }
            return (unit_Users);
        }
        catch(Exception ex){
            System.err.println("[DB ERROR]ResUnitsDaoImpl ArrayList<User> searchInfoByUnitsID ERROR.");
            return null;
        }



    }

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
            ps.setString(1,name);
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
