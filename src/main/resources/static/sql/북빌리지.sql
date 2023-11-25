-- 시퀀스
DROP SEQUENCE BOOK_CHECKOUT_SEQ;
DROP SEQUENCE BOOK_APPLY_SEQ;
DROP SEQUENCE QNA_ANSWER_SEQ;
DROP SEQUENCE ATTACH_ASK_SEQ;
DROP SEQUENCE QNA_ASK_SEQ;
DROP SEQUENCE ATTACH_FAC_SEQ;
DROP SEQUENCE FAC_APPLY_SEQ;
DROP SEQUENCE FACILITY_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE ATTACH_NT_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE ACCESS_T_SEQ;
DROP SEQUENCE USER_T_SEQ;

CREATE SEQUENCE USER_T_SEQ NOCACHE;
CREATE SEQUENCE ACCESS_T_SEQ NOCACHE;
CREATE SEQUENCE NOTICE_SEQ NOCACHE;
CREATE SEQUENCE ATTACH_NT_SEQ NOCACHE;
CREATE SEQUENCE FAQ_SEQ NOCACHE;
CREATE SEQUENCE FACILITY_SEQ NOCACHE;
CREATE SEQUENCE FAC_APPLY_SEQ NOCACHE;
CREATE SEQUENCE ATTACH_FAC_SEQ NOCACHE;
CREATE SEQUENCE QNA_ASK_SEQ NOCACHE;
CREATE SEQUENCE ATTACH_ASK_SEQ NOCACHE;
CREATE SEQUENCE QNA_ANSWER_SEQ NOCACHE;
CREATE SEQUENCE BOOK_APPLY_SEQ NOCACHE;
CREATE SEQUENCE BOOK_CHECKOUT_SEQ NOCACHE;


-- 테이블
DROP TABLE BOOK_CHECKOUT;
DROP TABLE WISH;
DROP TABLE SCORE;
DROP TABLE BOOK;
DROP TABLE BOOK_APPLY;
DROP TABLE QNA_ANSWER;
DROP TABLE ATTACH_ASK;
DROP TABLE QNA_ASK;
DROP TABLE ATTACH_FAC;
DROP TABLE FAC_APPLY;
DROP TABLE FACILITY;
DROP TABLE FAQ;
DROP TABLE ATTACH_NT;
DROP TABLE NOTICE;
DROP TABLE INACTIVE_USER;
DROP TABLE ACCESS_T;
DROP TABLE USER_T;


-- 회원테이블
CREATE TABLE USER_T (
  USER_NO          NUMBER NOT NULL,      -- 회원번호
  EMAIL            VARCHAR2(100 BYTE) UNIQUE,   -- 회원이메일
  PW               VARCHAR2(64 BYTE),    -- 비밀번호
  NAME             VARCHAR2(50 BYTE) UNIQUE,    -- 회원이름
  MOBILE           VARCHAR2(15 BYTE),    -- 전화번호
  GENDER           NUMBER,               -- 성별 (0:남자, 1:여자, 2: 선택안함)
  AGREE            NUMBER,               -- 동의 (0:필수, 1: 이벤트)
  STATE            NUMBER,               -- 상태 (가입형태, 0:일반회원, 1:네이버간편로그인, 2:구글간편로그인)
  AUTH             NUMBER,               -- 등급 (0:일반, 1: 휴면, 9: 관리자)
  PW_MODIFIED_DATE DATE,                 -- 비밀번호 수정일
  JOINED_DATE      DATE,                 -- 회원가입일
  STATUS           NUMBER,               -- 대출가능여부 (도서상태, 0:대출불가, 1:대출가능)
  CONSTRAINT PK_USER_T PRIMARY KEY(USER_NO)
);

-- 접속 기록
CREATE TABLE ACCESS_T (
  EMAIL      VARCHAR2(100 BYTE) NOT NULL ,
  LOGIN_DATE DATE    NULL,              -- 로그인일시
  CONSTRAINT FK_USER_ACCESS FOREIGN KEY(EMAIL) REFERENCES USER_T(EMAIL) ON DELETE CASCADE
);

-- 휴면회원테이블
CREATE TABLE INACTIVE_USER (
  USER_NO            NUMBER            NOT NULL,  -- 회원번호
  EMAIL              VARCHAR2(100 BYTE) NULL,      -- 회원이메일
  PW                 VARCHAR2(64 BYTE)  NULL,      -- 회원비밀번호
  NAME               VARCHAR2(50 BYTE)  NULL,      -- 회원이름
  MOBILE             VARCHAR2(15 BYTE)  NULL,      -- 회원휴대전화
  GENDER             NUMBER             NULL,      -- 회원성별(0:남자, 1:여자, 2:선택안함)
  AGREE              NUMBER             NULL,      -- 서비스동의여부(0:필수, 1:이벤트)
  STATE              NUMBER             NULL,      -- 가입형태(0:일반, 1:네이버간편로그인, 2:구글간편로그인)
  AUTH               NUMBER             NULL,      -- 회원등급(0:일반, 1:휴면, 9:관리자)
  PW_MODIFIED_DATE   DATE               NULL,      -- 비밀번호수정일
  JOINED_DATE        DATE               NULL,      -- 회원가입일
  INACTIVE_DATE      DATE               NULL,      -- 휴면회원등록일
  CONSTRAINT PK_INACTIVE_USER PRIMARY KEY(USER_NO)
);

-- 공지사항 테이블
CREATE TABLE NOTICE (
  NT_NO      NUMBER          NOT NULL,
  NT_TITLE   VARCHAR2(300 BYTE) NOT NULL,
  NT_CONTENT VARCHAR2(1000 BYTE) NOT NULL,
  NT_DATE    DATE              NOT NULL,
  CONSTRAINT PK_NOTICE PRIMARY KEY(NT_NO)
);

-- 첨부파일 테이블
CREATE TABLE ATTACH_NT (
  ATTACH_NT_NO          NUMBER               NOT NULL,
  NT_NO                 NUMBER               NOT NULL,
  NT_PATH               VARCHAR2(4000 BYTE)  NOT NULL,
  NT_ORIGINAL_FILENAME  VARCHAR2(4000 BYTE)  NOT NULL,
  NT_FILESYSTEM_NAME    VARCHAR2(4000 BYTE)  NOT NULL,
  NT_DOWNLOAD_COUNT     NUMBER               NULL,
  NT_HAS_THUMBNAIL      NUMBER               NULL,
  CONSTRAINT PK_ATTACH_NT PRIMARY KEY(ATTACH_NT_NO),
  CONSTRAINT FK_ATTACH_NT FOREIGN KEY(NT_NO) REFERENCES NOTICE(NT_NO) ON DELETE CASCADE
);

-- FAQ 테이블
CREATE TABLE FAQ (
  FAQ_NO      NUMBER              NOT NULL,
  FAQ_TITLE   VARCHAR2(300 BYTE)  NOT NULL,
  FAQ_CONTENT VARCHAR2(4000 BYTE) NOT NULL,
  CONSTRAINT PK_FAQ PRIMARY KEY(FAQ_NO)
);

-- 시설 테이블
CREATE TABLE FACILITY (
  FAC_NO       NUMBER              NOT NULL,
  FAC_NAME     VARCHAR2(100 BYTE)  NOT NULL,
  FAC_CONTENT  VARCHAR2(4000 BYTE) NULL,
  CONSTRAINT PK_FACILITY PRIMARY KEY(FAC_NO)
);

-- 시설 신청 테이블
CREATE TABLE FAC_APPLY (
  FAC_APPLY_NO NUMBER NOT NULL,
  USER_NO      NUMBER NOT NULL,
  FAC_NO       NUMBER NOT NULL,
  FAC_REG_DATE DATE   NOT NULL,
  FAC_START    DATE   NOT NULL,
  FAC_END      DATE   NOT NULL,
  CONSTRAINT PK_FAC_APPLY PRIMARY KEY(FAC_APPLY_NO),
  CONSTRAINT FK1_FAC_APPLY FOREIGN KEY(USER_NO) REFERENCES USER_T(USER_NO) ON DELETE SET NULL,
  CONSTRAINT FK2_FAC_APPLY FOREIGN KEY(FAC_NO) REFERENCES FACILITY(FAC_NO) ON DELETE SET NULL
);

-- 시설 첨부파일 테이블
CREATE TABLE ATTACH_FAC (
  FAC_ATTACH_NO          NUMBER               NULL,
  FAC_NO                 NUMBER               NOT NULL,
  FAC_PATH               VARCHAR2(300 BYTE)   NOT NULL,
  FAC_ORIGINAL_FILENAME  VARCHAR2(4000 BYTE)  NOT NULL,
  FAC_FILESYSTEM_NAME    VARCHAR2(300 BYTE)   NOT NULL,
  FAC_HAS_THUMBNAIL      VARCHAR2(4000 BYTE)  NULL,
  CONSTRAINT PK_ATTACH_FAC PRIMARY KEY(FAC_ATTACH_NO),
  CONSTRAINT FK_ATTACH_FAC FOREIGN KEY(FAC_NO) REFERENCES FACILITY(FAC_NO) ON DELETE CASCADE
);


-- 1:1 문의
CREATE TABLE QNA_ASK (
	ASK_NO	        NUMBER	            NOT NULL,
	USER_NO         NUMBER              NOT NULL,
	ASK_TITLE       VARCHAR2(100 BYTE)	NOT NULL,
	ASK_CONTENT     VARCHAR2(1000 BYTE)	NOT NULL,
	ASK_DATE        DATE	            NULL,
	ASK_STATE       NUMBER	            NULL,
    CONSTRAINT QNA_ASK_PK PRIMARY KEY (ASK_NO),
    CONSTRAINT QNA_ASK_FK FOREIGN KEY (USER_NO) REFERENCES USER_T(USER_NO) ON DELETE SET NULL
);

-- 1:1 문의 첨부파일
CREATE TABLE ATTACH_ASK (
	ASK_ATTACH_NO	        NUMBER	            NULL,      --1:1문의 첨부번호
	ASK_NO	                NUMBER	            NOT NULL,  --문의 번호
	ASK_PATH	            VARCHAR2 (300 BYTE)	NOT NULL,  --경로
	ASK_ORIGINAL_FILENAME	VARCHAR2 (300 BYTE)	NOT NULL,  --원래 이름
	ASK_FILESYSTEM_NAME	    VARCHAR2 (300 BYTE)	NOT NULL,  --저장된 이름
	ASK_DOWNLOAD_COUNT	    NUMBER	            NULL,      --다운로드 횟수
	ASK_HAS_THUMBNAIL	    NUMBER	            NULL,      --썸네일 유무
    CONSTRAINT PK_ATTACH_ASK PRIMARY KEY (ASK_ATTACH_NO),
    CONSTRAINT FK_ATTACH_ASK FOREIGN KEY (ASK_NO) REFERENCES QNA_ASK(ASK_NO) ON DELETE SET NULL
);

-- 1:1 문의 답변
CREATE TABLE QNA_ANSWER (
    ANS_NO      NUMBER               NOT NULL,   --답변 번호
    USER_NO     NUMBER               NOT NULL,   --회원 번호
    ANS_CONTENT VARCHAR2 (1000 BYTE) NOT NULL,   --답변 내용
    ANS_DATE    DATE                 NOT NULL,   --답변일
    ASK_NO      NUMBER               NOT NULL,   --문의 번호
    CONSTRAINT PK_QNA_ANSWER PRIMARY KEY (ANS_NO),
    CONSTRAINT FK_QNA_ANSWER FOREIGN KEY (ASK_NO) REFERENCES QNA_ASK(ASK_NO) ON DELETE CASCADE
);

-- 희망도서신청
CREATE TABLE BOOK_APPLY (
   APPLY_NO  NUMBER               NOT NULL,  --신청번호
   USER_NO   NUMBER               NOT NULL,  --회원 번호
   BOOK_NAME VARCHAR2(100 BYTE)   NOT NULL,  --책제목
   AUTHOR    VARCHAR2(100 BYTE)   NULL,      --저자
   PUBLISHER VARCHAR2(100 BYTE)   NULL,      --출판사
   WISH      VARCHAR2(4000 BYTE)  NULL,      --신청사유
   CONSTRAINT PK_BOOK_APPLY PRIMARY KEY (APPLY_NO),
   CONSTRAINT FK_BOOK_APPLY FOREIGN KEY (USER_NO) REFERENCES USER_T(USER_NO) ON DELETE SET NULL
);


CREATE TABLE BOOK (
	ISBN	        VARCHAR2(13 BYTE)	 NOT NULL,
	TITLE	        VARCHAR2(1000 BYTE)	 NOT NULL,
	COVER	        VARCHAR2(2000 BYTE)	 NULL,
	AUTHOR	        VARCHAR2(200 BYTE)	 NULL,
	PUBLISHER	    VARCHAR2(100 BYTE)	 NULL,
	PUBDATE	        DATE            	 NULL,
	DESCRIPTION	    VARCHAR2(2000 BYTE)	 NULL,
	STATUS	        NUMBER           	 NULL,
	CATEGORY_NAME	VARCHAR2(1000 BYTE)  NULL,
	CATEGORY_ID	    NUMBER               NULL,
    CONSTRAINT      PK_BOOK              PRIMARY KEY(ISBN)
);

CREATE TABLE SCORE (
	ISBN	    VARCHAR2(13 BYTE) NOT NULL,
	USER_NO	    NUMBER            NOT NULL,
	REVIEW_DATE	DATE	          NOT NULL,
	STAR	    NUMBER	          NULL,
	REVIEW	    VARCHAR2(1000)    NULL,
    CONSTRAINT  PK_SCORE        PRIMARY KEY(ISBN, USER_NO),
    CONSTRAINT  FK1_SCORE      FOREIGN KEY(ISBN)           REFERENCES BOOK(ISBN)    ON DELETE CASCADE,
    CONSTRAINT  FK2_SCORE     FOREIGN KEY(USER_NO)        REFERENCES USER_T(USER_NO) ON DELETE CASCADE
);


CREATE TABLE WISH (
	ISBN	    VARCHAR2(13 BYTE) NOT NULL,
	USER_NO	    NUMBER	          NOT NULL,
	WISH_DATE	TIMESTAMP         NOT NULL,
    CONSTRAINT  PK_WISH        PRIMARY KEY(ISBN, USER_NO),
    CONSTRAINT  FK1_WISH       FOREIGN KEY(ISBN)           REFERENCES BOOK(ISBN)    ON DELETE CASCADE,
    CONSTRAINT  FK2_WISH       FOREIGN KEY(USER_NO)        REFERENCES USER_T(USER_NO) ON DELETE CASCADE
);
-- 도서 대출 테이블
CREATE TABLE BOOK_CHECKOUT (
  CHECKOUT_NO NUMBER            NOT NULL,      -- 대출번호(시퀀스 사용)
  USER_NO     NUMBER            NOT NULL,      -- 회원번호(USER 테이블 참조)
  ISBN        VARCHAR2(13 BYTE) NOT NULL,      -- ISBN(BOOK 테이블 참조)
  STATUS      NUMBER            NOT NULL,      -- 대출상태(0:대출신청, 1:대출중, 2:반납완료, 3:연체)
  START_DATE  DATE              NOT NULL,      -- 대출시작날짜
  DUE_DATE    DATE              NOT NULL,      -- 대출반납예정일
  END_DATE    DATE              NULL,          -- 대출반납일
  CONSTRAINT PK_BOOK_CHECKOUT PRIMARY KEY(CHECKOUT_NO),
  CONSTRAINT FK1_BOOK_CHECKOUT FOREIGN KEY(USER_NO) REFERENCES USER_T(USER_NO),
  CONSTRAINT FK2_BOOK_CHECKOUT FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN)
);


--회원 삽입
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user1@naver.com', '1111', 'User1', '010-1111-1111', 0, 0, 0, 0, '2023-11-11', '2023-11-10', 1);
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user2@naver.com', '2222', 'User2', '010-2222-2222', 1, 1, 0, 0, '2023-10-11', '2023-10-10', 1);
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user3@naver.com', '3333', 'User3', '010-3333-3333', 2, 0, 0, 0, '2023-09-11', '2023-09-10', 1);
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user4@naver.com', '4444', 'User4', '010-4444-4444', 0, 0, 0, 0, '2023-08-11', '2023-08-10', 1);
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user5@naver.com', '5555', 'User5', '010-5555-5555', 1, 1, 0, 0, '2023-07-11', '2023-07-10', 1);
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user6@naver.com', '6666', 'User6', '010-6666-6666', 2, 0, 0, 0, '2023-06-11', '2023-06-10', 1);
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user7@naver.com', '7777', 'User7', '010-7777-7777', 0, 1, 0, 0, '2023-05-11', '2023-05-10', 1);
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user8@naver.com', '8888', 'User8', '010-8888-8888', 1, 0, 0, 0, '2023-04-11', '2023-04-10', 1);
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user9@naver.com', '9999', 'User9', '010-9999-9999', 2, 1, 0, 0, '2023-03-11', '2023-03-10', 1);
commit;

--관리자 삽입
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user10@naver.com', '1010', 'User10', '010-1010-1010', 0, 0, 0, 9, '2023-02-11', '2023-02-10', 1);
INSERT INTO USER_T VALUES(USER_T_SEQ.NEXTVAL, 'user11@naver.com', '1111', 'User11', '010-1111-1111', 0, 0, 0, 9, '2023-01-11', '2023-01-10', 1);
commit;

--휴면 회원 삽입

INSERT INTO INACTIVE_USER (USER_NO, EMAIL, PW, NAME, MOBILE, GENDER, AGREE, STATE, AUTH, PW_MODIFIED_DATE, JOINED_DATE, INACTIVE_DATE)
VALUES (USER_T_SEQ.NEXTVAL, 'user13@naver.com', '1313', 'User13', '010-1313-1313', 0, 0, 0, 1, '2021-01-01', '2020-12-12', '2022-05-01');
commit;

--도서 삽입
INSERT INTO BOOK VALUES(
    9788938116017
  , '2024 핵심 전기기사 필기 - 핵심요점정리 최근 7년 과년도 문제'
  , 'https://image.aladin.co.kr/product/32933/45/coversum/8938116018_1.jpg'
  , '검정연구회 (지은이)'
  , '동일출판사'
  , '2024-01-20'
  , '과목별로 꼭 필요한 핵심내용과 과목별 핵심요약에 따른 유형별 문제를 수록하여 핵심내용을 쉽게 이해할 수 있도록 하였다. 최근7년(2017~2023년) 과년도문제를 수록하여 새로 출제된 문제와 유형을 쉽게 파악할 수 있도록 하였다.'
  , 1
  , '국내도서>수험서/자격증>국가기술자격>전기>전기기능사/기사/산업기사'
  , 181324
);

INSERT INTO BOOK VALUES(
    9791185098586
  , '성경의 이미지'
  , 'https://image.aladin.co.kr/product/32933/43/coversum/k882936942_1.jpg'
  , '프레스 샌더스 (지은이), 이철민 (옮긴이)'
  , '터치북스'
  , '2023-11-22'
  , NULL
  , 1
  , '국내도서>종교/역학>기독교(개신교)>기독교(개신교) 목회/신학>신학일반'
  , 51592
);

INSERT INTO BOOK VALUES(
    9791171249305
  , '불멸의 그대에게 20'
  , 'https://image.aladin.co.kr/product/32933/43/coversum/k872936942_1.jpg'
  , '오이마 요시토키 (지은이), 김동욱 (옮긴이)'
  , '대원씨아이(만화)'
  , '2023-11-24'
  , NULL
  , 1
  , '국내도서>만화>본격장르만화>판타지>드라마틱 판타지'
  , 181324
);

INSERT INTO BOOK VALUES (
    9791171245765,
    '길티 이노센스 7',
    'https://image.aladin.co.kr/product/32933/40/coversum/k772936942_1.jpg',
    '윤한 (지은이)',
    '대원씨아이(만화)',
    TO_DATE('2023-11-24', 'YYYY-MM-DD'),
    '',
    1,
    '국내도서>만화>순정만화>그 남자들의 사랑',
    6130
);

INSERT INTO BOOK VALUES (
    9791192908595,
    '저는 측면이 좀 더 낫습니다만 - 하마터면 열심히 살 뻔했던 작가 하완의 자발적 경로 이탈 에세이, 수정증보판',
    'https://image.aladin.co.kr/product/32933/39/coversum/k632936942_1.jpg',
    '하완 (지은이)',
    '세미콜론',
    TO_DATE('2023-11-20', 'YYYY-MM-DD'),
    '2018년 봄, 혜성처럼 나타나 출판계를 뜨겁게 뒤흔든 『하마터면 열심히 살 뻔했다』의 하완 작가가 돌아왔다. 1년이 넘는 시간 동안 베스트셀러 순위를 굳건히 지켰고, 방송과 광고 심지어 도서 제목에서도 수많은 패러디를 만들어냈으며, 계절마다 다양한 버전의 리커버를 탄생시킨, 자칭 \u2018야매 득도 에세이\u2019에서 조금 새로워진 모습으로. 이번엔 \u2018자발적 경로 이탈 에세이\u2019를 표방한다.',
    1,
    '국내도서>에세이>한국에세이',
    51371
);

INSERT INTO BOOK VALUES (
    9791197678653,
    '골프취업학개론',
    'https://image.aladin.co.kr/product/32933/37/coversum/k532936942_1.jpg',
    '오상민 (지은이)',
    '신사우동호랑이',
    TO_DATE('2023-12-11', 'YYYY-MM-DD'),
    '골프업계 취업과 이직을 준비하는 사람들을 위한 강의형식의 책이다. 책을 끝까지 읽으면 좋은 강의를 한 번 듣는 것과 같다. 여러 번 반복해서 읽으면 좋은 습관이 몸에 배기 때문에 취업 확률을 자연스럽게 높일 수 있다.',
    1,
    '국내도서>건강/취미>골프',
    53524
);

INSERT INTO BOOK VALUES (
    9791170950875,
    '흑막 용을 키우게 되었다 시즌 1 : 3',
    'https://image.aladin.co.kr/product/32933/35/coversum/k522936942_1.jpg',
    '소탄 (지은이), 달슬 (원작)',
    '오렌지디',
    TO_DATE('2023-11-24', 'YYYY-MM-DD'),
    '',
    1,
    '국내도서>만화>인터넷 연재 만화',
    7443
);

INSERT INTO BOOK VALUES (
    9788959408290,
    '안중근 평전 - 3판',
    'https://image.aladin.co.kr/product/32933/34/coversum/8959408298_1.jpg',
    '김삼웅 (지은이)',
    '시대의창',
    TO_DATE('2023-12-01', 'YYYY-MM-DD'),
    '안중근 의사의 사상이 어떻게 형성되었는지 그리고 하얼빈 의거와 이후 공판투쟁 모습 등 그의 행적이 어떠했는지를 역사적 사료와 증언기록을 통해 보여준다. 그뿐 아니라 안중근 의사의 처형 전후에 대한 여러 사람의 증언과 기록을 통해 그날의 상황을 최대한 객관적이고 사실적으로 묘사하려 노력했다.',
    1,
    '국내도서>역사>한국근현대사>일제치하/항일시대',
    141
);

INSERT INTO BOOK VALUES (
    9791170950868,
    '흑막 용을 키우게 되었다 시즌 1 : 2',
    'https://image.aladin.co.kr/product/32933/32/coversum/k432936942_1.jpg',
    '소탄 (지은이), 달슬 (원작)',
    '오렌지디',
    TO_DATE('2023-11-24', 'YYYY-MM-DD'),
    '',
    1,
    '국내도서>만화>인터넷 연재 만화',
    7443
);

INSERT INTO BOOK VALUES (
    8809904205564,
    '새콤달콤 캐치 티니핑 시즌4 마그네틱 코디숍',
    'https://image.aladin.co.kr/product/32933/30/coversum/k402936942_1.jpg',
    '아이누리 편집부 (지은이)',
    '아이누리',
    TO_DATE('2023-11-24', 'YYYY-MM-DD'),
    '마그네틱 코디숍은 자석으로 옷을 갈아 입히는 신개념의 인형 옷 놀이 이다. 인형을 반침대에 끼워서 세운후 여러가지 옷과 악세서리로 코디해 보자. 자석스티커로 반영구적으로 사용이 가능하며 붙였다 떼어다가 쉬워 놀이가 더욱 재미있다. 인형놀이가 끝난 후 인형과 자석 옷은 케이스에 넣어 보관하자.',
    1,
    '국내도서>유아>놀이책>유아 놀이책 기타',
    49525
);
commit;
