<#include "/java_copyright.include">
<#assign className = clazz.className>
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.dao.impl;

<#include "/java_imports.include">

/**
 * 
 * 数据访问对象，${comments}
 * 
 * @author xuyuli
 * @version 1.0
 * @since 1.0
 */
@Repository("${classNameLower}Dao")
public class ${className}Dao extends Mybatis3Dao<${className}, ${clazz.idColumn.javaType}> implements I${className}Dao{
	
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
