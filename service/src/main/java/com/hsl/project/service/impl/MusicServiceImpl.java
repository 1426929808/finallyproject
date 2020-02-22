package com.hsl.project.service.impl;

import com.hsl.project.dao.MusicDao;
import com.hsl.project.entity.Music;
import com.hsl.project.service.MusicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class MusicServiceImpl implements MusicService {
    @Autowired
    private MusicDao musicDao;
    @Transactional
    public List<Music> getAllMusic(int pageNum, int pageSize) {
        return musicDao.getAllMusic(pageNum,pageSize);
    }

    public void insertmusic(Music music) {
         musicDao.insertmusic(music);
    }

    public void deletemusic(int musicid) {
        musicDao.deletemusic(musicid);
    }
    public void updatemusic(Music music) {
//        musicDao.updatemusic(musicname,musicstyle,musiclanguage,musictime,
//                musicurl,musiccover,musicid);
        musicDao.updatemusic(music);

    }

    public Music selectOneById(int musicid) {
      return   musicDao.selectOneById(musicid);
    }
    public List<Music> getSomeMusic(String musicname){
        return musicDao.getSomeMusic(musicname);
    }
    public List<Music> getStyleMusic(String musicstyle){
        return musicDao.getStyleMusic(musicstyle);
    }
}
