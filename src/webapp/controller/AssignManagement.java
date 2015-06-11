package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.AssignDao;
import webapp.dao.GroupDao;
import webapp.dao.impl.AssignDaoImpl;
import webapp.dao.impl.GroupDaoImpl;
import webapp.model.RecommendUnit;
import webapp.model.SubjectGroup;

import java.util.ArrayList;
/**
 * Created by zz on 2015/4/28.
 * 名额分配管理
 */
@Controller
@RequestMapping("/quotaman")
public class AssignManagement {

    AssignDao assignDao=new AssignDaoImpl();
    GroupDao groupDao=new GroupDaoImpl();

    @RequestMapping(method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPage(ModelAndView modelAndView){
        return modelAndView;
    }



    ///////////////////////////////////////////////
    //推荐单位提交名额管理
    @RequestMapping(value ="recomquota" ,method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPageUnit(ModelAndView modelAndView){
        modelAndView.setViewName("assman/unitmain");
        ArrayList<RecommendUnit> recommendUnits=assignDao.getAllRecommendUnits();
        modelAndView.addObject("recommendUnits",recommendUnits);

        return modelAndView;
    }

    @RequestMapping(value ="changequota" ,method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changeUnitQuota(ModelAndView modelAndView,String username,String quota){
        int quotaInt;
        try{
            quotaInt=Integer.parseInt(quota);
            if(!assignDao.isExist(username)){
                modelAndView.setViewName("assman/msg");
                modelAndView.addObject("message","User is not exist!");
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("assman/msg");
            modelAndView.addObject("message","Input format is not correct.");
            return modelAndView;
        }
        assignDao.changeRecommendUnitQuota(username,quotaInt);
        return getPageUnit(modelAndView);
    }

    /////////////////////////////////////
    //初评名额管理
    @RequestMapping(value ="firstquota" ,method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPageFirstQuota(ModelAndView modelAndView){
        modelAndView.setViewName("assman/firstquotamain");
        ArrayList<SubjectGroup> subjectGroups=groupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        return modelAndView;
    }

    @RequestMapping(value ="changefirstquota" ,method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changeFirstQuota(ModelAndView modelAndView,String groupname,String number){
        int numberInt;
        try{
            numberInt=Integer.parseInt(number);
            if(!groupDao.isExist(groupname)){
                modelAndView.setViewName("assman/msg");
                modelAndView.addObject("message","Groupname is not exist!");
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("assman/msg");
            modelAndView.addObject("message","Input format is not correct.");
            return modelAndView;
        }
        groupDao.changeQuotaByGroupName(groupname,numberInt);
        return getPageFirstQuota(modelAndView);
    }


    /////////////////////////////////////
    //终评名额管理
    @RequestMapping(value ="finalquota" ,method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPageFinalquota(ModelAndView modelAndView){
        modelAndView.setViewName("assman/finalquotamain");
        if(!groupDao.isExist("final"))
            groupDao.addFinalGroup();
        SubjectGroup subjectGroup=groupDao.getSubjectGroupByName("final");
        modelAndView.addObject("subjectGroup",subjectGroup);
        return modelAndView;
    }

    @RequestMapping(value ="changefinalquota" ,method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView changeFinalQuota(ModelAndView modelAndView,String number){
        int numberInt;
        try{
            numberInt=Integer.parseInt(number);
            if(!groupDao.isExist("final"))
                groupDao.addFinalGroup();
        }catch (Exception e){
            modelAndView.setViewName("assman/msg");
            modelAndView.addObject("message","Input format is not correct.");
            return modelAndView;
        }
        groupDao.changeQuotaByGroupName("final",numberInt);
        return getPageFinalquota(modelAndView);
    }
}
