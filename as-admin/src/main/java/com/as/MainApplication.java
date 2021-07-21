package com.as;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author kolin
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class MainApplication {
    public static void main(String[] args) {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(MainApplication.class, args);
        System.out.println(
                "     ___   _____        _____   _____   _____    _____       ___   _               \n" +
                "    /   | /  ___/      |  _  \\ /  _  \\ |  _  \\  |_   _|     /   | | |           \n" +
                "   / /| | | |___       | |_| | | | | | | |_| |    | |      / /| | | |              \n" +
                "  / /-| | \\___  \\      |  ___/ | | | | |  _  /    | |     / /-| | | |            \n" +
                " / /——| |  ___| |      | |     | |_| | | | \\ \\    | |    / /——| | | |___         \n" +
                "/_/   |_| /_____/      |_|     \\_____/ |_|  \\_\\   |_|   /_/   |_| |_____|        ");
    }
}