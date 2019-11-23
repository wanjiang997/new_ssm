package com.wanjiang.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wanjiang.crud.bean.Student;
import com.wanjiang.crud.service.StudentService;
import com.wanjiang.crud.utils.Msg;

/**
 * 处理学生信息请求
 * 
 * @author wanjiang
 *
 */
@Controller
public class StudentController {

	@Autowired
	StudentService studentService;
	
	/**
	 * 批量单个删除二合一
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteStudent/{ids}", method=RequestMethod.DELETE)
	public Msg deleteStudent(@PathVariable("ids") String ids) {
		if (ids.contains("-")) {
			List<Integer> list = new ArrayList<Integer>();
			String[] id_str = ids.split("-");
			for (String str : id_str) {
				Integer id = Integer.parseInt(str);
				list.add(id);
			}
			studentService.deleteBatch(list);
		} else {
			Integer id = Integer.parseInt(ids);
			studentService.deleteStudent(id);
		}
		return Msg.success();
	}
	
	/**
	 * 更新学生信息
	 * 如果直接发送ajax=PUT形式的请求
	 * 封装的数据
	 * Student中只有url中的Id有指，其他都是空
	 * 
	 * 问题：
	 * 请求体中有数据；
	 * 但是Student对象封装不上；
	 * update stu_table  where stu_id = 1014;
	 * 
	 * 原因：
	 * Tomcat：
	 * 		1、将请求体中的数据，封装一个map。
	 * 		2、request.getParameter("stuName")就会从这个map中取值。
	 * 		3、SpringMVC封装POJO对象的时候。
	 * 				会把POJO中每个属性的值，request.getParamter("stuEmail");
	 * AJAX发送PUT请求引发的血案：
	 * 		PUT请求，请求体中的数据，request.getParameter("stuName")拿不到
	 * 		Tomcat一看是PUT不会封装请求体中的数据为map，只有POST形式的请求才封装请求体为map
	 * org.apache.catalina.connector.Request--parseParameters() (3111); (tomcat源码位置)
	 * 
	 * 解决方案；
	 * 我们要能支持直接发送PUT之类的请求还要封装请求体中的数据
	 * 1、配置上HttpPutFormContentFilter；
	 * 2、他的作用；将请求体中的数据解析包装成一个map。
	 * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
	 * 
	 * @param student
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateStudent/{stuId}", method=RequestMethod.PUT)
	public Msg updateStudent(Student student) {
		studentService.updateStudent(student);
		return Msg.success();
	}
	
	/**
	 * 按照Id查询学习信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getStudent/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Msg getStudent(@PathVariable Integer id){
		Student student = studentService.getStudent(id);
		return Msg.success().add("student", student);
	}
	
	/**
	 * 校验学生姓名是否重复
	 * @param stuName
	 * @return
	 */
	@RequestMapping("/checkStuName")
	@ResponseBody
	public Msg checkStuName(String stuName) {
		String regx = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if (!stuName.matches(regx)){
			return Msg.fail().add("errorMsg", "学生姓名可以是2-5位中文或3-16位英文和数字组合");
		}
		boolean b = studentService.checkStuName(stuName);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("errorMsg", "该姓名已存在，请修改！");
		}
	}
	
	@RequestMapping(value="saveStudent", method=RequestMethod.POST)
	@ResponseBody
	public Msg saveStudent (@Valid Student student, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
//			errors.forEach(fieldError -> {
//				System.out.println("错误的字段名：" + fieldError.getField());
//				System.out.println("错误信息：" + fieldError.getDefaultMessage());
//				map.put(fieldError.getField(), fieldError.getDefaultMessage());
//			});
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名：" + fieldError.getField());
				System.out.println("错误信息：" + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {
			studentService.saveStudent(student);
			return Msg.success();
		}
	}

	@RequestMapping("getStudentAll")
	@ResponseBody
	public Msg getStu(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 若是想要进行分页查询，则需要印入PageHelper分页插件即可
		// 在查询之后需要调用，传入页码，以及每页数据量
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Student> list = studentService.getAll();
		// 使用pegeInfo包装查询后的结果，只需要将pageInfo交给页面就行
		// 封装了详细信息，以及我们查询出来的数据，传入要连续显示的页数
		PageInfo page = new PageInfo(list, 5);
		return Msg.success().add("pageInfo", page);

	}

	/**
	 * 查询学生信息（分页查询）
	 * 
	 * @return
	 */
//	@RequestMapping("/studentAll")
	public String getAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 若是想要进行分页查询，则需要印入PageHelper分页插件即可
		// 在查询之后需要调用，传入页码，以及每页数据量
		PageHelper.startPage(pn, 5);
		// startPage后面紧跟的这个查询就是一个分页查询
		List<Student> list = studentService.getAll();
		// 使用pegeInfo包装查询后的结果，只需要将pageInfo交给页面就行
		// 封装了详细信息，以及我们查询出来的数据，传入要连续显示的页数
		PageInfo page = new PageInfo(list, 5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
}
