package com.wanjiang.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wanjiang.crud.bean.ClassName;
import com.wanjiang.crud.bean.Student;
import com.wanjiang.crud.service.ClassNameService;
import com.wanjiang.crud.utils.Msg;

/**
 * 查询班级信息
 * @author wanjiang
 *
 */
@Controller
public class ClassNameController {

	@Autowired
	private ClassNameService classNameService;
	
	/**
	 * 查询班级信息
	 */
	@RequestMapping("getClsName")
	@ResponseBody
	public Msg getCls () {
		List<ClassName> list = classNameService.getClsName();
		return Msg.success().add("data", list);
	}
}
