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
}
