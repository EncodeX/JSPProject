package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.ExpertDao;
import webapp.dao.impl.ExpertDaoImpl;

import java.sql.Timestamp;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/userinfo")
public class UserInfoManagement {
    ExpertDao ExpertDao=new ExpertDaoImpl();

    @RequestMapping(value = "main",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getMainPage(ModelAndView modelAndView){
        modelAndView.setViewName("userinfo/main");
        iniExpertDateToModelAndView(modelAndView);
        modelAndView.addObject("ischange",false);
        return modelAndView;
    }
    private void iniExpertDateToModelAndView(ModelAndView modelAndView){

    }

}
