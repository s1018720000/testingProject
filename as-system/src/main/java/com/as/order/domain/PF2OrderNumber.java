package com.as.order.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * PF2订单对象
 *
 * @author kolin
 * @date 2021-07-05
 */
public class PF2OrderNumber implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 订单号
     */
    private String orderNo;

    /**
     * 投注时间
     */
    private String createTime;

    /**
     * 投注IP
     */
    private String clientIp;

    /**
     * 投注模式
     */
    private String betMode;

    /**
     * 系列模式
     */
    private String series;

    /**
     * 彩种类别
     */
    private String code;

    /**
     * 投注期号
     */
    private String numero;

    /**
     * 总追号数
     */
    private String totalChasePhases;

    /**
     * 出号后放弃
     */
    private String abandoning;

    /**
     * 中奖后停止
     */
    private String winningStop;

    /**
     * 系列模式值
     */
    private String multiple;

    @NotBlank(message = "订单号不能为空")
    @Pattern(regexp = "^[a-zA-Z0-9]{2,20}$", message = "订单号不能包含特殊字符/空格/符号")
    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getClientIp() {
        return clientIp;
    }

    public void setClientIp(String clientIp) {
        this.clientIp = clientIp;
    }

    public String getBetMode() {
        return betMode;
    }

    public void setBetMode(String betMode) {
        this.betMode = betMode;
    }

    public String getSeries() {
        return series;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getTotalChasePhases() {
        return totalChasePhases;
    }

    public void setTotalChasePhases(String totalChasePhases) {
        this.totalChasePhases = totalChasePhases;
    }

    public String getAbandoning() {
        return abandoning;
    }

    public void setAbandoning(String abandoning) {
        this.abandoning = abandoning;
    }

    public String getWinningStop() {
        return winningStop;
    }

    public void setWinningStop(String winningStop) {
        this.winningStop = winningStop;
    }

    public String getMultiple() {
        return multiple;
    }

    public void setMultiple(String multiple) {
        this.multiple = multiple;
    }
}
