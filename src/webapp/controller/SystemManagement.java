package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
        addAllTimeAndDateToModelAndView(modelAndView);
        modelAndView.addObject("ischange",false);

        return modelAndView;
    }

    @RequestMapping(value = "settime/{type}",method = RequestMethod.POST)
    public ModelAndView setOpenAndEndTime(ModelAndView modelAndView,@PathVariable("type")String type,
                                          String startdate,String starttime,String enddate,String endtime){
        System.out.print(type);
        modelAndView.setViewName("/sysman/main");
        modelAndView.addObject("ischange",true);
        String messageTitle="";
        String messageEntity="";
        Timestamp openTimestamp=new Timestamp(0);
        Timestamp endTimestamp=new Timestamp(0);
        try{
            openTimestamp.setYear(Integer.parseInt(startdate.split("-")[0])-1900);
            openTimestamp.setMonth(Integer.parseInt(startdate.split("-")[1])-1);
            openTimestamp.setDate(Integer.parseInt(startdate.split("-")[2]));
            openTimestamp.setHours(Integer.parseInt(starttime.split(":")[0]));
            openTimestamp.setMinutes(Integer.parseInt(starttime.split(":")[1]));
            openTimestamp.setSeconds(0);

            endTimestamp.setYear(Integer.parseInt(enddate.split("-")[0])-1900);
            endTimestamp.setMonth(Integer.parseInt(enddate.split("-")[1])-1);
            endTimestamp.setDate(Integer.parseInt(enddate.split("-")[2]));
            endTimestamp.setHours(Integer.parseInt(endtime.split(":")[0]));
            endTimestamp.setMinutes(Integer.parseInt(endtime.split(":")[1]));
            endTimestamp.setSeconds(0);
        }catch (Exception e){
            messageTitle="错误的输入格式";
            messageEntity="请检查日期是否输入正确";
            modelAndView.addObject("messageTitle", messageTitle);
            modelAndView.addObject("messageEntity",messageEntity);
            addAllTimeAndDateToModelAndView(modelAndView);
            return modelAndView;
        }

        if(openTimestamp.after(endTimestamp)){
            messageTitle = "更新失败";
            messageEntity = "系统开启时间大于系统关闭时间!";
        }else if(type.trim().equals("proposer")||type.trim().equals("expert")||type.trim().equals("recunits")) {
            boolean success = openTimeDao.setOpenAndEndTime(type, openTimestamp, endTimestamp);
            if (success) {
                messageTitle = "更新成功";
                messageEntity = "您已经更新了开启和关闭系统的时间";
            }else{
                messageTitle = "更新失败";
                messageEntity = "请联系管理员.请检查数据库中是否有对应的条目信息";
            }
        }else{
            messageTitle = "更新失败";
            messageEntity = "您的处理请求是非法的访问地址!";
        }

        modelAndView.addObject("messageTitle", messageTitle);
        modelAndView.addObject("messageEntity", messageEntity);
        addAllTimeAndDateToModelAndView(modelAndView);
        return modelAndView;
    }


    private void addAllTimeAndDateToModelAndView(ModelAndView modelAndView){
        Timestamp proposerOpenTime=openTimeDao.getOpenTimeByType("proposer");
        Timestamp expertOpenTime=openTimeDao.getOpenTimeByType("expert");
        Timestamp recunitsOpenTime=openTimeDao.getOpenTimeByType("recunits");
        Timestamp proposerEndTime=openTimeDao.getEndTimeByType("proposer");
        Timestamp expertEndTime=openTimeDao.getEndTimeByType("expert");
        Timestamp recunitsEndTime=openTimeDao.getEndTimeByType("recunits");

        modelAndView.addObject("proposerOpenTime",proposerOpenTime);
        modelAndView.addObject("expertOpenTime",expertOpenTime);
        modelAndView.addObject("recunitsOpenTime",recunitsOpenTime);
        modelAndView.addObject("proposerEndTime",proposerEndTime);
        modelAndView.addObject("expertEndTime",expertEndTime);
        modelAndView.addObject("recunitsEndTime",recunitsEndTime);
    }


}
