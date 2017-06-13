<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.junit.Test;
import com.soouya.common.model.Page;

import static junit.framework.Assert.*;

<#include "/java_imports.include">

/**
 * ${comments}
 * @author lixon
 * @version 1.0
 * @since 1.0
 */
public class ${className}DaoTest extends BaseDaoTestCase{
	
    @Autowired
    @Qualifier(value = "${classNameLower}Dao")
	private I${className}Dao dao;
	
	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void findPage() {

		${className}Query query = new${className}Query();
		Page page = dao.findPage(query);
		
		assertEquals(pageNumber,page.getThisPageNumber().intValue());
		assertEquals(pageSize,page.getPageSize().intValue());
		List resultList = (List)page.getResult();
		assertNotNull(resultList);
		
	}
	
	static int pageNumber = 1;
	static int pageSize = 10;	
	public static ${className}Query new${className}Query() {
		${className}Query query = new ${className}Query();
		query.setPageNumber(pageNumber);
		query.setPageSize(pageSize);
		query.setSortColumns(null);
		
		<#list table.columns as column>
	  		<#if column.isNotIdOrVersionField>
	  		<#if column.isDateTimeColumn && !column.contains("begin,start,end")>
		query.set${column.columnName}Begin(new ${column.simpleJavaType}(System.currentTimeMillis()));
		query.set${column.columnName}End(new ${column.simpleJavaType}(System.currentTimeMillis()));
			<#else>
	  	query.set${column.columnName}(new ${column.simpleJavaType}("1"));
			</#if>
			</#if>
		</#list>
		return query;
	}
	
    @Test
    public void batchDelete() {
        long start = System.currentTimeMillis();
        
        List<${className}> voList = build${className}List();
        dao.batchDelete(voList);
        
        long end = System.currentTimeMillis();
        System.out.println(end - start);
    }
    
    @Test
    public void batchCreate() {
        long start = System.currentTimeMillis();
        
        List<${className}> voList = build${className}List();
        dao.batchCreate(voList);
        
        long end = System.currentTimeMillis();
        System.out.println(end - start);
    }
    
    @Test
    public void batchUpdate() {
        long start = System.currentTimeMillis();
        
        List<${className}> voList = build${className}List();
        dao.batchUpdate(voList);
        
        long end = System.currentTimeMillis();
        System.out.println(end - start);
    }
    
       public static List<${className}> build${className}List() {
            List<${className}> voList = new ArrayList<${className}>();

            for(int i = 0; i < 100; i++){
                ${className} vo = new ${className}();
                
                vo.setId(UUIDUtils.uuid2String());
            <#list table.columns as column>
                <#if column.isNotIdOrVersionField>
                <#if column.isDateTimeColumn>
                vo.set${column.columnName}(new ${column.simpleJavaType}(System.currentTimeMillis()));
                <#else>
                vo.set${column.columnName}(new ${column.simpleJavaType}("1"));
                </#if>
                </#if>
            </#list>
                
                voList.add(vo);
            }
            return voList;
        }
	
}
