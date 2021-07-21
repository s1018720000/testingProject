package com.as.order.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * PF2订单对象
 *
 * @author kolin
 * @date 2021-07-05
 */
public class PF2OrderNumberInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 玩法ID
     */
    private String playId;

    /**
     *玩法code
     */
    private String playCode;

    /**
     * 玩法名称
     */
    private String playName;

    /**
     * 投注内容
     */
    private String betContent;


    public String getPlayId() {
        return playId;
    }

    public void setPlayId(String playId) {
        this.playId = playId;
    }

    public String getPlayCode() {
        return playCode;
    }

    public void setPlayCode(String playCode) {
        this.playCode = playCode;
    }

    public String getPlayName() {
        return playName;
    }

    public void setPlayName(String playName) {
        this.playName = playName;
    }

    public String getBetContent() {
        return betContent;
    }

    public void setBetContent(String betContent) {
        this.betContent = betContent;
    }
}
