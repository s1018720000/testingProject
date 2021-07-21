package com.as.order.domain;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * PF2订单对象
 *
 * @author kolin
 * @date 2021-07-05
 */
public class PF2OrderNumberDetail implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 投注倍数
     */
    private String multiple;

    /**
     * 投注金额
     */
    private String betAmount;

    /**
     * 开奖号码
     */
    private String winningNumber;

    /**
     * 中奖金额
     */
    private String winAmount;

    public String getMultiple() {
        return multiple;
    }

    public void setMultiple(String multiple) {
        this.multiple = multiple;
    }

    public String getBetAmount() {
        return betAmount;
    }

    public void setBetAmount(String betAmount) {
        this.betAmount = betAmount;
    }

    public String getWinningNumber() {
        return winningNumber;
    }

    public void setWinningNumber(String winningNumber) {
        this.winningNumber = winningNumber;
    }

    public String getWinAmount() {
        return winAmount;
    }

    public void setWinAmount(String winAmount) {
        this.winAmount = winAmount;
    }
}
