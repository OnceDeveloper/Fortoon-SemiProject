CREATE TABLE MEMBER(
   M_ID VARCHAR2(50) constraint M_ID_PK primary key,   --  ID 
   NAME VARCHAR(50),  -- 이름
   BIRTH VARCHAR(20),  -- 생년원일
   PHONE VARCHAR2(50),  -- 휴대전화
   PWD VARCHAR2(50)  -- 비밀번호
);


CREATE TABLE CREATION (
   CR_NUM NUMBER(20), --  작품번호
   EPI NUMBER(20), --회차
   DIVISION VARCHAR2(20) NOT NULL,   -- 구분(웹툰/소설)
   AGE_GRADE NUMBER(10)  NOT NULL,   -- 연령등급
   GENRE VARCHAR2(20) NOT NULL,  -- 장르
   TITLE VARCHAR2(100) NOT NULL,  -- 제목
   PLOT VARCHAR2(1000), --줄거리
   RDATE DATE,  -- 등록일
   LCOUNT NUMBER(10),  -- 조회수
   M_ID VARCHAR2(50) constraint M_ID_FK references MEMBER(M_ID) on delete cascade -- M_ID(FK)
);
alter table CREATION add constraint CREATION_PK primary key(CR_NUM, EPI);

CREATE SEQUENCE CR_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;



CREATE TABLE LOOK_CREATION (
   L_NUM NUMBER(20) constraint L_NUM_PK2 primary key, --  조회작품번호
   M_ID VARCHAR2(50) constraint M_ID5_FK references MEMBER(M_ID) on delete cascade, -- M_ID(FK)
   CR_NUM NUMBER(20), -- 작품번호
   EPI NUMBER(20) --회차
);
alter table LOOK_CREATION add constraint LOOK_CREATION_FK foreign key(CR_NUM, EPI) references CREATION(CR_NUM, EPI) on delete cascade;

CREATE SEQUENCE  L_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;



CREATE TABLE BOARD(
   B_NUM NUMBER constraint B_NUM_PK primary key, -- 글번호
   TITLE  VARCHAR2(100) NOT NULL,  -- 제목
   CONTENTS VARCHAR2(3000) NOT NULL,  -- 글내용
   M_ID VARCHAR2(50) constraint M_ID_FK2 references MEMBER(M_ID) on delete cascade  --M_ID(FK)
);

CREATE SEQUENCE B_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;



CREATE TABLE COMMENTS (
   CO_NUM NUMBER(20) constraint CO_NUM_PK primary key, -- 댓글번호 */
   CONTENTS  VARCHAR2(100) NOT NULL,  -- 글내용 */
   RDATE DATE NOT NULL,  -- 날짜 */
   RCOUNT NUMBER(20) NOT NULL,  -- 추천수
   CR_NUM NUMBER(20), -- 작품번호
   EPI NUMBER(20) --회차
);
alter table COMMENTS add constraint COMMENTS_FK foreign key(CR_NUM, EPI) references CREATION(CR_NUM, EPI) on delete cascade;

CREATE SEQUENCE CO_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;



CREATE TABLE FILES (
   F_NUM NUMBER(20) constraint F_NUM_PK primary key, /* 파일번호 */
   DIVISION VARCHAR2(20),--파일구분
   FNAME VARCHAR2(100), --파일이름
   OFNAME VARCHAR2(100), --원본파일이름
   FSIZE NUMBER(30), --파일크기
   PATH VARCHAR2(200) NOT NULL, /* 파일경로 */
   CR_NUM NUMBER(20),  /* 작품번호*/
   EPI NUMBER(20)  /* 회차*/
);

alter table FILES add constraint FILES_FK foreign key(CR_NUM, EPI) references CREATION(CR_NUM, EPI) on delete cascade;

CREATE SEQUENCE F_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;
