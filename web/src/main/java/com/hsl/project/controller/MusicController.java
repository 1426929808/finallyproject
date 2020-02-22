package com.hsl.project.controller;

import com.github.pagehelper.PageInfo;
import com.hsl.project.entity.Music;
import com.hsl.project.entity.UsersMusic;
import com.hsl.project.service.MusicService;
import com.hsl.project.service.impl.UsersMusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/music")
public class MusicController {

    public static final String FILE_DIRECTORY = "E:/project/music/";
    public static final String FILE_DIRECTORY2 = "E:/project/musicimg/";
    @Autowired
    private MusicService musicService;

    @Autowired
    private UsersMusicService usersmusicService;
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
    @GetMapping("/add")
    public String add(){
        return "/music/addmusic";
    }

    /**
     * MultipartFile这个参数名对应jsp控件的name
     * Music的url是String类型，推荐不要跟jsp的name一样，会出现类型转化异常
     *
     * @param music
     * @param bindingResult
     * @param myfilemusic
     * @param myfileimg
     * @return
     */
    @PostMapping("/insert")
    public String insert(@Valid Music music,
                         BindingResult bindingResult,
                         MultipartFile myfilemusic,MultipartFile myfileimg) {
        if(bindingResult.hasErrors()){
            return "/music/addmusic";
        }
        //得到上传过来的文件名,一般要改名,比如用UUID
        //File.separator \ E:\im\
        //E:/im/
        //??
        String filename = myfilemusic.getOriginalFilename();
        String path = FILE_DIRECTORY  + filename;
        File file = new File(path);

        String filename2 = myfileimg.getOriginalFilename();
        String path2 = FILE_DIRECTORY2 + filename2;
        File file2 = new File(path2);
        try {
            if(!file.exists()){
                myfilemusic.transferTo(file);
            }
            if(!file2.exists()) {
                myfileimg.transferTo(file2);
            }
        } catch (IOException e) {
            throw new RuntimeException("文件重复了",e);
        }
        //myfilemusic.getOriginalFilename()得到1.jpg
        music.setMusicurl(myfilemusic.getOriginalFilename());
        music.setMusiccover(myfileimg.getOriginalFilename());
        musicService.insertmusic(music);
        return "redirect:/music/list";
    }
    @RequestMapping("/delete")
    public String delete(String musicid){
        Integer mid = 0;
        if (musicid != null && musicid != "") {
            mid = Integer.valueOf(musicid);
        }
        musicService.deletemusic(mid);
        return "redirect:/music/list";
    }
    @RequestMapping("/update")
    public ModelAndView update(Music music){
        Music music1 = musicService.selectOneById(music.getMusicid());
        System.out.println("-----debug: music = " + music);
        ModelAndView mv = new ModelAndView();
        mv.addObject("list",music1);
        mv.setViewName("/music/updatemusic");
        return mv;
    }
    @RequestMapping("/useresongstsomemusic")
    public String getsommusic3(String musicname,Model model){
        List<UsersMusic> music = usersmusicService.getsomemusic(musicname);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("usersmusiclist",pageInfo);
        return "music/usersmusiclist";
    }
    @RequestMapping("/useretsomemusic")
    public String getsommusic2(String musicname,Model model){
        List<Music> music = musicService.getSomeMusic(musicname);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("musiclist",pageInfo);
        return "music/musiclist";
    }

    @RequestMapping("/guanliyuangetsomemusic")
    public String getsommusic(String musicname,Model model){
        List<Music> music = musicService.getSomeMusic(musicname);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("list",pageInfo);
        return "music/list";
    }

    @RequestMapping("/getliuxingmusic")
    public String getliuxingmusic(Model model){
        String musicstyle="流行";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("list",pageInfo);
        return "music/list";
    }
    @RequestMapping("/getomeimusic")
    public String getomeimusic(Model model){
        String musicstyle="欧美";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("list",pageInfo);
        return "music/list";
    }
    @RequestMapping("/getmingyaomusic")
    public String getmingyaomusic(Model model){
        String musicstyle="民谣";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("list",pageInfo);
        return "music/list";
    }
    @RequestMapping("/getyaogunmusic")
    public String getyaogunmusic(Model model){
        String musicstyle="摇滚";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("list",pageInfo);
        return "music/list";
    }
    @RequestMapping("/getchunmusic")
    public String getchunmusic(Model model){
        String musicstyle="纯音乐";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("list",pageInfo);
        return "music/list";
    }
    @RequestMapping("/getliuxingmusic2")
    public String getliuxingmusic2(Model model){
        String musicstyle="流行";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("musiclist",pageInfo);
        return "music/musiclist";
    }
    @RequestMapping("/getomeimusic2")
    public String getomeimusic2(Model model){
        String musicstyle="欧美";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("musiclist",pageInfo);
        return "music/musiclist";
    }
    @RequestMapping("/getmingyaomusic2")
    public String getmingyaomusic2(Model model){
        String musicstyle="民谣";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("musiclist",pageInfo);
        return "music/musiclist";
    }
    @RequestMapping("/getyaogunmusic2")
    public String getyaogunmusic2(Model model){
        String musicstyle="摇滚";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("musiclist",pageInfo);
        return "music/musiclist";
    }
    @RequestMapping("/getchunmusic2")
    public String getchunmusic2(Model model){
        String musicstyle="纯音乐";
        List<Music> music = musicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("musiclist",pageInfo);
        return "music/musiclist";
    }
    @RequestMapping("/getliuxingmusic3")
    public String getliuxingmusic3(Model model){
        String musicstyle="流行";
        List<UsersMusic> music = usersmusicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("usersmusiclist",pageInfo);
        return "music/usersmusiclist";
    }
    @RequestMapping("/getomeimusic3")
    public String getomeimusic3(Model model){
        String musicstyle="欧美";
        List<UsersMusic> music = usersmusicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("usersmusiclist",pageInfo);
        return "music/usersmusiclist";
    }
    @RequestMapping("/getmingyaomusic3")
    public String getmingyaomusic3(Model model){
        String musicstyle="民谣";
        List<UsersMusic> music = usersmusicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("usersmusiclist",pageInfo);
        return "music/usersmusiclist";
    }
    @RequestMapping("/getyaogunmusic3")
    public String getyaogunmusi3(Model model){
        String musicstyle="摇滚";
        List<UsersMusic> music = usersmusicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("usersmusiclist",pageInfo);
        return "music/usersmusiclist";
    }
    @RequestMapping("/getchunmusic3")
    public String getchunmusic3(Model model){
        String musicstyle="纯音乐";
        List<UsersMusic> music = usersmusicService.getStyleMusic(musicstyle);
        PageInfo pageInfo = new PageInfo(music);
        model.addAttribute("usersmusiclist",pageInfo);
        return "music/usersmusiclist";
    }
    @RequestMapping("/updatetijiao")
    public String updatetijiao(Music music,MultipartFile myfilemusic,MultipartFile myfileimg){
        String filename = myfilemusic.getOriginalFilename();
        String path = FILE_DIRECTORY  + filename;
        File file = new File(path);

        String filename2 = myfileimg.getOriginalFilename();
        String path2 = FILE_DIRECTORY2 + filename2;
        File file2 = new File(path2);
        try {
            if(!file.exists()){
                myfilemusic.transferTo(file);
            }
            if(!file2.exists()) {
                myfileimg.transferTo(file2);
            }
        } catch (IOException e) {
            throw new RuntimeException("文件重复了",e);
        }
        //myfilemusic.getOriginalFilename()得到1.jpg
        music.setMusicurl(myfilemusic.getOriginalFilename());
        music.setMusiccover(myfileimg.getOriginalFilename());
        musicService.updatemusic(music);
        return "redirect:/music/list";
    }

    //歌曲
    @RequestMapping("/download")
    public ResponseEntity<InputStreamSource> download(String filename) throws IOException {
        //在mac系统下pathSeparator值为: ,separator值为: /

        String fullPath = FILE_DIRECTORY + File.separator + filename;
        File file = new File(fullPath);
        //这个guess方法是依据文件名来得到媒体类型也就是mime类型,
        // 比如常见有image/jpeg,application/json
        String mediaType = URLConnection.guessContentTypeFromName(filename);
        if(mediaType==null) {
            /*识别不了时,统统用这个,一般用来表示下载二进制数据*/
            mediaType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }

        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentType(MediaType.parseMediaType(mediaType));

        //attachment :附件的意思,表示告诉浏览器弹出一个另存为窗口来下载文件,
        // inline是直接在浏览器中打开下载的文件
        //需要进行URL编码处理,否则另存为对话框不能显示中文
        respHeaders.setContentDispositionFormData("attachment",
                URLEncoder.encode(filename,"UTF-8"));


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
        if(mediaType==null) {
            /*识别不了时,统统用这个,一般用来表示下载二进制数据*/
            mediaType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }

        HttpHeaders respHeaders = new HttpHeaders();
        respHeaders.setContentType(MediaType.parseMediaType(mediaType));

        //attachment :附件的意思,表示告诉浏览器弹出一个另存为窗口来下载文件,
        // inline是直接在浏览器中打开下载的文件
        //需要进行URL编码处理,否则另存为对话框不能显示中文
        respHeaders.setContentDispositionFormData("attachment",
                URLEncoder.encode(filename,"UTF-8"));


        InputStreamResource isr =
                new InputStreamResource(new FileInputStream(file));
        return new ResponseEntity<InputStreamSource>(isr, respHeaders, HttpStatus.OK);
    }



}
