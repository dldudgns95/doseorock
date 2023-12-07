# 📖 BookVillage 책빌리지
### 내 삶을 바꾸는 지식 문화 마을 책빌리지 !

## ⌛ 개발 기간

- 2023.11 ~ 2023.12

## 👥 참여자
- 길수연 : 희망도서신청, 1:1 문의
- 서가을 : 시설이용신청, 공지사항, 자주 묻는 질문
- 이문주 : 도서 검색, 도서 상세
- 이영훈 : 조장, 관리자 페이지 
- 이은영 : 마이페이지
- 장수진 : 로그인, 회원가입


## ⚙️ 기술 스택

- Front

  - HTML
  - CSS
  - JavaScript

- Back

  - JAVA
  - Spring Boot
  - Oracle

- API
  - KAKAO API
  - Naver API
  - Aladin API

## 🛠 기획
- [기능 명세서]()
- [ERD]()

## 구현 서비스
### 로그인 
: 사이트 자체 로그인 뿐 아니라 네이버 API, 카카오 API를 사용하여 네이버와 카카오 계정으로도 로그인이 가능합니다.
  ![image](https://github.com/dldudgns95/bookvillage/assets/93424265/1e5dc864-92ec-41f4-af93-6087ca15f89a)
  
### 회원 가입
: 이메일 인증을 활용하여 회원가입을 처리합니다.
  ![image](https://github.com/dldudgns95/bookvillage/assets/93424265/d49d9c8c-168a-49c6-a413-c5e17dc84f90)

### 도서 검색 
: 전체, 제목, 저자로 나눠 세부적으로 검색할 수 있습니다. 검색창 아래에는 새로고침할 때마다 랜덤으로 추천 도서가 표시됩니다.
  ![image](https://github.com/dldudgns95/bookvillage/assets/93424265/f7929752-b686-47ae-95ba-b12a82023509)

### 검색 결과 
: 검색 결과와 제목순, 저자순, 발행일순 정렬을 제공합니다. 도서에 대한 대출 상태를 확인할 수 있고 관심 도서 등록할 수 있으며 도서 상세 페이지로 이동할 수 있습니다.
  ![image](https://github.com/dldudgns95/bookvillage/assets/93424265/d7b7baec-edc7-48b2-81d3-fdb057ff8a99)

### 도서 상세 
: 도서 상세 정보를 조회하고, 관심도서 등록, 대출 신청, 한줄평 등록을 수행할 수 있으며, 평점 분포 및 최다 추천 한줄평을 확인할 수 있습니다.
  ![image](https://github.com/dldudgns95/bookvillage/assets/93424265/3c7a0557-dc10-4217-b370-3456dfaa8ff4)
  ![image](https://github.com/dldudgns95/bookvillage/assets/93424265/3cc0c26c-9ece-4c3e-8094-0e48a097ea8e)
  ![image](https://github.com/dldudgns95/bookvillage/assets/93424265/ab6717e6-1698-4e88-9d10-3aef73c2afb7)

### 마이페이지
: 대출조회, 회원정보 조회, 관심도서 조회, 도서 후기 조회, 시설 이용 신청 내역 조회, 희망 도서 신청 내역 조회 등이 가능합니다.
#### 대출 조회
: 대출 신청 내역 조회, 반납 기한 연장이 가능하고 대출신청을 취소할 수 있습니다.
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/a8a5ac34-0a4f-4594-81ec-0a97cfb8e7ad)

#### 회원정보
: 회원정보를 확인 및 수정할 수 있으며 비밀번호를 바꿀 수 있습니다.
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/47bcb5b3-b23e-42bd-9684-c7e2e4052095)

#### 관심도서
: 관심도서 내역을 확인하고 취소할 수 있습니다.
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/2345ceb2-5f2d-4d63-bdb1-69f654df9ebc)

#### 희망도서 신청 내역 조회
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/bb528b34-1ada-4bd8-9a72-ed8a1dd4135f)
#### 시설이용 신청 내역 조
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/cb716a0b-c3b1-4884-af12-39c0c5f23cd5)


### 관리자
: 회원관리, 희망도서, 시설관리, 시설신청, 도서등록, 도서관리, 도서대출, 도서반납 등의 관리 작업을 수행할 수 있습니다.
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/8bbbfdce-cdb2-4171-ba0b-5d759e3368cd)

#### 회원 관리
: 회원 목록 조회, 회원별 회원 정보 조회, 대출 신청이 오면 승인 처리 및 대출 가능 상태(연체,가능)를 조정, 시설 이용 신청 승인, 희망 도서 신청 내역을 조회  
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/d90cec0b-88f6-46ad-9cdf-6719ec108af9)
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/ce254ead-9211-4e4d-8268-fb609283d240)
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/a05ccfdf-1668-4d2f-a386-b12f443d57c4)
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/fdad4541-b38e-46be-9423-c5b5ccc433f8)

#### 희망 도서
: 희망도서를 신청받으면 알라딘 API를 통해 도서 추가
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/e4e93d78-917f-4458-8c76-90cf77e5e7f4)

#### 도서 관리
: 도서 전체 내역 조회 및 관리, 알라딘 API를 통해 도서를 일괄 업데이트
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/439df0bb-1ad3-4e32-ab06-20da80a0ed54)

#### 도서 대출
: 대출 신청에 대한 처리
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/9a44c95a-a370-4822-a2e9-e9a92f0b7d68)

### 시설 신청
: 희망하는 날짜에 시설 이용을 신청할 수 있습니다
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/e13e165b-2ebc-4b44-a5a5-ef694d6949e2)

### 희망도서 신청
: 희망도서를 신청할 수 있습니다
![image](https://github.com/dldudgns95/bookvillage/assets/93424265/4a1f48cf-24e3-4f86-8445-d338f677e4a7)



