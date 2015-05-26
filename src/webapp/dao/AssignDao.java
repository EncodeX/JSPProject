package webapp.dao;

import webapp.model.RecommendUnit;

import java.util.*;
/**
 * Created by zz on 2015/5/23.
 */
public interface AssignDao {
    ArrayList<RecommendUnit> getAllRecommendUnits();
    RecommendUnit getRecommendUnitByName(String name);
    boolean isExist(String name);
    boolean changeRecommendUnitQuota(String name,int quota);
}
