package com.hsl.project.service;

import com.hsl.project.entity.Music;


import java.util.List;

public interface MusicService {
    List<Music> getAllMusic(int pageNum,int pageSize);
    void insertmusic(Music music);
    void deletemusic(int musicid);
    void updatemusic(Music music);
    Music selectOneById(int musicid);
    List<Music> getSomeMusic(String musicname);
    List<Music> getStyleMusic(String musicstyle);
}
