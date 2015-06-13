package webapp.dao;

/**
 * Created by Administrator on 2015/6/13.
 */
public interface ExperienceDao {
    boolean isExist(String experience);
    boolean addExperience(int id,String experience);
    boolean deleteExperience(String experience);
}

