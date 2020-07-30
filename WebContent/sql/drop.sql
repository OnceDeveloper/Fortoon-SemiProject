--시퀀스 삭제

drop sequence CR_NUM_SEQ;
drop sequence L_NUM_SEQ;
drop sequence B_NUM_SEQ;

drop sequence CO_NUM_SEQ;
drop sequence A_NUM_SEQ;
drop sequence F_NUM_SEQ;

--테이블 삭제

drop table FILES;
drop table COMMENTS;
drop table BOARD;
drop table LOOK_CREATION;
drop table CREATION;
drop table MEMBER;

purge recyclebin;

-- 확인 
select TNAME from TAB;


