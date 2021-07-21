package com.as.common.constant;

/**
 * 任务调度通用常量
 * 
 * @author kolin
 */
public class ScheduleConstants
{
    public static final String TASK_CLASS_NAME = "TASK_CLASS_NAME";

    /** 执行目标key */
    public static final String TASK_PROPERTIES = "TASK_PROPERTIES";

    /** jdbc对象 */
    public static final String TASK_JDBC = "TASK_JDBC";

    /**
     * 自動比對：不比對
     */
    public static final String MATCH_NO_NEED = "0";

    /**
     * 自動比對：等於
     */
    public static final String MATCH_EQUAL = "1";

    /**
     * 自動比對：不等於
     */
    public static final String MATCH_NOT_EQUAL = "2";

    /**
     * 自動比對：大於
     */
    public static final String MATCH_GREATER = "3";

    /**
     * 自動比對：小於
     */
    public static final String MATCH_LESS = "4";

    /**
     * 自動比對：無資料
     */
    public static final String MATCH_EMPTY = "5";

    /**
     * 自動比對：有資料
     */
    public static final String MATCH_NOT_EMPTY = "6";

    public enum Status
    {
        /**
         * 正常
         */
        NORMAL("0"),
        /**
         * 暂停
         */
        PAUSE("1");

        private String value;

        private Status(String value)
        {
            this.value = value;
        }

        public String getValue()
        {
            return value;
        }
    }
}
