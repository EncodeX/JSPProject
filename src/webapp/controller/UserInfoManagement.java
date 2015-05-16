package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.ExpertDao;
import webapp.dao.impl.ExpertDaoImpl;
import webapp.model.Expert;

import java.util.ArrayList;
import java.util.Vector;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/userinfo")
public class UserInfoManagement {
    ExpertDao ExpertDao=new ExpertDaoImpl();
    String messageTitle="";
    String messageEntity="";
    @RequestMapping(value = "main",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getMainPage(ModelAndView modelAndView,String page){
        int pages;
        if(page==null){
            pages=1;
        }else{
            pages=Integer.parseInt(page);
        }
        modelAndView.setViewName("userinfo/main");
        ArrayList<Expert> experts=ExpertDao.getAllExperts(pages,10);
        if(ExpertDao.getExpertAmount()==0) {
            modelAndView.addObject("message", "目前还没有评审专家信息！");
        }else {
            modelAndView.addObject("experts", experts);
            modelAndView.addObject("pages", pages);
            modelAndView.addObject("amount", ExpertDao.getExpertAmount());
        }
        return modelAndView;
    }
    @RequestMapping(value = "addExpert",method =RequestMethod.GET)
    public ModelAndView addExpert(ModelAndView modelAndView) {
        modelAndView.setViewName("/userinfo/addExpert");
        return modelAndView;
    }
    @RequestMapping(value = "addExpertToDB",method =RequestMethod.POST)
    public ModelAndView addExpertToDB(ModelAndView modelAndView,String expName,String expPwd,
                                      String expPwd2,String groID) {
        modelAndView.setViewName("userinfo/main");
        String message="";
        try{
            if(expPwd!=expPwd2){
                message="您两次输入的密码不一致";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
            if(!ExpertDao.isExist(expName)){
                ExpertDao.addExpert(expName, expPwd, Integer.parseInt(groID));
            }else{
                message="该用户已存在！";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("sbjman/msg");
            message="添加失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getMainPage(modelAndView,"1");
    }
    @RequestMapping(value = "changeExpert",method =RequestMethod.GET)
    public ModelAndView changeExpert(ModelAndView modelAndView) {
        modelAndView.setViewName("/userinfo/changeExpert");
        return modelAndView;
    }
    @RequestMapping(value = "updateExpertToDB",method =RequestMethod.POST)
    public ModelAndView updateExpertToDB(ModelAndView modelAndView,String exOldname,String expName,String expPwd,
                                      String expPwd2,String groID) {
        modelAndView.setViewName("userinfo/main");
        String message="";
        try{
            if(expPwd!=expPwd2){
                message="您修改时两次输入的密码不一致";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
            if(!ExpertDao.isExist(expName)){
                ExpertDao.addExpert(expName, expPwd, Integer.parseInt(groID));
            }else{
                message="该用户名已存在！";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("sbjman/msg");
            message="添加失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getMainPage(modelAndView,"1");
    }
    @RequestMapping(value = "deleteExpert",method = {RequestMethod.GET})
    public ModelAndView deleteExpert(ModelAndView modelAndView,String expName){
        if(!ExpertDao.isExist(expName)){
            modelAndView.setViewName("userinfo/main");
            modelAndView.addObject("message","该用户名不存在 :"+expName);
            return modelAndView;
        }
        ExpertDao.deleteExpert(expName);
        return getMainPage(modelAndView,"1");
    }
    //Group
    @RequestMapping(value = "addGroup",method =RequestMethod.POST)
    public ModelAndView setGroup(ModelAndView modelAndView) {
        modelAndView.setViewName("/userinfo/main");
        modelAndView.addObject("ischange", true);
        //判断所输入的信息是否合法
        return modelAndView;
    }


}
