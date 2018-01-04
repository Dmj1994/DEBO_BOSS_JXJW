package top.kriss.teach.entity;

import java.util.List;

public class CharpterVO {


    private List<CharpterVO> charpters;




    private String charpterName;

    public String getCharpterName() {
        return charpterName;
    }

    public void setCharpterName(String charpterName) {
        this.charpterName = charpterName;
    }

    public List<CharpterVO> getCharpters() {
        return charpters;
    }

    public void setCharpters(List<CharpterVO> charpters) {
         this.charpters = charpters;
    }

}
