package com.code.test;

import cn.org.rapid_framework.generator.GeneratorFacade;
import cn.org.rapid_framework.generator.GeneratorProperties;
import com.code.test.test.ButtonNumber;
import com.code.test.test.ButtonNumberBo;

/**
 * Created by xuyuli on 2016/11/20.
 * 代码生成器，基于bo，po的javabean生成
 */
public class GenCodeByBo {


    /**
     * 请直接修改以下代码调用不同的方法以执行相关生成任务.
     */
    public static void main(String[] args) throws Exception {
        GeneratorFacade g = new GeneratorFacade();

        // System.setProperty("generator.includes","*/java_src/*,*/java_test/*");
        // System.setProperty("generator.excludes","*/flex_src/*,*/some_demo/*,*/web/*");

        GeneratorProperties.setProperty("comments", "扣数单");

        // g.printAllTableNames(); //打印数据库中的表名称
        // g.deleteOutRootDir(); //删除生成器的输出目录

//         g.deleteByTable("order_process","template");
         g.generateByTable("test_user","template-table");
        // //通过数据库表生成文件,template为模板的根目录
//        g.generateByTable("in_reposity", "E:\\soouya_code\\code-generator2\\generator\\template"); // 通过数据库表生成文件,template为模板的根目录

        // g.generateByAllTable("template"); //自动搜索数据库中的所有表并生成文件,template为模板的根目录
//        g.generateByClass(ClothLoneBak.class,"E:\\soouya_code\\code-generator2\\generator\\model_template");
//        g.generateByClass(ClothLoneBak.class,ClothLoneBakBo.class,"E:\\soouya_code\\soouya_code_generator\\model_template");


        g.generateByClass(ButtonNumber.class,ButtonNumberBo.class,"/datas/xuyuli/redwood/code-generator-xu/model_template");
//        g.generateByClass(ButtonNumberDetail.class,ButtonNumberDetailBo.class,"/datas/xuyuli/redwood/code-generator-xu/model_template");
//        g.deleteByClass(BizSystem.class,BizSystemBo.class,"/datas/xuyuli/redwood/code-generator-xu/model_template");
//        g.generateByClass(Test.class,TestBo.class,"/datas/xuyuli/redwood/code-generator-xu/model_template");
//        g.deleteByClass(Test.class,TestBo.class,"/datas/xuyuli/redwood/code-generator-xu/model_template");
//        g.generateByClass(Seed.class,SeedBo.class,"/datas/xuyuli/redwood/code-generator-xu/model_template");
//        g.deleteByClass(InReposityBak.class,InReposityBakBo.class,"E:\\soouya_code\\soouya_code_generator\\model_template");
//        g.deleteByClass(ClothLoneBak.class,ClothLoneBakBo.class,"E:\\soouya_code\\soouya_code_generator\\model_template"); //删除生成的文件
//         Runtime.getRuntime().exec("cmd.exe /c start
        // "+GeneratorProperties.getRequiredProperty("outRoot"));
    }
}
