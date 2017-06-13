<#include "/java_copyright.include">
<#assign boClassName = boClazz.className>
<#assign boClassNameLower = boClassName?uncap_first>
<#assign className = clazz.className>
<#assign classNameLower = className?uncap_first>
package ${basepackage}.service.impl;

<#include "/java_imports.include">

/**
* 业务处理对象：${comments}
* @author lixon
* @version 1.0
* @since 1.0
*/
@Service("${boClassNameLower}Manager")
@Transactional
public class ${boClassName}Manager extends BaseBoManager<${boClassName}, ${boClazz.idColumn.javaType},${className}> implements I${boClassName}Manager {

    @Autowired
    @Qualifier(value = "${classNameLower}Dao")
    private I${className}Dao ${classNameLower}Dao;

    public IEntityDao getEntityDao() {
        return this.${classNameLower}Dao;
    }

    public ${boClassName} po2bo(${className} po) {
        if (po == null) return null;
        ${boClassName} to = new ${boClassName}();
        <#list clazz.allColumns as field>
        to.set${field.columnNameFirstUpper}(po.get${field.columnNameFirstUpper}());
        </#list>
        return to;
    }

    public ${className} bo2po(${boClassName} bo) {
        if (bo == null) return null;
        ${className} to = new ${className}();
        <@generateSetFields/>
        return to;
    }

}

<#macro generateSetFields>
        <#list clazz.allColumns as field>
        to.set${field.columnNameFirstUpper}(bo.get${field.columnNameFirstUpper}());
        </#list>
</#macro>

