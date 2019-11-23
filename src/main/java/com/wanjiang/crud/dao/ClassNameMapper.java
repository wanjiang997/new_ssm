package com.wanjiang.crud.dao;

import com.wanjiang.crud.bean.ClassName;
import com.wanjiang.crud.bean.ClassNameExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClassNameMapper {
    long countByExample(ClassNameExample example);

    int deleteByExample(ClassNameExample example);

    int deleteByPrimaryKey(Integer classId);

    int insert(ClassName record);

    int insertSelective(ClassName record);

    List<ClassName> selectByExample(ClassNameExample example);

    ClassName selectByPrimaryKey(Integer classId);

    int updateByExampleSelective(@Param("record") ClassName record, @Param("example") ClassNameExample example);

    int updateByExample(@Param("record") ClassName record, @Param("example") ClassNameExample example);

    int updateByPrimaryKeySelective(ClassName record);

    int updateByPrimaryKey(ClassName record);
}