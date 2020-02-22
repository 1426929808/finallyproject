package com.hsl.project.controller;

import com.github.pagehelper.PageInfo;
import com.hsl.project.entity.Music;
import com.hsl.project.entity.UsersInfo;
import com.hsl.project.entity.UsersMusic;
import com.hsl.project.service.MusicService;
import com.hsl.project.service.impl.UserInfoService;
import com.hsl.project.service.impl.UsersMusicService;
import com.hsl.project.valid.UsersMusicVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/usersmusic")
public class UsersMusicController {
    public static final String FILE_DIRECTORY = "E:/project/music/";
    public static final String FILE_DIRECTORY2 = "E:/project/musicimg/";
    @Autowired
    private UsersMusicService usersMusicService;


    @Autowired
    private MusicService musicService;

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping("/myinfo")
    public String myinfo(){
        return "music/myinfo";
    }
    @RequestMapping("/insertuserinfo")
    public String myinfo(UsersInfo usersInfo) {

        //usersInfo1.setUsername((String)session.getAttribute("account"));
        userInfoService.insertusersinfo(usersInfo);

        return "redirect:/musiclist";
    }

    @RequestMapping("/usersmusiclist")
    public String usersmusiclist(@RequestParam(value = "pageNum",
            required = false, defaultValue = "1") int pageNum,
                                 @RequestParam(value = "pageSize",
                                         required = false, defaultValue = "9999") int pageSize,
                                 Model model ,HttpSession session) {
        String username = (String) session.getAttribute("account");
        if (username == null){

        }
        List<UsersMusic> usersMusics = usersMusicService.getusersmusic(pageNum, pageSize, username);
        System.out.println("username = " + username);
        PageInfo pageInfo = new PageInfo(usersMusics);
        session.setAttribute("account",username);
        model.addAttribute("usersmusiclist", pageInfo);
        return "music/usersmusiclist";
    }
    @GetMapping("/insertmusictouserslist")
    public String insertmusictouserslist(Music music,
                                         HttpSession session){
        Music music1 = musicService.selectOneById(music.getMusicid());
        UsersMusic music2 = new UsersMusic();
        //music2.setMusicid(music1.getMusicid());
        music2.setMusicname(music1.getMusicname());
        music2.setMusicstyle(music1.getMusicstyle());
        music2.setMusiclanguage(music1.getMusiclanguage());
        music2.setMusictime(music1.getMusictime());
        music2.setMusicurl(music1.getMusicurl());
        music2.setMusiccover(music1.getMusiccover());
        music2.setUsername((String)session.getAttribute("account"));
        System.out.println("music1 = " + music1);
        usersMusicService.insertmusictouserslist(music2);
        return "redirect:/musiclist";
    }

    @RequestMapping("/deleteusermusic")
    public String deleteusermusic(int musicid){
        usersMusicService.deleteusermusic(musicid);
        return "redirect:/usersmusic/usersmusiclist";
    }


    @RequestMapping("/download")
    public ResponseEntity<InputStreamSource> download(String filename) throws IOException {
        //在mac系统下pathSeparator值为: ,separator值为: /

        String fullPath = FILE_DIRECTORY + File.separator + filename;
        File file = new File(fullPath);
        //这个guess方法是依据文件名来得到媒体类型也就是mime类型,
        // 比如常见有image/jpeg,application/json
        String mediaType = URLConnection.guessContentTypeFromName(filename);
        if (mediaType == null) {
            /*识别不了时,统统用这个,一般用来表示下载二进制数据*/
            mediaType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }

        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentType(MediaType.parseMediaType(mediaType));

        //attachment :附件的意思,表示告诉浏览器弹出一个另存为窗口来下载文件,
        // inline是直接在浏览器中打开下载的文件
        //需要进行URL编码处理,否则另存为对话框不能显示中文
        respHeaders.setContentDispositionFormData("attachment",
                URLEncoder.encode(filename, "UTF-8"));


        InputStreamResource isr =
                new InputStreamResource(new FileInputStream(file));
        return new ResponseEntity<InputStreamSource>(isr, respHeaders, HttpStatus.OK);
    }

    //图片
    @RequestMapping("/download2")
    public ResponseEntity<InputStreamSource> download2(String filename) throws IOException {
        //在mac系统下pathSeparator值为: ,separator值为: /

        String fullPath = FILE_DIRECTORY2 + File.separator + filename;

        File file = new File(fullPath);
        //这个guess方法是依据文件名来得到媒体类型也就是mime类型,
        // 比如常见有image/jpeg,application/json
        String mediaType = URLConnection.guessContentTypeFromName(filename);
        if (mediaType == null) {
            /*识别不了时,统统用这个,一般用来表示下载二进制数据*/
            mediaType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }

        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentType(MediaType.parseMediaType(mediaType));

        //attachment :附件的意思,表示告诉浏览器弹出一个另存为窗口来下载文件,
        // inline是直接在浏览器中打开下载的文件
        //需要进行URL编码处理,否则另存为对话框不能显示中文
        respHeaders.setContentDispositionFormData("attachment",
                URLEncoder.encode(filename, "UTF-8"));


        InputStreamResource isr =
                new InputStreamResource(new FileInputStream(file));
        return new ResponseEntity<InputStreamSource>(isr, respHeaders, HttpStatus.OK);
    }
}
