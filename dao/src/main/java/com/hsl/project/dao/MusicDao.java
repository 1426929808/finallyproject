package com.hsl.project.dao;

import com.hsl.project.entity.Music;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MusicDao {
    List<Music> getAllMusic(@Param("pageNum")int pageNum,
                            @Param("pageSize")int pageSize);
    void insertmusic(Music music);
    void deletemusic(@Param("musicid") int musicid);

    void updatemusic(Music music);

    Music selectOneById(@Param("musicid") int musicid);

    List<Music> getSomeMusic(@Param("musicname") String musicname);

    List<Music> getStyleMusic(@Param("musicstyle") String musicstyle);

}
