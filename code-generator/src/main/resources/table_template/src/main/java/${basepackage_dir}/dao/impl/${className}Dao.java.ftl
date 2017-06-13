<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.dao.impl;

<#include "/java_imports.include">

/**
 * 
 * 数据访问对象，${comments}
 * 
 * @author lixon
 * @version 1.0
 * @since 1.0
 */
@Repository("${classNameLower}Dao")
public class ${className}Dao extends BaseMybatis3Dao<${className},${table.idColumn.javaType}> implements I${className}Dao<${className}, ${table.idColumn.javaType}>{
	
	@Override
	public String getMybatisMapperNamesapce() {
		return "${basepackage}.dao.I${className}Dao";
	}
	
	/**
	 * 持久化之前的操作
	 */
    protected void prepareObjectForSaveOrUpdate(${className} entity) {
        if(StringUtils.isBlank(entity.getId())){
            entity.setId(UUIDUtils.uuid2String());
        }
    }
	
}
