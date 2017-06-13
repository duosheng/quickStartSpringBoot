<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.dao;

<#include "/java_imports.include">

/**
 * 数据访问对象，${comments}
 * @author lixon
 * @version 1.0
 * @since 1.0
 */
public interface I${className}Dao<E, PK extends Serializable> extends EntityDao<E, PK> {
	

}
