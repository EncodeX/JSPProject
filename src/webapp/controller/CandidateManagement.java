package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.GroupDao;
import webapp.dao.ProposerDao;
import webapp.dao.impl.GroupDaoImpl;
import webapp.dao.impl.ProposerDaoImpl;
import webapp.model.Proposer;
import webapp.model.SubjectGroup;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/candman")
public class CandidateManagement {
    ProposerDao ProposerDao=new ProposerDaoImpl();
    GroupDao GroupDao=new GroupDaoImpl();
    //sbjman
    @RequestMapping(value = "subclass",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPage(ModelAndView modelAndView,String page,String subClass){
        int pages;
        if(page==null){
            pages=1;
        }else{
            pages=Integer.parseInt(page);
        }
        modelAndView.setViewName("/candman/sbjman");
        ArrayList<Proposer> allproposers=ProposerDao.getAllProposer();
        ArrayList<Proposer> subproposers=ProposerDao.getProposersBySubClass(pages, 10, subClass);
        ArrayList<SubjectGroup> subjectGroups=GroupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        modelAndView.addObject("allproposers", allproposers);
        modelAndView.addObject("proposers", subproposers);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("amount", ProposerDao.getProposerAmountBySubClass(subClass));
        modelAndView.addObject("url", "subclass");
        modelAndView.addObject("subClass",subClass);
        return modelAndView;
    }

    @RequestMapping(value = "/sbjman",method = RequestMethod.GET)
    public ModelAndView getSbjmanPage(ModelAndView modelAndView,String page,String url){
        int pages;
        if(page==null){
            pages=1;
        }else{
            pages=Integer.parseInt(page);
        }
        if(url==null){
            url="sbjman";
        }
        modelAndView.setViewName("/candman/sbjman");
        ArrayList<Proposer> allproposers=ProposerDao.getAllProposer();
        ArrayList<Proposer> subproposers=ProposerDao.getAllProposer(pages, 10);
        ArrayList<SubjectGroup> subjectGroups=GroupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        modelAndView.addObject("allproposers", allproposers);
        modelAndView.addObject("proposers", subproposers);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("amount", ProposerDao.getProposerAmount());
        modelAndView.addObject("url", url);
        return modelAndView;
    }
    @RequestMapping(value = "/changeSubject",method ={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView  changeSubject(ModelAndView modelAndView, String groName,String userName,String page,String url){
        SubjectGroup subjectGroup=GroupDao.getSubjectGroupByName(groName);
        ProposerDao.changeSubID(userName, subjectGroup.getGroID());
        return this.getSbjmanPage(modelAndView,page,url);
    }


    //firstresult
    @RequestMapping(value = "/firstresult",method = RequestMethod.GET)
    public ModelAndView getFirstResult (ModelAndView modelAndView,String page){
        int pages;
        if(page==null){
            pages=1;
        }else{
            pages=Integer.parseInt(page);
        }
        modelAndView.setViewName("/candman/firstresult");
        ArrayList<Proposer> subproposers=ProposerDao.getAllProposer();
        ArrayList<SubjectGroup> subjectGroups=GroupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        modelAndView.addObject("proposers", subproposers);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("amount", ProposerDao.getProposerAmount());
        modelAndView.addObject("subID", "0");
        return modelAndView;
    }

    @RequestMapping(value = "/addProposer",method = RequestMethod.GET)
    public ModelAndView addProposer (ModelAndView modelAndView){
        modelAndView.setViewName("/candman/addProposer");
        return modelAndView;
    }

    @RequestMapping(value = "/addProposerToDB",method = RequestMethod.POST)
    public ModelAndView addProposerToDB(ModelAndView modelAndView,String userName,String userID,
                                           String name,String subClass,String subID,String recID,String recResult,
                                           String firCount,String firResult,String lasResult,String userPwd) {
        modelAndView.setViewName("candman/firstresult");
        String message="";
        try{
            Proposer proposer=new Proposer(0,userName,userPwd,name,subClass,Integer.parseInt(subID),Integer.parseInt(recID),Integer.parseInt(recResult),Integer.parseInt(firCount),Integer.parseInt(firResult),Integer.parseInt(lasResult));
            ProposerDao.addProposer(proposer);
        }catch (Exception e){
            modelAndView.setViewName("candman/error");
            message="添加失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getFirstResult(modelAndView,"1");
    }
    @RequestMapping(value = "/deleteProposer",method = RequestMethod.GET)
    public ModelAndView deleteProposer (ModelAndView modelAndView,String name){
        modelAndView.setViewName("candman/firstresult");
        String message="";
        try {
            ProposerDao.deleteProposerByName(name);
        }catch (Exception e){
            modelAndView.setViewName("candman/error");
            message="删除失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }

        return getFirstResult(modelAndView,"1");
    }

    @RequestMapping(value = "firstresultsubclass",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getfirstresultsubclass(ModelAndView modelAndView,String page,String groID){
        int pages;
        if(page==null){
            pages=1;
        }else{
            pages=Integer.parseInt(page);
        }
        modelAndView.setViewName("/candman/firstresult");
        ArrayList<Proposer> subproposers=ProposerDao.getProposersBySubID(pages, 10, Integer.parseInt(groID));
        ArrayList<SubjectGroup> subjectGroups=GroupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        modelAndView.addObject("proposers", subproposers);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("amount", ProposerDao.getProposerAmountBySubID(Integer.parseInt(groID)));
        //modelAndView.addObject("url", "subclass");
        modelAndView.addObject("subID", groID);
        return modelAndView;
    }
    @RequestMapping(value = "userIDOrder",method = {RequestMethod.GET})
    public ModelAndView getProposerByUserIDOrder(ModelAndView modelAndView,String page,String subID,String order){
        int pages;
        ArrayList<Proposer> subproposers;
        if(page==null){
            pages=1;
        }else{
            pages=Integer.parseInt(page);
        }
        modelAndView.setViewName("/candman/firstresult");
        if(Integer.parseInt(subID)!=0) {
            subproposers = ProposerDao.getProposersBySubID(pages, 10, Integer.parseInt(subID));
        }
        else{
            subproposers = ProposerDao.getAllProposer(pages,10);
        }
        ArrayList<SubjectGroup> subjectGroups=GroupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        modelAndView.addObject("proposers", subproposers);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("amount", ProposerDao.getProposerAmountBySubID(Integer.parseInt(subID)));
        //modelAndView.addObject("url", "subclass");
        modelAndView.addObject("subID",subID);
        modelAndView.addObject("order", "userID");
        return modelAndView;
    }
    @RequestMapping(value = "usernameOrder",method = {RequestMethod.GET})
    public ModelAndView getProposerByUsernameOrder(ModelAndView modelAndView,String page,String subID,String order){
        ArrayList<Proposer> subproposers;
        if(order==null){
            order="username";
        }
        if(Integer.parseInt(subID)!=0) {
            subproposers = ProposerDao.getAllBySubID(Integer.parseInt(subID));
        } else{
            subproposers = ProposerDao.getAllProposer();
        }
        Collections.sort(subproposers, new CompareUsername());
        return getProposerOrder(modelAndView,page,subID,subproposers,order);
    }

    @RequestMapping(value = "nameOrder",method = {RequestMethod.GET})
    public ModelAndView getProposerByNameOrder(ModelAndView modelAndView,String page,String subID,String order){
        ArrayList<Proposer> subproposers;
        if(order==null){
            order="name";
        }
        if(Integer.parseInt(subID)!=0) {
            subproposers = ProposerDao.getAllBySubID(Integer.parseInt(subID));
        }
        else{
            subproposers = ProposerDao.getAllProposer();
        }
        Collections.sort(subproposers, new CompareName());
        return getProposerOrder(modelAndView, page, subID, subproposers, order);
    }
    @RequestMapping(value = "recOrder",method = {RequestMethod.GET})
    public ModelAndView getProposerByRecOrder(ModelAndView modelAndView,String page,String subID,String order){
        ArrayList<Proposer> subproposers;
        if(order==null){
            order="rec";
        }
        if(Integer.parseInt(subID)!=0) {
            subproposers = ProposerDao.getAllBySubID(Integer.parseInt(subID));
        }
        else{
            subproposers = ProposerDao.getAllProposer();
        }
        Collections.sort(subproposers, new CompareRecID());
        return getProposerOrder(modelAndView, page, subID, subproposers, order);
    }
    @RequestMapping(value = "fircountOrder",method = {RequestMethod.GET})
    public ModelAndView getProposerByFircountOrder(ModelAndView modelAndView,String page,String subID,String order){
        ArrayList<Proposer> subproposers;
        if(order==null){
            order="fircount";
        }
        if(Integer.parseInt(subID)!=0) {
            subproposers = ProposerDao.getAllBySubID(Integer.parseInt(subID));
        }
        else{
            subproposers = ProposerDao.getAllProposer();
        }
        Collections.sort(subproposers, new CompareFircount());
        return getProposerOrder(modelAndView, page, subID, subproposers, order);
    }

    @RequestMapping(value = "nextPage",method = {RequestMethod.GET})
    public ModelAndView getNextPage(ModelAndView modelAndView,String page,String subID,String order){
        modelAndView.setViewName("/candman/firstresult");
        if(Integer.parseInt(subID)==0){
            return getFirstResult(modelAndView,page);
        }
        else {
            if (order == null) {order = "userID";}
            if (order.equals("userID")) {return getProposerByUserIDOrder(modelAndView,page,subID,order);}
            if (order.equals("username")) {return getProposerByUsernameOrder(modelAndView,page,subID,order);}
            if (order.equals("name")) {return getProposerByNameOrder(modelAndView,page,subID,order);}
            if (order.equals("rec")) {return getProposerByRecOrder(modelAndView, page, subID,order);}
            if (order.equals("fircount")) {return getProposerByFircountOrder(modelAndView, page, subID,order);}
        }
        return getFirstResult(modelAndView, page);
    }
    //finalresult
    @RequestMapping(value = "/finalresult",method = RequestMethod.GET)
    public ModelAndView finalresult (ModelAndView modelAndView,String page){
        int pages;
        if(page==null){
            pages=1;
        }else{
            pages=Integer.parseInt(page);
        }
        modelAndView.setViewName("/candman/finalresult");
        ArrayList<Proposer> allproposers=ProposerDao.getAllByLasResult();
        ArrayList<Proposer> proposers=ProposerDao.getProposersByLasResult(pages, 10);
        modelAndView.addObject("allproposers", allproposers);
        modelAndView.addObject("proposers",proposers);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("amount", allproposers.size());
        return modelAndView;
    }
    @RequestMapping(value = "changeProposer",method = {RequestMethod.GET})
    public ModelAndView changeProposer(ModelAndView modelAndView,String username){
        modelAndView.setViewName("/candman/changeProposer");
        Proposer proposer=ProposerDao.getProposerByName(username);
        modelAndView.addObject("proposer",proposer);
        return modelAndView;
    }
    @RequestMapping(value = "updateProposerToDB",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView updateProposerToDB(ModelAndView modelAndView,String oldName,String userName,String userID,
                                           String name,String subClass,String subID,String recID,String recResult,
                                           String firCount,String firResult,String lasResult,String userPwd){
        //modelAndView.setViewName("candman/finalresult");
        String message="";
        try{
            System.out.println("0");
            ProposerDao.deleteProposerByName(oldName);
            Proposer proposer=new Proposer(0,userName,userPwd,name,subClass,Integer.parseInt(subID),Integer.parseInt(recID),Integer.parseInt(recResult),Integer.parseInt(firCount),Integer.parseInt(firResult),Integer.parseInt(lasResult));
            System.out.println("1");
            ProposerDao.addProposer(proposer);
            System.out.println("2");
            return finalresult(modelAndView,"1");
        }catch (Exception e){
            modelAndView.setViewName("candman/error");
            message="修改失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }

    }
    public ModelAndView getProposerOrder(ModelAndView modelAndView,String page,String subID,ArrayList<Proposer> subproposers,String order){
        int pages,max;
        if(page==null){
            pages=1;
        }else{
            pages=Integer.parseInt(page);
        }
        modelAndView.setViewName("/candman/firstresult");
        ArrayList<Proposer> subProposers=new ArrayList<Proposer>();
        if(subproposers.size()<10){
            max=subproposers.size();
        }else{
            max=10;
        }
        for(int i=(pages-1)*10;i<max;i++){
            Proposer  proposer=subproposers.get(i);
            subProposers.add(proposer);
        }
        ArrayList<SubjectGroup> subjectGroups=GroupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        modelAndView.addObject("proposers", subProposers);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("amount", ProposerDao.getProposerAmountBySubID(Integer.parseInt(subID)));
        modelAndView.addObject("subID", subID);
        modelAndView.addObject("order",order);
        return modelAndView;
    }

    class CompareUsername implements Comparator<Proposer> {
        public int compare(Proposer p1, Proposer p2) {
            try {
                // 取得比较对象的汉字编码，并将其转换成字符串
                String s1 = new String(p1.getUserName().getBytes("UTF-8"), "ISO-8859-1");
                String s2 = new String(p2.getUserName().getBytes("UTF-8"), "ISO-8859-1");
                // 运用String类的 compareTo（）方法对两对象进行比较
                return s1.compareTo(s2);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return 0;
        }
    }
    class CompareName implements Comparator<Proposer> {
        public int compare(Proposer p1, Proposer p2) {
            try {
                // 取得比较对象的汉字编码，并将其转换成字符串
                String s1 = new String(p1.getName().getBytes("UTF-8"), "ISO-8859-1");
                String s2 = new String(p2.getName().getBytes("UTF-8"), "ISO-8859-1");
                // 运用String类的 compareTo（）方法对两对象进行比较
                return s1.compareTo(s2);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return 0;
        }
    }
    class CompareRecID implements Comparator<Proposer> {
        public int compare(Proposer p1, Proposer p2) {
            try {
                int r1 = p1.getRecID();
                int r2 = p2.getRecID();
                if(r1>r2){
                    return 1;
                }else if(r1<r2){
                    return -1;
                }else{
                    return 0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return 0;
        }
    }
    class CompareFircount implements Comparator<Proposer> {
        public int compare(Proposer p1, Proposer p2) {
            try {
                int r1 = p1.getFirCount();
                int r2 = p2.getFirCount();
                if(r1>r2){
                    return 1;
                }else if(r1<r2){
                    return -1;
                }else{
                    return 0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return 0;
        }
    }
}
