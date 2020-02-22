package com.hsl.project.controller;

import com.github.pagehelper.PageInfo;
import com.hsl.project.dao.LoginDao;
import com.hsl.project.dao.MusicDao;
import com.hsl.project.entity.Music;
import com.hsl.project.entity.Users;
import com.hsl.project.service.MusicService;
import com.hsl.project.service.impl.LoginService;
import com.hsl.project.service.impl.UsersMusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private MusicService musicService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private UsersMusicService usersMusicService;
    @GetMapping("/")
    public String login(){
        System.out.println("准备前往登录页面...");
        return "music/login";
    }
    @RequestMapping("/getallusers")
    public String getusers(@RequestParam(value = "pageNum",
            required = false,defaultValue = "1")int pageNum,
                       @RequestParam(value = "pageSize",
                               required = false,defaultValue = "4")int pageSize, Model model){
        List<Users> users = loginService.getAllUsers(pageNum,pageSize);
        PageInfo pageInfo = new PageInfo(users);
        model.addAttribute("list",pageInfo);
        return "music/useraccountlist";

    }

    @RequestMapping("/zhuce")
    public String insertUsers(){
        return "music/userzhuce";
    }

    @RequestMapping("/zhuceusers")
    public ModelAndView addusers(String username,String userpwd){
        ModelAndView modelAndView = new ModelAndView();
        String usertype ="用户";
            //先查询存不存在
            //queryOne
        Users users = loginService.selectOne(username);
            if(users == null){
                modelAndView.setViewName("music/login");
                loginService.insertusers(username,userpwd,usertype);

            }else {
                modelAndView.addObject("error","用户已存在");
                modelAndView.setViewName("music/userzhuce");
            }

            return modelAndView;


    }
    @RequestMapping("/deleteuser")
    public String deleteuser(String username){
        loginService.deleteusers(username);
        return "redirect:getallusers";
    }
    @RequestMapping("/updateuserspwd2")
    public ModelAndView updateuserspwd2(Users users2){
        Users users1 = loginService.selectOne(users2.getUsername());
        System.out.println("name = " + users1.getUsername());
        System.out.println("pwd ="+users1.getUserpwd());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("list2",users1);
        modelAndView.setViewName("music/usersupdatepwd");
        return modelAndView;
    }
    @RequestMapping("/updateuserspwd")
    public ModelAndView updateuserspwd(Users users){
     Users users1 = loginService.selectOne(users.getUsername());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("list",users1);
        modelAndView.setViewName("music/updateuserspwd");
        return modelAndView;
    }
    @RequestMapping("updatepwdtijiao")
    public String updatepwdtijiao(Users users){
        loginService.updateuserspwd(users);
        return "redirect:getallusers";
    }
    @RequestMapping("updatepwdtijiao2")
    public String updatepwdtijiao2(Users users){
        loginService.updateuserspwd(users);
        return "redirect:musiclist";
    }


        @RequestMapping("/login2")
    public ModelAndView login(String username, String userpwd, HttpServletRequest req, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
            Users users = new Users();
            System.out.println("账号："+username);
            System.out.println("userpwd = " + userpwd);
            session.setAttribute("account",username);
         users = loginService.LoginNameAndPwd(username, userpwd);
        if (users == null){
            modelAndView.addObject("error","账号/密码错误，请检查！");
            modelAndView.setViewName("music/login");
            return modelAndView;

        }else {
            String usertype2 = loginService.AccountType(username, userpwd);
            String logindiff = loginService.LoginType(usertype2,username);
            if ("管理员".equals(logindiff)){
            modelAndView.setViewName("redirect:list");
            }else {
                modelAndView.setViewName("redirect:musiclist");
            }
            return modelAndView;
        }

    }

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pageNum",
            required = false,defaultValue = "1")int pageNum,
                       @RequestParam(value = "pageSize",
                               required = false,defaultValue = "5")int pageSize, Model model){
        List<Music> music = musicService.getAllMusic(pageNum,pageSize);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("list",pageInfo);
        return "music/list";
    }

    @RequestMapping("/musiclist")
    public ModelAndView musiclist(@RequestParam(value = "pageNum",
            required = false,defaultValue = "1")int pageNum,
                       @RequestParam(value = "pageSize",
            required = false,defaultValue = "10")int pageSize
                                  ){
        ModelAndView mv = new ModelAndView();
        List<Music> music1 = musicService.getAllMusic(pageNum,pageSize);
        PageInfo pageInfo = new PageInfo(music1);
       // session.setAttribute("musiclist",pageInfo);
        mv.addObject("musiclist",pageInfo);
        mv.setViewName("music/musiclist");
        return mv;

    }
//    public String usersmuiclist(@RequestParam(value = "pageNum",
//            required = false,defaultValue = "1")int pageNum,
//                       @RequestParam(value = "pageSize",
//                               required = false,defaultValue = "3")int pageSize,
//                                Model model,String username){
//        List<UsersMusic> usersMusics = usersMusicService.getusersmusic(pageNum,pageSize,username);
//        PageInfo pageInfo = new PageInfo(usersMusics);
//        model.addAttribute("list",pageInfo);
//        return "music/usersmusiclist";
//    }
}
