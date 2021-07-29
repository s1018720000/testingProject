package com.as.quartz.mapper;

/**
 * PF2开奖号码查询Mapper接口
 *
 * @author kolin
 * @date 2021-07-05
 */
public interface PF2DrawCompareMapper {

    public String selectPF2DrawNumber(String gameCode, String numero);

    public Integer selectPF2DrawNumberCount(String gameCode, String numero, String winNo);

}
