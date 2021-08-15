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
public class OdsCheckOrder implements Serializable {
    private static final long serialVersionUID = 1L;

    private String sumType;
    private String pf1sum7;
    private String pf1sum15;
    private String pf1sum30;
    private String pf1sum60;
    private String pf2sum7;
    private String pf2sum15;
    private String pf2sum30;
    private String pf2sum60;
}
