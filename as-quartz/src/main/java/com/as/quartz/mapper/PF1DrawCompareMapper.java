package com.as.quartz.mapper;


/**
 * PF1开奖号码查询Mapper接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface PF1DrawCompareMapper {

    public String selectPF1DrawNumber(String gameCode, String numero);

    public Integer selectPF1DrawNumberCount(String gameCode, String numero, String winNo);

}
