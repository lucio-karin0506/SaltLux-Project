package com.abc.myapp.model;

public class StudentVO {

   private String studentName;
   private int studentId;
   private String emailId;
   private String password;
   private byte[] studentImage;
   
   // setter, getter
   public String getStudentName() {
      return studentName;
   }

   public void setStudentName(String studentName) {
      this.studentName = studentName;
   }

   public int getStudentId() {
      return studentId;
   }

   public void setStudentId(int studentId) {
      this.studentId = studentId;
   }

   public String getEmailId() {
      return emailId;
   }

   public void setEmailId(String emailId) {
      this.emailId = emailId;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public byte[] getStudentImage() {
      return studentImage;
   }

   public void setStudentImage(byte[] studentImage) {
      this.studentImage = studentImage;
   }

   // toString
   @Override
   public String toString() {
      return "StudentVO [studentName=" + studentName + ", studentId=" + studentId + ", emailId=" + emailId
            + ", password=" + password + "]";
   }
   
}