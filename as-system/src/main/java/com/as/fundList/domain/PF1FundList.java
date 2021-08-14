package com.as.fundList.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * PF1资金对账对象 lott_accounts_bill
 *
 * @author kolin
 * @date 2021-07-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PF1FundList implements Serializable {
    private static final long serialVersionUID = 1L;

    private String constantId;
    private String constantName;
    private String today;
    private String week;
    private String dweek;
}
