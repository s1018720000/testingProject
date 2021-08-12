package com.as.funds.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * PF1资金来源对象 liability_account_summary
 *
 * @author kolin
 * @date 2021-07-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PF1SourceOfFunds implements Serializable {
    private static final long serialVersionUID = 1L;

    private String bizDate;
    private String account;
    private String platform;
    private String sumOpening;
    private String sumClosing;
    private String sumBet;      // SUM_BET 投注;
    private String sumCgBet;    // SUM_CG_BET 老虎機投注
    private String sumWin;      // SUM_WIN 中獎
    private String sumCgWin;    // SUM_CG_WIN 老虎機中獎
    private String sumDeposit;
    private String sum3rdPayDeposit;
    private String sumWithdraw;
    private String sumRetBet;   //返點
    private String promoActive;
    private String promoAdhoc;
    private String sumPfTranIn;  // 平台轉入
    private String sumPfTranOut; // 平台轉出
    private String sumComp;
    private String adjCredit;    // CREDIT_ADJ 充正
    private String adjDebit;
    private String sumBankFess;
    private String sumJackpotWin;
    private String sumTranIn;    // 老虎機平台轉入
    private String sumTranOut;   // 老虎機平台轉出
    private String sumRetAgent;
    private String sumAgentTransferIn;
    private String sumAgentTransferOut;
}
