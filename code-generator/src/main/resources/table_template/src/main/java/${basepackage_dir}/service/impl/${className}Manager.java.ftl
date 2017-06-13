<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.service.impl;

<#include "/java_imports.include">

/**
 * 业务处理对象：${comments}
 * @author lixon
 * @version 1.0
 * @since 1.0
 */
@Service("${classNameLower}Manager")
@Transactional
public class ${className}Manager extends BaseManager<${className},${table.idColumn.javaType}> implements I${className}Manager<${className}, ${table.idColumn.javaType}> {

    @Autowired
    @Qualifier(value = "${classNameLower}Dao")
	private I${className}Dao ${classNameLower}Dao;

	public EntityDao getEntityDao() {
		return this.${classNameLower}Dao;
	}
	

}
