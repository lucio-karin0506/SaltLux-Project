package com.abc.myapp.model;

public class CheckAnswerVO {
	private String checkResult;
	private int problemId;
	private String studentAnswer;
	private String problemAnswer;
	private String problemContent;
	private String problemCase;
	private String problemCommentary;
	
	public CheckAnswerVO() {
		super();
	}

	public CheckAnswerVO(String checkResult, int problemId, String studentAnswer, String problemAnswer,
			String problemContent, String problemCase, String problemCommentary) {
		super();
		this.checkResult = checkResult;
		this.problemId = problemId;
		this.studentAnswer = studentAnswer;
		this.problemAnswer = problemAnswer;
		this.problemContent = problemContent;
		this.problemCase = problemCase;
		this.problemCommentary = problemCommentary;
	}

	public String getCheckResult() {
		return checkResult;
	}

	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
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

	public String getProblemAnswer() {
		return problemAnswer;
	}

	public void setProblemAnswer(String problemAnswer) {
		this.problemAnswer = problemAnswer;
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

	public String getProblemCommentary() {
		return problemCommentary;
	}

	public void setProblemCommentary(String problemCommentary) {
		this.problemCommentary = problemCommentary;
	}

	@Override
	public String toString() {
		return "checkAnswerVO [checkResult=" + checkResult + ", problemId=" + problemId + ", studentAnswer="
				+ studentAnswer + ", problemAnswer=" + problemAnswer + ", problemContent=" + problemContent
				+ ", problemCase=" + problemCase + ", problemCommentary=" + problemCommentary + "]";
	}
	
	
	
	
}
