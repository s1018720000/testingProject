package com.as.order.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * PF1订单对象 lott_fc3d_order_main
 *
 * @author kolin
 * @date 2021-07-05
 */
public class PF1OrderNumber implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 订单号
     */
    private String orderNo;

    /**
     * 会员账号
     */
    private String account;

    /**
     * 追号起始号
     */
    private String restarNo;

    /**
     * 彩种ID
     */
    private String sortId;

    /**
     * 总倍数
     */
    private String totalTimes;

    /**
     * 是否追号(0为不追号,1为追号，2位预选号)
     */
    private String recall;

    /**
     * 投注系数
     */
    private String kindValue;

    /**
     * 追号期数
     */
    private String recallNum;

    /**
     * 出号后放弃
     */
    private String winQuit;

    /**
     * 中奖后停止
     */
    private String winStop;

    /**
     * 系列模式值
     */
    private String seriesValue;

    @NotBlank(message = "订单号不能为空")
    @Pattern(regexp = "^[a-zA-Z0-9]{2,20}$",message = "订单号不能包含特殊字符/空格/符号")
    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getRestarNo() {
        return restarNo;
    }

    public void setRestarNo(String restarNo) {
        this.restarNo = restarNo;
    }

    public String getSortId() {
        return sortId;
    }

    public void setSortId(String sortId) {
        this.sortId = sortId;
    }

    public String getTotalTimes() {
        return totalTimes;
    }

    public void setTotalTimes(String totalTimes) {
        this.totalTimes = totalTimes;
    }

    public String getRecall() {
        return recall;
    }

    public void setRecall(String recall) {
        this.recall = recall;
    }

    public String getKindValue() {
        return kindValue;
    }

    public void setKindValue(String kindValue) {
        this.kindValue = kindValue;
    }

    public String getRecallNum() {
        return recallNum;
    }

    public void setRecallNum(String recallNum) {
        this.recallNum = recallNum;
    }

    public String getWinQuit() {
        return winQuit;
    }

    public void setWinQuit(String winQuit) {
        this.winQuit = winQuit;
    }

    public String getWinStop() {
        return winStop;
    }

    public void setWinStop(String winStop) {
        this.winStop = winStop;
    }

    public String getSeriesValue() {
        return seriesValue;
    }

    public void setSeriesValue(String seriesValue) {
        this.seriesValue = seriesValue;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("orderNo", getOrderNo())
                .append("account", getAccount())
                .append("restarNo", getRestarNo())
                .append("sortId", getSortId())
                .append("totalTimes", getTotalTimes())
                .append("recall", getRecall())
                .append("kindValue", getKindValue())
                .append("recallNum", getRecallNum())
                .append("winQuit", getWinQuit())
                .append("winStop", getWinStop())
                .append("seriesValue", getSeriesValue())
                .toString();
    }
}
