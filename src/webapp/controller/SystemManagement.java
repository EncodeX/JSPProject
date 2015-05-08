package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.OpenTimeDao;
import webapp.dao.impl.OpenTimeDaoImpl;

import java.sql.Timestamp;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/sysman")
public class SystemManagement {

    OpenTimeDao openTimeDao=new OpenTimeDaoImpl();

    @RequestMapping(value = "main",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getMainPage(ModelAndView modelAndView){
        modelAndView.setViewName("sysman/main");
        Timestamp proposerOpenTime=openTimeDao.getOpenTimeByType("proposer");
        Timestamp expertOpenTime=openTimeDao.getOpenTimeByType("expert");
        Timestamp recunitsOpenTime=openTimeDao.getOpenTimeByType("recunits");
        Timestamp proposerEndTime=openTimeDao.getEndTimeByType("proposer");
        Timestamp expertEndTime=openTimeDao.getEndTimeByType("expert");
        Timestamp recunitsEndTime=openTimeDao.getEndTimeByType("recunits");

        return modelAndView;
    }


}
