package com.as.funds.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * PF2资金来源对象 liability_account_summary
 *
 * @author kolin
 * @date 2021-07-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PF2SourceOfFundsSummary implements Serializable {
    private static final long serialVersionUID = 1L;

    private String platform;
    private String account;
    private String totalBet;
    private String totalCgBet;
    private String totalWin;
    private String totalCgWin;
    private String totalBetReward;
    private String totalCredetAdj;
    private String totalTransfer3rdIn;
    private String totalTransfer3rdOut;
}
