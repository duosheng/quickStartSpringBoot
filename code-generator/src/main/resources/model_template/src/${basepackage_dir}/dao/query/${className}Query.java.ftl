<#include "/macro.include"/>
<#include "/java_copyright.include">
<#assign className = clazz.className>
<#assign classNameLower = className?uncap_first>
package ${basepackage}.dao.query;

<#include "/java_imports.include">



/**
 * ${comments}
 * @author lixon
 * @version 1.0
 * @since 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ${className}Query extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;

	<@generateFields/>



}

<#macro generateFields>

	<#list clazz.allColumns as field>

	<#if field.isDateTimeColumn && !field.contains("begin,start,end")>
	private ${field.javaType} ${field.columnNameFirstLower}Begin;
	private ${field.javaType} ${field.columnNameFirstLower}End;
	<#elseif field.isIntField && field.contains("state,status,type") >
    private ${field.javaType} ${field.columnNameFirstLower};
    private List<${field.javaType}> include${field.columnNameFirstUpper}List;
    private List<${field.javaType}> exclude${field.columnNameFirstUpper}List;
	<#else>
	private ${field.javaType} ${field.columnNameFirstLower};
	</#if>
	</#list>

</#macro>







