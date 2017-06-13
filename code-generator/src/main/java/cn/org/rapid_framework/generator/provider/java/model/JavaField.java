package cn.org.rapid_framework.generator.provider.java.model;

import cn.org.rapid_framework.generator.util.StringHelper;
import cn.org.rapid_framework.generator.util.typemapping.ActionScriptDataTypesUtils;
import cn.org.rapid_framework.generator.util.typemapping.DatabaseDataTypesUtils;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class JavaField {
	private Field field;
	private JavaClass clazz; //与field相关联的class
	
	public JavaField(Field field, JavaClass clazz) {
		super();
		this.field = field;
		this.clazz = clazz;
	}

	public String getFieldName() {
		return field.getName();
	}

    public String getSqlName() {
        return StringHelper.underscoreName(field.getName());
    }



	public boolean isAccessible() {
        return field.isAccessible();
    }

    public boolean isEnumConstant() {
        return field.isEnumConstant();
    }

    public String toGenericString() {
        return field.toGenericString();
    }

    public JavaClass getClazz() {
		return clazz;
	}

	public String getJavaType() {
		return field.getType().getName();
	}

	public String getAsType() {
		return ActionScriptDataTypesUtils.getPreferredAsType(getJavaType());
	}

	public Annotation[] getAnnotations() {
		return field.getAnnotations();
	}

	public boolean getIsDateTimeField() {
		return  getJavaType().equalsIgnoreCase("java.util.Date")
				|| getJavaType().equalsIgnoreCase("java.sql.Date")
				|| getJavaType().equalsIgnoreCase("java.sql.Timestamp")
				|| getJavaType().equalsIgnoreCase("java.sql.Time");
	}

    public boolean getIsIntField() {
        return  getJavaType().equalsIgnoreCase("java.util.Integer")
                || getJavaType().endsWith("int")
                || getJavaType().endsWith("Integer");
    }
	
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((field == null) ? 0 : field.hashCode());
        return result;
    }

    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        JavaField other = (JavaField) obj;
        if (field == null) {
            if (other.field != null)
                return false;
        } else if (!field.equals(other.field))
            return false;
        return true;
    }

    public String toString() {
		return "JavaClass:"+clazz+" JavaField:"+getFieldName();
	}


    /**
     * 第一个字母大写的columName,等价于: StringHelper.uncapitalize(getColumnName()),示例值: birthDate
     **/
    public String getColumnNameFirstUpper() {
        return StringHelper.capitalize(getFieldName());
    }

    /**
     * 第一个字母小写的columName,等价于: StringHelper.uncapitalize(getColumnName()),示例值: birthDate
     **/
    public String getColumnNameFirstLower() {
        return StringHelper.uncapitalize(getFieldName());
    }


    /** 检查是否包含某些关键字,关键字以逗号分隔 */
    public boolean contains(String keywords) {
        if(keywords == null) throw new IllegalArgumentException("'keywords' must be not null");
        return StringHelper.contains(getSqlName(), keywords.split(","));
    }


    /** 列是否是日期类型 */
    public boolean getIsDateTimeColumn() {
        return DatabaseDataTypesUtils.isDate(getJavaType());
    }

    /**
     * 1对1关联时, 关联表的id
     * @return
     */
    public String getBoSqlName() {
        String s = StringHelper.underscoreName(field.getType().getSimpleName());
        String substring = s.substring(0, s.length() - 1 - 2);
        return substring+"_id";
    }

    /**
     * 去掉bo
     **/
    public String getBoColumnNameFirstUpper() {
        String s = field.getType().getSimpleName();
        String substring = s.substring(0, s.length() - 1 - 1);
        return substring;
    }

    /**
     * 获取泛型 的类型
     * @return
     */
    public JavaClass getGenericityType() {
        if(field.getType().getName().endsWith("List")){
            Type gt = field.getGenericType();//得到泛型类型
            ParameterizedType pt = (ParameterizedType)gt;
            Class genericityType = (Class) pt.getActualTypeArguments()[0];
            return new JavaClass(genericityType);
        }
        return null;
    }


}
