package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.ExpertDao;
import webapp.dao.GroupDao;
import webapp.dao.ProposerDao;
import webapp.dao.VoteDao;
import webapp.dao.impl.ExpertDaoImpl;
import webapp.dao.impl.GroupDaoImpl;
import webapp.dao.impl.ProposerDaoImpl;
import webapp.dao.impl.VoteDaoImpl;
import webapp.model.Expert;
import webapp.model.Proposer;
import webapp.model.SubjectGroup;

import java.util.ArrayList;
/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/voteman")
public class VoteManagement {

    GroupDao groupDao=new GroupDaoImpl();
    ExpertDao expertDao=new ExpertDaoImpl();
    VoteDao voteDao=new VoteDaoImpl();
    ProposerDao proposerDao=new ProposerDaoImpl();

    @RequestMapping(method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPage(ModelAndView modelAndView){
        return modelAndView;
    }

    @RequestMapping(value = "/provote")
    public ModelAndView provote (ModelAndView modelAndView,
                                 @RequestParam(value = "group",required = false)String group){
        //group-->null
        //get all subject groups
        ArrayList<SubjectGroup> subjectGroups=groupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        //get all expert int this subject group
        ArrayList<Expert> experts;
        if(subjectGroups==null||subjectGroups.size()==0)
            experts=null;
        else {

            int alreadyVote;
            int limitVote;
            if (group == null)
                group = subjectGroups.get(0).getGroName();
            experts=expertDao.getAllExpertsByGroupId(groupDao.getSubjectGroupByName(group).getGroID(),0);
            alreadyVote=groupDao.getAlreadyVoteByGroupName(group);
            limitVote=groupDao.getSubjectGroupByName(group).getSubNum();
            modelAndView.addObject("alreadyVote",alreadyVote);
            modelAndView.addObject("limitVote",limitVote);
            modelAndView.addObject("group",group);
        }
        modelAndView.addObject("experts",experts);
        modelAndView.setViewName("/voteman/provote");
        return modelAndView;
    }


    @RequestMapping(value = "/provoteViewDetail",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView provoteViewDetail(ModelAndView modelAndView,int expertId){
        //TODO provoteViewDetail
        modelAndView.setViewName("/voteman/provotedetail");
        ArrayList<Proposer> proposers=proposerDao.getProposerByExpertID(expertId);
        modelAndView.addObject("proposers",proposers);
        Expert expert=expertDao.getExpertByExpertID(expertId);
        modelAndView.addObject("expert",expert);
        return modelAndView;
    }

    @RequestMapping(value = "/provoteVoteReset",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView provoteVoteReset(ModelAndView modelAndView,int expertId,String group){
        //delete things in table vote and change in proposer recResult 1->0
        voteDao.deleteAllVoteByExpertID(expertId);
        return provote(modelAndView,group);
    }

    @RequestMapping(value = "/councilvote")
    public ModelAndView councilvote (ModelAndView modelAndView,
                                     @RequestParam(value = "search",required = false)String search){
        ArrayList<Proposer> proposers=proposerDao.getProposerBySearchName(search);
        SubjectGroup subjectGroup=groupDao.getSubjectGroupByName("final");
        int limitVote=subjectGroup.getSubNum();
        int alreadVote=proposerDao.getAmountOfLastResult();
        modelAndView.addObject("limitVote",limitVote);
        modelAndView.addObject("alreadVote",alreadVote);
        modelAndView.addObject("proposers",proposers);
        modelAndView.addObject("search",search);
        modelAndView.setViewName("/voteman/councilvote");
        return modelAndView;
    }

    @RequestMapping(value = "/councilvoteadd")
    public ModelAndView councilvoteadd (ModelAndView modelAndView,int userid,
                                     @RequestParam(value = "search",required = false)String search){
        proposerDao.changeLastResult(userid,1);
        return councilvote(modelAndView,search);
    }

    @RequestMapping(value = "/councilvotedelete")
    public ModelAndView councilvotedelete (ModelAndView modelAndView,int userid,
                                     @RequestParam(value = "search",required = false)String search){
        proposerDao.changeLastResult(userid,0);
        return councilvote(modelAndView,search);
    }
}
