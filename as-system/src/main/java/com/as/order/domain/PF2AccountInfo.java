package com.as.order.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * PF2订单对象
 *
 * @author kolin
 * @date 2021-07-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
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
     * 交易类型
     */
    private String transactionType;

    /**
     * 交易金额
     */
    private String amount;

    /**
     * 系列模式
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
}
