package com.as.quartz.util;

import com.as.common.utils.DateUtils;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Excel工具类
 *
 * @author kolin
 */
public class ExcelUtil {

    private static ExcelUtil instance = null; // 单例对象

    /**
     * 私有化构造方法
     * <p>
     * 文件对象
     */
    private ExcelUtil() {
        super();
    }

    /**
     * 获取单例对象并进行初始化
     * <p>
     * 文件对象
     *
     * @return 返回初始化后的单例对象
     */
    public static ExcelUtil getInstance() {
        if (instance == null) {
            // 当单例对象为null时进入同步代码块
            synchronized (ExcelUtil.class) {
                // 再次判断单例对象是否为null，防止多线程访问时多次生成对象
                if (instance == null) {
                    instance = new ExcelUtil();
                }
            }
        } else {

        }
        return instance;
    }

    /**
     * 写入数据到指定excel文件中
     *
     * @param rowSet 数据类型
     * @throws Exception
     */
    public void writeExcel(File file, SqlRowSet rowSet) throws Exception {
        XSSFWorkbook workbook = null;
        // 检测文件是否存在，如果存在则修改文件，否则创建文件
        if (file.exists()) {
            FileInputStream fis = new FileInputStream(file);
            workbook = new XSSFWorkbook(fis);
        } else {
            workbook = new XSSFWorkbook();
        }
        // 根据当前工作表数量创建相应编号的工作表
        String sheetName = DateUtils.dateTimeNow(DateUtils.YYYYMMDDHHMMSSSS);
        XSSFSheet sheet = workbook.createSheet(sheetName);
        //sheet.setDefaultColumnWidth((short)80);
        XSSFRow headRow = sheet.createRow(0);
        // 添加表格标题
        String[] titles = rowSet.getMetaData().getColumnNames();
        for (int i = 0; i < titles.length; i++) {
            XSSFCell cell = headRow.createCell(i);

            cell.setCellType(CellType.STRING);
            cell.setCellValue(titles[i]);
            // 设置字体加粗
            XSSFCellStyle cellStyle = workbook.createCellStyle();
            XSSFFont font = workbook.createFont();

            font.setBold(true);
            font.setColor(IndexedColors.WHITE.getIndex());
            cellStyle.setFont(font);

            cellStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
            cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            // 设置自动换行
            cellStyle.setWrapText(true);
            cell.setCellStyle(cellStyle);
            // 设置单元格宽度
            sheet.setColumnWidth(i, titles[i].length() * 1000);
        }


        Object obj = null;
        String field = "";
        int i = 1;
        while (rowSet.next()) {
            XSSFRow row = sheet.createRow(i);

            for (int j = 0; j < titles.length; j++) {
                obj = rowSet.getObject(titles[j]);
                XSSFCell cell = row.createCell(j);

                if (obj instanceof String) {
                    field = obj.toString();
                    //cellFormat = getCellFormat(12, false, false, Alignment.CENTRE);
                } else if (obj instanceof Date) {
                    field = DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, (Date) obj);
                    //cellFormat = getCellFormat(12, false, false, Alignment.CENTRE);
                } else if (obj instanceof Boolean) {
                    field = ((Boolean) obj).toString();
                    //cellFormat = getCellFormat(12, false, false, Alignment.CENTRE);
                } else if (obj instanceof BigDecimal) {
                    field = obj.toString();
                    //cellFormat = getCellFormat(12, false, false, Alignment.RIGHT);
                } else if (obj == null) {
                    field = "";
                    //cellFormat = getCellFormat(12, false, false, Alignment.LEFT);
                } else {
                    field = obj.toString();
                }

                cell.setCellValue(field);


                // 如果是日期类型则进行格式化处理
                //if (isDateType(clazz, fieldName)) {
                //    cell.setCellValue(DateUtil.format((Date) result));
                //}
            }
            i++;
        }
        // 添加表格内容

        // 将数据写到磁盘上
        FileOutputStream fos = new FileOutputStream(file);
        try {
            workbook.write(new FileOutputStream(file));
        } finally {
            if (fos != null) {
                fos.close(); // 不管是否有异常发生都关闭文件输出流
            }
        }
    }

}
