package com.abc.myapp.model;

public class StudentAnswerVO {
	private int studentId;
	private int problemId;
	private String studentAnswer;
	private int subjectId;
	
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getProblemId() {
		return problemId;
	}
	public void setProblemId(int problemId) {
		this.problemId = problemId;
	}
	public String getStudentAnswer() {
		return studentAnswer;
	}
	public void setStudentAnswer(String studentAnswer) {
		this.studentAnswer = studentAnswer;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	
	@Override
	public String toString() {
		return "StudentAnswerVO [studentId=" + studentId + ", problemId=" + problemId + ", studentAnswer="
				+ studentAnswer + ", subjectId=" + subjectId + "]";
	}
	
	public StudentAnswerVO(int studentId, int problemId, String studentAnswer, int subjectId) {
		super();
		this.studentId = studentId;
		this.problemId = problemId;
		this.studentAnswer = studentAnswer;
		this.subjectId = subjectId;
	}
	
	public StudentAnswerVO() {
		super();
	}
}
