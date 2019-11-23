package com.wanjiang.crud.bean;

import javax.validation.constraints.Pattern;

public class Student {
	private Integer stuId;
	
	@Pattern(regexp = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})", 
			message = "学生姓名可以是2-5位中文或3-16位英文和数字组合")
	private String stuName;
	
	private Integer stuAge;

//	@Email
	@Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
				message = "邮箱格式错误")
	private String stuEmail;

	private String stuSex;

	private Integer stuCname;
	
	private ClassName className;

	public Student() {
		super();
	}

	public Student(Integer stuId, Integer stuCname, String stuEmail, String stuSex, Integer stuAge, String stuName) {
		super();
		this.stuId = stuId;
		this.stuCname = stuCname;
		this.stuEmail = stuEmail;
		this.stuSex = stuSex;
		this.stuAge = stuAge;
		this.stuName = stuName;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getStuCname() {
		return stuCname;
	}

	public void setStuCname(Integer stuCname) {
		this.stuCname = stuCname;
	}

	public String getStuEmail() {
		return stuEmail;
	}

	public void setStuEmail(String stuEmail) {
		this.stuEmail = stuEmail == null ? null : stuEmail.trim();
	}

	public String getStuSex() {
		return stuSex;
	}

	public void setStuSex(String stuSex) {
		this.stuSex = stuSex == null ? null : stuSex.trim();
	}

	public Integer getStuAge() {
		return stuAge;
	}

	public void setStuAge(Integer stuAge) {
		this.stuAge = stuAge;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName == null ? null : stuName.trim();
	}

	public ClassName getClassName() {
		return className;
	}

	public void setClassName(ClassName className) {
		this.className = className;
	}
}