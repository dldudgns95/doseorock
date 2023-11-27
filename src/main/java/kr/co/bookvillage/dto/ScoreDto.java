package kr.co.bookvillage.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ScoreDto {
  private String isbn;
  private int userNo;
  private Date reviewDate;
  private int star;
  private String review;
  
  //추가한 dto
  private int recommend; //추천순 정렬에서 사용
}
