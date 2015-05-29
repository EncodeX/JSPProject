package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.ExpertDao;
import webapp.dao.GroupDao;
import webapp.dao.ProposerDao;
import webapp.dao.ResUnitsDao;
import webapp.dao.impl.ExpertDaoImpl;
import webapp.dao.impl.GroupDaoImpl;
import webapp.dao.impl.ProposerDaoImpl;
import webapp.dao.impl.ResUnitsDaoImpl;
import webapp.model.Expert;
import webapp.model.Proposer;
import webapp.model.SubjectGroup;
import webapp.model.Units;

import java.util.ArrayList;
import java.util.Vector;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/userinfo")
public class UserInfoManagement {
    ExpertDao ExpertDao=new ExpertDaoImpl();
    ResUnitsDao ResUnitsDao=new ResUnitsDaoImpl();
    ProposerDao ProposerDao=new ProposerDaoImpl();
    //Expert
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
        modelAndView.addObject("experts", experts);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("amount", ExpertDao.getExpertAmount());
        return modelAndView;
    }
    @RequestMapping(value = "addExpert",method =RequestMethod.GET)
    public ModelAndView addExpert(ModelAndView modelAndView) {
        modelAndView.setViewName("/userinfo/addExpert");
        modelAndView.addObject("status","0");
        return modelAndView;
    }
    @RequestMapping(value = "addCouncil",method =RequestMethod.GET)
    public ModelAndView addCouncil(ModelAndView modelAndView) {
        modelAndView.setViewName("/userinfo/addExpert");
        modelAndView.addObject("status","1");
        return modelAndView;
    }
    @RequestMapping(value = "addExpertToDB",method =RequestMethod.POST)
    public ModelAndView addExpertToDB(ModelAndView modelAndView,String expName,String expPwd,
                                      String expPwd2,String groID,String status) {
        modelAndView.setViewName("userinfo/main");
        String message="";
        try{
            if(Integer.parseInt(expPwd)!=Integer.parseInt(expPwd2)){
                message="您两次输入的密码不一致";
                modelAndView.setViewName("userinfo/error");
                modelAndView.addObject("message", message);
                return modelAndView;
            }
            if(!ExpertDao.isExist(expName)){
                ExpertDao.addExpert(expName, expPwd, Integer.parseInt(groID),Integer.parseInt(status));
            }else{
                message="该用户已存在！";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("userinfo/error");
            message="添加失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getMainPage(modelAndView,"1");
    }
    @RequestMapping(value = "changeExpert",method =RequestMethod.GET)
    public ModelAndView changeExpert(ModelAndView modelAndView,String name) {
        Expert expert=ExpertDao.getExpertByName(name);
        modelAndView.addObject(expert);
        modelAndView.setViewName("/userinfo/changeExpert");
        return modelAndView;
    }
    @RequestMapping(value = "updateExpertToDB",method =RequestMethod.POST)
    public ModelAndView updateExpertToDB(ModelAndView modelAndView,String exOldname,String expName,String expPwd,
                                      String expPwd2,String groID,String status) {
        modelAndView.setViewName("userinfo/main");
        String message="";
        try{
            if(Integer.parseInt(expPwd)!=Integer.parseInt(expPwd2)){
                message="您修改时两次输入的密码不一致";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
            ExpertDao.deleteExpert(exOldname);
            if(!ExpertDao.isExist(expName)){
                ExpertDao.addExpert(expName, expPwd, Integer.parseInt(groID),Integer.parseInt(status));
            }else{
                modelAndView.setViewName("userinfo/error");
                message="该用户名已存在！";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("userinfo/error");
            message="添加失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getMainPage(modelAndView,"1");
    }
    @RequestMapping(value = "deleteExpert",method = RequestMethod.GET)
    public ModelAndView deleteExpert(ModelAndView modelAndView,String name){
        if(!ExpertDao.isExist(name)){
            modelAndView.setViewName("userinfo/main");
            modelAndView.addObject("message","该用户名不存在!");
            return modelAndView;
        }
        ExpertDao.deleteExpert(name);
        return getMainPage(modelAndView,"1");
    }
    //Untis
    @RequestMapping(value = "resUnitsMain",method = {RequestMethod.GET})
    public ModelAndView getResUnitsMainPage(ModelAndView modelAndView,String page){
        int intpage;
        if(page==null){
            intpage=1;
        }else{
            intpage=Integer.parseInt(page);
        }
        modelAndView.setViewName("userinfo/resUnitsMain");
        ArrayList<Units> Units=ResUnitsDao.getAllUnits(intpage, 10);
        modelAndView.addObject("Units",Units);
        modelAndView.addObject("amount", ResUnitsDao.getUnitsAmount());
        modelAndView.addObject("pages", intpage);
        return modelAndView;
    }
    @RequestMapping(value = "addUnits",method =RequestMethod.GET)
    public ModelAndView addUnits(ModelAndView modelAndView) {
        modelAndView.setViewName("userinfo/addUnits");
        return modelAndView;
    }
    @RequestMapping(value = "addUnitsToDB",method =RequestMethod.POST)
    public ModelAndView addUntisToDB(ModelAndView modelAndView,String unitName,String unitPwd,String unitPwd2,String unitTotal) {
        modelAndView.setViewName("userinfo/resUnitsMain");
        String message="";
        try{
            if(Integer.parseInt(unitPwd)!=Integer.parseInt(unitPwd2)){
                message="您两次输入的密码不一致";
                modelAndView.setViewName("userinfo/error");
                modelAndView.addObject("message", message);
                return modelAndView;
            }
            if(!ResUnitsDao.isExist(unitName)){
                Units unit=new Units(0,unitName,unitPwd,Integer.parseInt(unitTotal));
                ResUnitsDao.addUnits(unit);
            }else{
                modelAndView.setViewName("userinfo/error");
                message="该用户已经存在！";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("userinfo/error");
            message="增加失败: "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getResUnitsMainPage(modelAndView, "1");
    }
    @RequestMapping(value = "changeUnits",method =RequestMethod.GET)
    public ModelAndView changeUnits(ModelAndView modelAndView,String name) {
        Units units=ResUnitsDao.getUnitsByName(name);
        modelAndView.addObject(units);
        modelAndView.setViewName("/userinfo/changeUnits");
        return modelAndView;
    }
    @RequestMapping(value = "updateUnitsToDB",method = RequestMethod.POST)
    public ModelAndView updateUnitsToDB(ModelAndView modelAndView,String unitName,String unitPwd,String unitPwd2,String unitTotal,String oldname){
        modelAndView.setViewName("userinfo/resUnitsMain");
        String message="";
        try{
            if(Integer.parseInt(unitPwd)!=Integer.parseInt(unitPwd2)){
                message="您两次输入的密码不一致";
                modelAndView.setViewName("userinfo/error");
                modelAndView.addObject("message", message);
                return modelAndView;
            }
            Units unit=new Units(0,unitName,unitPwd,Integer.parseInt(unitTotal));
            ResUnitsDao.deleteUnitsByName(oldname);
            ResUnitsDao.addUnits(unit);
        }catch (Exception e){
            modelAndView.setViewName("userinfo/error");
            message="更改失败！ "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getResUnitsMainPage(modelAndView, "1");
    }
    @RequestMapping(value = "deleteUnits",method = {RequestMethod.GET})
    public ModelAndView deleteUnits(ModelAndView modelAndView,String name){
        if(!ResUnitsDao.isExist(name)){
            modelAndView.setViewName("userinfo/error");
            modelAndView.addObject("message","该用户名不存在 :"+name);
            return modelAndView;
        }
        ResUnitsDao.deleteUnitsByName(name);
        return getResUnitsMainPage(modelAndView,"1");
    }
    //proposer
    @RequestMapping(value = "proposerMain",method = {RequestMethod.GET})
    public ModelAndView getProposerMainPage(ModelAndView modelAndView,String page){
        int intpage;
        if(page==null){
            intpage=1;
        }else{
            intpage=Integer.parseInt(page);
        }
        modelAndView.setViewName("userinfo/proposerMain");
        ArrayList<Proposer> proposers=ProposerDao.getAllProposer(intpage, 10);
        modelAndView.addObject("proposers",proposers);
        modelAndView.addObject("amount", ProposerDao.getProposerAmount());
        modelAndView.addObject("pages", intpage);
        return modelAndView;
    }
    @RequestMapping(value = "changeProposer",method =RequestMethod.GET)
    public ModelAndView changeProposer(ModelAndView modelAndView,String name) {
        Proposer proposer=ProposerDao.getProposerByName(name);
        modelAndView.addObject(proposer);
        modelAndView.setViewName("/userinfo/changeProposer");
        return modelAndView;
    }
    @RequestMapping(value = "updateProposerToDB",method =RequestMethod.POST)
    public ModelAndView updateProposerToDB(ModelAndView modelAndView,String oldname,String userName,String userID,
                                         String name,String subClass,String subID,String recID,String recResult,
                                           String firCount,String firResult,String lasResult,String userPwd,String userPwd2) {
        modelAndView.setViewName("userinfo/proposerMain");
        String message="";
        try{
            if(Integer.parseInt(userPwd)!=Integer.parseInt(userPwd2)){
                message="您修改时两次输入的密码不一致";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
            Proposer proposer=new Proposer(0,userName,userPwd,name,subClass,Integer.parseInt(subID),Integer.parseInt(recID),Integer.parseInt(recResult),Integer.parseInt(firCount),Integer.parseInt(firResult),Integer.parseInt(lasResult));
            ProposerDao.deleteProposerByName(oldname);
            ProposerDao.addProposer(proposer);
        }catch (Exception e){
            modelAndView.setViewName("userinfo/error");
            message="添加失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getProposerMainPage(modelAndView, "1");
    }
    @RequestMapping(value = "deleteProposer",method = RequestMethod.GET)
    public ModelAndView deleteProposer(ModelAndView modelAndView,String name){
        if(!ProposerDao.isExist(name)){
            modelAndView.setViewName("userinfo/error");
            modelAndView.addObject("message","该用户名不存在!");
            return modelAndView;
        }
        ProposerDao.deleteProposerByName(name);
        return getProposerMainPage(modelAndView, "1");
    }
}
