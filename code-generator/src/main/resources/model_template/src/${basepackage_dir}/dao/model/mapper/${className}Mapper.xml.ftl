<#include "/macro.include"/>
<#assign className = clazz.className>
<#assign classNameFirstLower = clazz.classNameFirstLower>

<#assign boClassName = boClazz.className>
<#assign boClassNameFirstLower = boClazz.classNameFirstLower>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<#macro mapperEl value>${r"#{"}${value}}</#macro>
<#macro namespace>${className}.</#macro>

<mapper namespace="${basepackage}.dao.I${className}Dao">

    <resultMap id="${className}" type="${basepackage}.dao.model.${className}">
    <#list clazz.fields as field>
        <result property="${field.fieldName}" column="${field.sqlName}"/>
    </#list>
    </resultMap>

    <sql id="columns">
        <![CDATA[
    <#list clazz.fields as field>`${field.sqlName}`<#if field_has_next>,</#if></#list>
        ]]>
    </sql>


    <sql id="multiColumns">
        <![CDATA[
    <#list clazz.fields as field>t.`${field.sqlName}`<#if field_has_next>,</#if></#list>
        ]]>
    </sql>

    <insert id="insert">
        <![CDATA[
        INSERT INTO ${clazz.sqlName} (
    <#list clazz.fields as field>
        `${field.sqlName}` <#if field_has_next>,</#if>
    </#list>
        ) VALUES (
    <#list clazz.fields as field>
        <@mapperEl field.columnNameFirstLower/> <#if field_has_next>,</#if>
    </#list>
        )
        ]]>

    </insert>


    <!-- 按条件更新 -->
    <update id="update">
        UPDATE ${clazz.sqlName}
        <set>
        <#list clazz.notPkColumns as field>
            <if test="@Ognl@isNotEmpty(${field.columnNameFirstLower})">
            ${field.sqlName} = <@mapperEl field.columnNameFirstLower/><#if field_has_next>,</#if>
            </if>
        </#list>
        </set>
        WHERE
    <#list clazz.pkColumns as field>
        ${field.sqlName} = <@mapperEl field.columnNameFirstLower/><#if field_has_next> AND </#if>
    </#list>
    </update>


    <delete id="delete">
        <![CDATA[
        DELETE FROM ${clazz.sqlName} WHERE
    <#list clazz.pkColumns as field>
        `${field.sqlName}` = <@mapperEl 'id'/> <#if field_has_next> AND </#if>
    </#list>
        ]]>
    </delete>


    <select id="getById" resultMap="${className}">
        SELECT
        <include refid="columns"/>
        <![CDATA[
        FROM ${clazz.sqlName}
        WHERE
    <#list clazz.pkColumns as field>
        `${field.sqlName}` = <@mapperEl 'id'/> <#if field_has_next> AND </#if>
    </#list>
        ]]>
    </select>

    <sql id="findPage_where">
        <where>
        <#list clazz.fields as field>
            <#if field.isDateTimeField>
                <if test="@Ognl@isNotEmpty(${field.columnNameFirstLower}Begin)">
                    AND t.`${field.sqlName}` >= <@mapperEl field.columnNameFirstLower+"Begin"/>
                </if>
                <if test="@Ognl@isNotEmpty(${field.columnNameFirstLower}End)">
                    AND t.`${field.sqlName}` &lt;= <@mapperEl field.columnNameFirstLower+"End"/>
                </if>
            <#elseif field.isIntField && field.contains("state,status,type")>
                <if test="@Ognl@isNotEmpty(include${field.columnNameFirstUpper}List)">
                    AND  t.`${field.sqlName}` IN
                    <foreach collection="include${field.columnNameFirstUpper}List"  item="item" open="(" separator="," close=")">
                        ${r'${item}'}
                    </foreach>
                </if>
                <if test="@Ognl@isNotEmpty(exclude${field.columnNameFirstUpper}List)">
                    AND  t.`${field.sqlName}` not IN
                    <foreach collection="exclude${field.columnNameFirstUpper}List"  item="item" open="(" separator="," close=")">
                    ${r'${item}'}
                    </foreach>
                </if>
            <#else >
                <if test="@Ognl@isNotEmpty(${field.columnNameFirstLower})">
                    AND t.`${field.sqlName}` = <@mapperEl field.columnNameFirstLower/>
                </if>
            </#if>
        </#list>
        </where>
    </sql>





    <select id="findPage_count" resultType="long">
        SELECT count(*) FROM ${clazz.sqlName} t
        <include refid="findPage_where"/>
    </select>

    <select id="findPage" resultMap="${className}">
        SELECT
        <include refid="multiColumns"/>
        FROM ${clazz.sqlName} t
        <include refid="findPage_where"/>

        <if test="@Ognl@isNotEmpty(sortColumns)">
            ORDER BY <@jspEl 'sortColumns'/>
        </if>
    </select>

</mapper>

