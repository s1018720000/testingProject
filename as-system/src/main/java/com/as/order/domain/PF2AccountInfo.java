package com.as.order.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * PF2订单对象
 *
 * @author kolin
 * @date 2021-07-05
 */
public class PF2AccountInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 会员账号
     */
    private String account;

    /**
     * 订单号
     */
    private String orderNum;

    /**
     * 期号
     */
    private String numero;

    /**
     *交易类型
     */
    private String transactionType;

    /**
     * 交易金额
     */
    private String amount;

    /**
     *系列模式
     */
    private String series;

    /**
     * 返点数
     */
    private String rebate;

    /**
     * 会员级别
     */
    private String accountLevel;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getSeries() {
        return series;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public String getRebate() {
        return rebate;
    }

    public void setRebate(String rebate) {
        this.rebate = rebate;
    }

    public String getAccountLevel() {
        return accountLevel;
    }

    public void setAccountLevel(String accountLevel) {
        this.accountLevel = accountLevel;
    }
}
