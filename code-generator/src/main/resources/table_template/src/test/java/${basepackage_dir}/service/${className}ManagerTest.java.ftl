<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.junit.Test;

import static junit.framework.Assert.*;

<#include "/java_imports.include">

/**
 * ${comments}
 * @author lixon
 * @version 1.0
 * @since 1.0
 */
public class ${className}ManagerTest extends BaseManagerTestCase{

    @Autowired
    @Qualifier(value = "${classNameLower}Manager")
	private I${className}Manager manager;
	
	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		${className} obj = new${className}();
		manager.save(obj);
//		manager.getEntityDao().flush();
		
		manager.update(obj);
//		manager.getEntityDao().flush();
		
	<#if table.compositeId>
		assertNotNull(manager.getById(obj.getId()));
		
		manager.removeById(obj.getId());
//		manager.getEntityDao().flush();
	<#else>
		assertNotNull(obj.get${table.idColumn.columnName}());
		
		manager.deleteById(obj.get${table.idColumn.columnName}());
//		manager.getEntityDao().flush();
	</#if>
	
	}
	
	public static ${className} new${className}() {
		${className} obj = new ${className}();
		
		<#list table.columns as column>
	  		<#if column.isNotIdOrVersionField>
	  			<#if column.isDateTimeColumn>
	  	obj.set${column.columnName}(new ${column.javaType}(System.currentTimeMillis()));
	  			<#else>
	  	obj.set${column.columnName}(new ${column.javaType}("1"));
	  			</#if>
			</#if>
		</#list>
		return obj;
	}
}
