package com.wanjiang.crud.bean;

public class ClassName {
    private Integer classId;

    private String className;
    
	public ClassName() {
		super();
	}

	public ClassName(Integer classId, String className) {
		super();
		this.classId = classId;
		this.className = className;
	}

	public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }
}