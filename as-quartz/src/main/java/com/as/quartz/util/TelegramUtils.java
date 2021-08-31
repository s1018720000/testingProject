package com.as.quartz.util;

import com.as.common.constant.DictTypeConstants;
import com.as.common.core.domain.entity.SysDictData;
import com.as.common.utils.DictUtils;
import com.as.common.utils.StringUtils;
import com.pengrad.telegrambot.TelegramBot;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Component
public class TelegramUtils {

    public static Map<String, TelegramBot> telegramBotMap = new HashMap<>();

    public static Map<String, String> chatIdMap = new HashMap<>();

    @PostConstruct
    private void initTelegram() {
        doCreate();
    }

    public static void updateTelegram() {
        telegramBotMap.clear();
        chatIdMap.clear();
        doCreate();
    }

    private static void doCreate() {
        List<SysDictData> dictCache = DictUtils.getDictCache(DictTypeConstants.TELEGRAM_NOTICE_GROUP);
        if (StringUtils.isNotNull(dictCache)) {
            for (SysDictData telegramData : dictCache) {
                String config = telegramData.getRemark();
                String[] tgData = config.split(";");
                if (tgData.length == 2) {
                    telegramBotMap.put(telegramData.getDictValue(), new TelegramBot.Builder(tgData[0]).okHttpClient(OkHttpUtils.getInstance()).build());
                    chatIdMap.put(telegramData.getDictValue(), tgData[1]);
                }
            }
        }
    }
}
