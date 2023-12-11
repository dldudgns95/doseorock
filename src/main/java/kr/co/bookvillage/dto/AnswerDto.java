package kr.co.bookvillage.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class AnswerDto {
  
  private int ansNo;
  private String askContent;
  private UserDto userDto; // int userNo
  private int askNo;
  private Date createdDate;
  private int status;
  private int depth;
  private int groupNo;
  
  

}
