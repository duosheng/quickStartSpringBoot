package com.code.test;

import cn.org.rapid_framework.generator.GeneratorFacade;
import cn.org.rapid_framework.generator.GeneratorProperties;

/**
 * Created by xuyuli on 2016/11/20.
 * 代码生成器，基于数据库的表生成
 */
public class GenCodeByTable {


    /**
     * 请直接修改以下代码调用不同的方法以执行相关生成任务.
     */
    public static void main(String[] args) throws Exception {
        GeneratorFacade g = new GeneratorFacade();

        // System.setProperty("generator.includes","*/java_src/*,*/java_test/*");
        // System.setProperty("generator.excludes","*/flex_src/*,*/some_demo/*,*/web/*");

        GeneratorProperties.setProperty("comments", "测试生成代码");

        // g.printAllTableNames(); //打印数据库中的表名称
        // g.deleteOutRootDir(); //删除生成器的输出目录

        //通过数据库表生成文件,template为模板的根目录  代码生成，以及代码删除
         g.generateByTable("msg","code-generator/src/main/resources/table_template");
        g.deleteByTable("msg","code-generator/src/main/resources/table_template");
         //cn/org/rapid_framework/generator/util/binary_filelist.txt
//         g.deleteByTable("msg","table_template");
//        g.generateByTable("in_reposity", "E:\\soouya_code\\code-generator2\\generator\\template"); // 通过数据库表生成文件,template为模板的根目录

        // g.generateByAllTable("template"); //自动搜索数据库中的所有表并生成文件,template为模板的根目录
    }
}
