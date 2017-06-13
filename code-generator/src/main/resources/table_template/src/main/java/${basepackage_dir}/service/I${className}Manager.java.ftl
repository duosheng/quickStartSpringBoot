<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.service;

<#include "/java_imports.include">

/**
 * 业务处理对象：${comments}
 * @author lixon
 * @version 1.0
 * @since 1.0
 */
public interface I${className}Manager <E, PK extends Serializable> extends IBaseManager<E, PK>{


}
