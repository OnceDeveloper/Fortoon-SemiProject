CREATE TABLE MEMBER(
   M_ID VARCHAR2(50) constraint M_ID_PK primary key,   --  ID 
   NAME VARCHAR(50),  -- �̸�
   BIRTH VARCHAR(20),  -- �������
   PHONE VARCHAR2(50),  -- �޴���ȭ
   PWD VARCHAR2(50)  -- ��й�ȣ
);


CREATE TABLE CREATION (
   CR_NUM NUMBER(20), --  ��ǰ��ȣ
   EPI NUMBER(20), --ȸ��
   DIVISION VARCHAR2(20) NOT NULL,   -- ����(����/�Ҽ�)
   AGE_GRADE NUMBER(10)  NOT NULL,   -- ���ɵ��
   GENRE VARCHAR2(20) NOT NULL,  -- �帣
   TITLE VARCHAR2(100) NOT NULL,  -- ����
   PLOT VARCHAR2(1000), --�ٰŸ�
   RDATE DATE,  -- �����
   LCOUNT NUMBER(10),  -- ��ȸ��
   M_ID VARCHAR2(50) constraint M_ID_FK references MEMBER(M_ID) on delete cascade -- M_ID(FK)
);
alter table CREATION add constraint CREATION_PK primary key(CR_NUM, EPI);

CREATE SEQUENCE CR_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;



CREATE TABLE LOOK_CREATION (
   L_NUM NUMBER(20) constraint L_NUM_PK2 primary key, --  ��ȸ��ǰ��ȣ
   M_ID VARCHAR2(50) constraint M_ID5_FK references MEMBER(M_ID) on delete cascade, -- M_ID(FK)
   CR_NUM NUMBER(20), -- ��ǰ��ȣ
   EPI NUMBER(20) --ȸ��
);
alter table LOOK_CREATION add constraint LOOK_CREATION_FK foreign key(CR_NUM, EPI) references CREATION(CR_NUM, EPI) on delete cascade;

CREATE SEQUENCE  L_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;



CREATE TABLE BOARD(
   B_NUM NUMBER constraint B_NUM_PK primary key, -- �۹�ȣ
   TITLE  VARCHAR2(100) NOT NULL,  -- ����
   CONTENTS VARCHAR2(3000) NOT NULL,  -- �۳���
   M_ID VARCHAR2(50) constraint M_ID_FK2 references MEMBER(M_ID) on delete cascade  --M_ID(FK)
);

CREATE SEQUENCE B_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;



CREATE TABLE COMMENTS (
   CO_NUM NUMBER(20) constraint CO_NUM_PK primary key, -- ��۹�ȣ */
   CONTENTS  VARCHAR2(100) NOT NULL,  -- �۳��� */
   RDATE DATE NOT NULL,  -- ��¥ */
   RCOUNT NUMBER(20) NOT NULL,  -- ��õ��
   CR_NUM NUMBER(20), -- ��ǰ��ȣ
   EPI NUMBER(20) --ȸ��
);
alter table COMMENTS add constraint COMMENTS_FK foreign key(CR_NUM, EPI) references CREATION(CR_NUM, EPI) on delete cascade;

CREATE SEQUENCE CO_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;



CREATE TABLE FILES (
   F_NUM NUMBER(20) constraint F_NUM_PK primary key, /* ���Ϲ�ȣ */
   DIVISION VARCHAR2(20),--���ϱ���
   FNAME VARCHAR2(100), --�����̸�
   OFNAME VARCHAR2(100), --���������̸�
   FSIZE NUMBER(30), --����ũ��
   PATH VARCHAR2(200) NOT NULL, /* ���ϰ�� */
   CR_NUM NUMBER(20),  /* ��ǰ��ȣ*/
   EPI NUMBER(20)  /* ȸ��*/
);

alter table FILES add constraint FILES_FK foreign key(CR_NUM, EPI) references CREATION(CR_NUM, EPI) on delete cascade;

CREATE SEQUENCE F_NUM_SEQ START WITH 0 MINVALUE 0 INCREMENT BY 1 NOCACHE;
