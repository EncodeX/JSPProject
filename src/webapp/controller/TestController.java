package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/")
public class TestController {

    @RequestMapping(value = "index",method = {RequestMethod.GET})
    public ModelAndView test(ModelAndView modelAndView){
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping(value = "login",method = {RequestMethod.POST})
    public ModelAndView login(ModelAndView modelAndView,String username,String password){
        if(username==null){
	        modelAndView.setViewName("main/main");
            return modelAndView;
        }
        if(username.trim().equals("admin")&&password.trim().equals("admin")){
            modelAndView.setViewName("main/main");
        }else{
            modelAndView.setViewName("login");
            modelAndView.addObject("message","密码错误");
        }
        return modelAndView;
    }

    @RequestMapping(value = "mainindex",method = {RequestMethod.GET})
    public ModelAndView backToMain(ModelAndView modelAndView,String username,String password){
        modelAndView.setViewName("main/maincontent");
        return modelAndView;
    }

}
