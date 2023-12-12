package kr.co.bookvillage.dao;

import java.util.List;
import java.util.Map;

import kr.co.bookvillage.dto.AttachFacDto;
import kr.co.bookvillage.dto.BookApplyDto;
import kr.co.bookvillage.dto.BookCheckoutDto;
import kr.co.bookvillage.dto.BookDto;
import kr.co.bookvillage.dto.FacApplyDto;
import kr.co.bookvillage.dto.FacilityDto;
import kr.co.bookvillage.dto.UserDto;

public interface AdminMapper {
  public int insertBook(BookDto bookDto);
  public int insertDirectBook(BookDto bookDto);
  public int editBook(BookDto bookDto);
  public int userTotalCount();
  public List<UserDto> getUserList(Map<String, Object> map);
  public UserDto getUserDetail(int userNo);
  public int deleteUser(int userNo);
  public int userSearchCount(Map<String, Object> map);
  public List<UserDto> getSearchUserList(Map<String, Object> map);
  public int bookTotalCount();
  public List<BookDto> getBookList(Map<String, Object> map);
  public BookDto getBookDetail(String isbn);
  public int bookSearchCount(Map<String, Object> map);
  public List<UserDto> getSearchBookList(Map<String, Object> map);
  public int addFacility(FacilityDto facilityDto);
  public int addFacImage(AttachFacDto attachFacDto);
  public int getFacCount();
  public List<AttachFacDto> getFacList(Map<String, Object> map);
  public List<AttachFacDto> availableFacList(String facStart);
  public List<AttachFacDto> unavailableFacList(String facStart);
  public int addFacApply(Map<String, Object> map);
  public boolean checkFacApply(Map<String, Object> map);
  public int bookApplyCount();
  public List<BookApplyDto> getBookApplyList(Map<String, Object> map);
  public List<BookApplyDto> getUserBookApplyList(int userNo);
  public BookApplyDto getBookApplyDetail(int applyNo);
  public int getUserBookCheckoutCount(int userNo);
  public List<BookCheckoutDto> getUserBookCheckoutList(Map<String, Object> map);
  public int bookCheckoutCount();
  public List<BookCheckoutDto> getBookCheckoutList(Map<String, Object> map);
  public int bookCheckoutSearchCount(Map<String, Object> map);
  public List<BookCheckoutDto> getBookCheckoutSearchList(Map<String, Object> map);
  public int bookCheckoutReturnCount();
  public List<BookCheckoutDto> getBookCheckoutReturnList(Map<String, Object> map);
  public int bookCheckoutReturnSearchCount(Map<String, Object> map);
  public List<BookCheckoutDto> getBookCheckoutReturnSearchList(Map<String, Object> map);
  public int approvalBookCheckout(int checkoutNo);
  public int approvalBookCheckoutReturn(int checkoutNo);
  public int activeBook(String isbn);
  public int minusBookCount(int userNo);
  public int updateActiveUser(int userNo);
  public int updateInactiveUser(int userNo);
<<<<<<< HEAD
  public int getFacApplyCount();
  public List<FacApplyDto> getFacApplyList(Map<String, Object> map);
=======
  public List<FacApplyDto> getFacApplyList();
  public int getFacApplyCountByUser(int userNo);
>>>>>>> main
  public List<FacApplyDto> getUserFacApplyList(int userNo);
  public boolean checkAddBook(String isbn);
  public int addUserBookCount(int userNo);
  public int updateBookApply(int applyNo);
  public int approveFacApply(int facApplyNo);
  public int refuseFacApply(int facApplyNo);
  public int deleteFac(int facNo);
  public int deleteBook(String isbn);
  public AttachFacDto getFacDetail(int facNo);
  public int editFacility(FacilityDto facilityDto);
  public int editAttachFac(AttachFacDto attachFacDto);
  public int inactiveBook(String isbn);
  public BookCheckoutDto getBookCheckoutByISBN(String isbn);
  public boolean checkBookCheckout(int userNo);
  public int activeBookByBookCheckout();
  public int cancleBookCheckout();
  public int changeOverdue();
  public int inactiveUserByBookCheckout();
  public int updateFacApply();
  public int approveBookCheckoutByNumbers(String numbers);
  public int approveBookCheckoutReturnByNumbers(String numbers);
  public int activeBooks(String isbn);
  public List<String> checkBookCheckoutByUser(int userNo); 
}
