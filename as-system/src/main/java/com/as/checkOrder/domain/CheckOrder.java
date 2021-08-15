package com.as.checkOrder.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 多平台订单比对对象
 *
 * @author kolin
 * @date 2021-07-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class CheckOrder implements Serializable {
    private static final long serialVersionUID = 1L;

    private String platform;
    private String accounts;
    private String orderTimeNormal;
    private String orderTimeAbnormal;
    private String withdrawTimeNormal;
    private String withdrawTimeAbnormal;
}
