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
public class PF2OrderNumberInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 玩法ID
     */
    private String playId;

    /**
     * 玩法code
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

}
