package com.abc.myapp.model;

public class ProblemsVO {
	private int subjectId;
	private int studentId;
	private int problemId;
	
	private String problemContent;//데이터 타입 바꾸기
	private String problemCase;
	private String problemAnswer;
	private String problemCommentary;
	
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
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
	public String getProblemContent() {
		return problemContent;
	}
	public void setProblemContent(String problemContent) {
		this.problemContent = problemContent;
	}
	public String getProblemCase() {
		return problemCase;
	}
	public void setProblemCase(String problemCase) {
		this.problemCase = problemCase;
	}
	public String getProblemAnswer() {
		return problemAnswer;
	}
	public void setProblemAnswer(String problemAnswer) {
		this.problemAnswer = problemAnswer;
	}
	public String getProblemCommentary() {
		return problemCommentary;
	}
	public void setProblemCommentary(String problemCommentary) {
		this.problemCommentary = problemCommentary;
	}
	
	@Override
	public String toString() {
		return "ProblemsVO [subjectId=" + subjectId + ", studentId=" + studentId + ", problemId=" + problemId
				+ ", problemContent=" + problemContent + ", problemCase=" + problemCase + ", problemAnswer="
				+ problemAnswer + ", problemCommentary=" + problemCommentary + "]";
	}
	
	public ProblemsVO(int subjectId, int studentId, int problemId, String problemContent, String problemCase,
			String problemAnswer, String problemCommentary) {
		super();
		this.subjectId = subjectId;
		this.studentId = studentId;
		this.problemId = problemId;
		this.problemContent = problemContent;
		this.problemCase = problemCase;
		this.problemAnswer = problemAnswer;
		this.problemCommentary = problemCommentary;
	}
	
	public ProblemsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
