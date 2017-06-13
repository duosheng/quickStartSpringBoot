<#include "/java_copyright.include">
<#assign boClassName = boClazz.className>
<#assign boClassNameLower = boClassName?uncap_first>
<#assign className = clazz.className>
<#assign classNameLower = className?uncap_first>
package ${basepackage}.service;

<#include "/java_imports.include">

/**
 * 业务处理对象：${comments}
 * @author lixon
 * @version 1.0
 * @since 1.0
 */
public interface I${boClassName}Manager extends IBaseBoManager<${boClassName}, ${boClazz.idColumn.javaType},${className}>{


}
