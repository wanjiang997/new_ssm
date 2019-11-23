package com.wanjiang.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanjiang.crud.bean.ClassName;
import com.wanjiang.crud.bean.Student;
import com.wanjiang.crud.dao.ClassNameMapper;

@Service
public class ClassNameService {
	
	@Autowired
	private ClassNameMapper classNameMapper;

	public List<ClassName> getClsName() {
		List<ClassName> list = classNameMapper.selectByExample(null);
		return list;
	}
}
