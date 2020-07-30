-- MEMBER(회원) insert
insert into MEMBER values('aaa', '김민정', '900404', '010-2343-2222', '1234');
insert into MEMBER values('bbb', '김수환', '941204', '010-2343-1234', '1234');
insert into MEMBER values('ccc', '김민정', '900404', '010-5454-2222', '1234');



-- CREATION(작품) inert
insert into CREATION values(CR_NUM_SEQ.nextval, 1, '웹툰', 19, '스릴러', '악몽',
	'악몽의 줄거리다 이준 입학식 도중, 괴현상에 휘말려 죽음을 맞게 되는데 당신은 죽었습니다.체크 포인트에서 다시 시작합니다.',
	 SYSDATE, 7, 'aaa' );
insert into CREATION values(CR_NUM_SEQ.nextval, 1, '웹툰', 19, '스릴러', '전생 검신',
	'전생 검신의 줄거리다 입학식 도중, 괴현상에 휘말려 죽음을 맞게 되는데 당신은 죽었습니다.체크 포인트에서 다시 시작합니다.',
	SYSDATE, 8, 'aaa' );
insert into CREATION values(CR_NUM_SEQ.nextval, 1, '소설', 19, '스릴러', '괴담 동아리',
	'평범한 고등학생 이준 입학식 도중, 괴현상에 휘말려 죽음을 맞게 되는데 당신은 죽었습니다.체크 포인트에서 다시 시작합니다.',
	SYSDATE, 10, 'aaa' );
insert into CREATION values(CR_NUM_SEQ.nextval, 1, '소설', 15, '판타지', '검술명가 막내아들',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );

insert into CREATION values(CR_NUM_SEQ.nextval, 1, '소설', 15, '판타지', '검술명가 막내아들2',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );
insert into CREATION values(CR_NUM_SEQ.nextval, 1, '소설', 15, '판타지', '검술명가 막내아들3',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );
insert into CREATION values(CR_NUM_SEQ.nextval, 1, '소설', 15, '판타지', '검술명가 막내아들4',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );

				--고유번호	       회차
insert into CREATION values(CR_NUM_SEQ.nextval, 1, '웹툰', 15, '판타지', '검술명가 막내아들5',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );
	insert into CREATION values(8, 2, '웹툰', 15, '판타지', '검술명가 막내아들5',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );
	insert into CREATION values(8, 3, '웹툰', 15, '판타지', '검술명가 막내아들5',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );
	insert into CREATION values(8, 4, '웹툰', 15, '판타지', '검술명가 막내아들5',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );
	insert into CREATION values(CR_NUM_SEQ.currval, 4, '웹툰', 15, '판타지', '검술명가 막내아들5',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );




insert into CREATION values(CR_NUM_SEQ.nextval, 1, '웹툰', 15, '판타지', '검술명가 막내아들6',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );
insert into CREATION values(CR_NUM_SEQ.nextval, 1, '웹툰', 15, '판타지', '검술명가 막내아들7',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );
insert into CREATION values(CR_NUM_SEQ.nextval, 1, '소설', 15, '판타지', '소설이다',
	'진 룬칸델. 대륙 최고의 검술명가, 룬칸델의 막내아들. 룬칸델 역사상 최악의 둔재.비참하게 쫓겨나 허무한 최후를 맞이한 그에게 다시 한 번 기회가 주어졌다.“너는 이 힘을 어떻게 사용하고 싶더냐?”“저를 위해 사용하고 싶습니다.”',
	SYSDATE, 9, 'aaa' );


--FILES(작품) insert
insert into FILES values(F_NUM_SEQ.nextval, 'thumb',' ', ' ', 100, ' ', 1, 1);
insert into FILES values(F_NUM_SEQ.nextval, 'content', ' ', ' ', 100, ' ', 2, 1);
insert into FILES values(F_NUM_SEQ.nextval, 'thumb',' ', ' ', 100, ' ', 3, 1);
			--파일번호, 파일이름, 원본파일이름, 파일크기, 파일경로, 작품번호, 회차

--COMMENTS(댓글) insert
insert into COMMENTS values(CO_NUM_SEQ.nextval, '재미있네요...',  SYSDATE, 8, 1, 1);
insert into COMMENTS values(CO_NUM_SEQ.nextval, '다음회는 언제..',  SYSDATE, 4, 2, 1);
insert into COMMENTS values(CO_NUM_SEQ.nextval, '재미 없네요...',  SYSDATE, 2, 3, 1);
