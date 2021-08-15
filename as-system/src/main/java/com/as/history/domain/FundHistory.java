package com.as.history.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * 客户历史盈亏数据
 *
 * @author kolin
 * @date 2021-07-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class FundHistory implements Serializable {
    private static final long serialVersionUID = 1L;

    private String bizDate;
    private String customerName;
    private String source;
    private String maxTime;
    private String dep;
    private String wit;
    private String bet;
    private String win;
    private String retBet;
    private String retIn;
    private String gift;
    private String levelno;
    private String dataReg;
    private String customerWinlost;
    private String platformWinlost;
    private String sumAgentTransferIn;
    private String sumAgentTransferOut;
    private String capitalAdjustments;
    private String retOut;
    private String upperAgent;
}
