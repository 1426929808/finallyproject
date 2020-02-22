package com.hsl.project.service.impl;


import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;

import java.io.File;

public class GetAudioPlayTime {
    public static String getAudioPlayTime(File source) {
        Encoder encoder = new Encoder();
        long ls = 0;
        try {
            MultimediaInfo m = encoder.getInfo(source);
            ls = m.getDuration();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("此视频时长为:" + ls / 60000 + "分" + (ls%60000) / 1000 + "秒！");
        return ls / 60000 + "分" + (ls%60000) / 1000 + "秒！";
    }
}
