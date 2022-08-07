--유저
create table Users(
    userId varchar2(50) constraint PK_Users_userId primary key,     -- 유저 아이디
    userPwd varchar2(50) not null,                                  -- 유저 패스워드 
    userName varchar2(50) not null,                                 -- 유저 이름
    userAge number(3) constraint CK_Users_age check (userAge > 0 and userAge < 200),    --유저나이(나이 제한 0부터 200까지)
    userEmail varchar2(50) not null,                                -- 유저이메일
    userIntro varchar2(200)                                         -- 유저 자기소개(간단)
);

--게시판 테이블 생성
CREATE TABLE MP_BOARD(
    BNO NUMBER NOT NULL,
    TITLE VARCHAR2(100)     NOT NULL,
    CONTENT VARCHAR2(2000)  NOT NULL,
    WRITER VARCHAR2(100)    NOT NULL,
    REGDATE DATE            DEFAULT SYSDATE,
    PRIMARY KEY(BNO)
);

--게시판 번호 시퀀스 생성
CREATE SEQUENCE MP_BOARD_SEQ
START WITH 1
INCREMENT BY 1;

--게시판 더미 데이터 생성
INSERT INTO MP_BOARD(BNO, TITLE, CONTENT, WRITER)
     VALUES (MP_BOARD_SEQ.NEXTVAL, '제목입니다', '내용입니다', 'BTS');
INSERT INTO MP_BOARD(BNO, TITLE, CONTENT, WRITER)
     VALUES (MP_BOARD_SEQ.NEXTVAL, '안녕하세요', '호이', '뷔');
INSERT INTO MP_BOARD(BNO, TITLE, CONTENT, WRITER)
     VALUES (MP_BOARD_SEQ.NEXTVAL, '고기줘', '배고파', '정국');

--2배수 게시물 증가 쿼리
insert into mp_board(bno, title, content, writer)
select mp_board_seq.nextval, title, content, writer from mp_board;

--조회수 컬럼 추가
ALTER TABLE MP_BOARD ADD(HIT NUMBER DEFAULT 0);
COMMIT;

--답변 완료 컬럼 추가
ALTER TABLE MP_BOARD ADD(answer varchar(20) DEFAULT '답변대기');

--답변 완료 컬럼 삭제
ALTER TABLE MP_BOARD DROP COLUMN replyCom;

SELECT * FROM MP_BOARD order by bno desc;
COMMIT;

--댓글 테이블 생성
create table mp_reply (
    bno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    primary key(bno, rno)
);



--외래키 설정
alter table mp_reply add constraint mp_reply_bno foreign key(bno)
references mp_board(bno) on delete cascade;

SELECT * FROM mp_reply;
COMMIT;

--댓글 번호 시퀀스 생성
create sequence mp_reply_seq START WITH 1 MINVALUE 0;

--댓글 더미 데이터 생성
insert into mp_reply(bno, rno, content, writer)
    values(418, mp_reply_seq.nextval, '테스트댓글', '테스트 작성자');

select rno, content, writer, regdate
  from mp_reply
 where bno = 418;


--SID번호 확인
select name from v$database;


-----------------------------------------------------

UPDATE
    MP_BOARD A
SET
    ANSWER = '답변완료'
WHERE EXISTS (
    SELECT
        RNO
    FROM
        MP_REPLY B
    WHERE
        A.BNO = B.BNO
    );
--------------------------------------------------------
update MP_BOARD A
SET
    ANSWER = (
case
when exists
( select rno from MP_REPLY B where A.BNO = B.BNO) 
then '답변완료' else '답변대기' end);


--------------------------------------------------------
SELECT * FROM MP_BOARD order by bno desc;
commit;

-------------------------------------------------------------------------------------------
--팀장님작업(tours)

select * from tours;		--관광지
alter table tours add constraint pk_t_id primary key (t_id);

/* 외래키 작업*/

ALTER TABLE my_tourroute
ADD CONSTRAINT fk_t_id foreign KEY(t_id) references tours (t_id);

ALTER TABLE my_tourroute
ADD CONSTRAINT fk_userid foreign KEY(userid) references users (userid) on delete cascade;


--행정구역 테이블
create table city(
    c_name varchar2(100) primary key,
    c_ny number(38,8) not null,
    c_nx number(38,8) not null,
    c_pic varchar2(200)
);

-- 행정구역 데이터
insert into city values('강원도',37.555837,128.209315,'강원도.jpg');
insert into city values('경기도',37.567167,127.190292,'경기도.jpg');
insert into city values('경상남도',35.259787,128.664734,'경상남도.jpg');
insert into city values('경상북도',36.248647,128.664734,'경상북도.jpg');
insert into city values('충청남도',36.557229,126.779757,'충청남도.jpg');
insert into city values('충청북도',36.628503,127.929344,'충청북도.jpg');
insert into city values('서울특별시',37.540705,126.956764,'서울특별시.jpg');
insert into city values('광주광역시',35.126033,126.831302,'광주광역시.jpg');
insert into city values('대구광역시',35.798838,128.583052,'대구광역시.jpg');
insert into city values('대전광역시',36.321655,127.378953,'대전광역시.jpg');
insert into city values('부산광역시',35.198362,129.053922,'부산광역시.jpg');
insert into city values('울산광역시',35.519301,129.239078,'울산광역시.jpg');
insert into city values('인천광역시',37.469221,126.573234,'인천광역시.jpg');
insert into city values('전라북도',35.716705,127.144185,'전라북도.jpg');
insert into city values('전라남도',34.819400,126.893113,'전라남도.jpg');
insert into city values('제주특별자치도',33.364805,126.542671,'제주특별자치도.jpg');

select * from city;
SELECT * FROM tours where t_city = '제주특별자치도';
commit;

--나의 일정 테이블
create table my_route(
    mr_id number primary key,
    title varchar2(200) not null,
    dp_name varchar2(100) not null,
    dp_ny number(38,8) not null,
    dp_nx number(38,8) not null,
    
    t_name1 varchar2(100), 
    t_ny1 number(38,8), 
    t_nx1 number(38,8), 
    
    t_name2 varchar2(100),
    t_ny2 number(38,8),
    t_nx2 number(38,8),
    
    t_name3 varchar2(100),
    t_ny3 number(38,8),
    t_nx3 number(38,8),
    
    ep_name varchar2(100),
    ep_ny number(38,8),
    ep_nx number(38,8),
    
    contents varchar2(2400),
    userId varchar2(50),
    
    hit number	--조회수
);

alter table my_route add t_intro1 VARCHAR2(2400);
alter table my_route add t_intro2 VARCHAR2(2400);
alter table my_route add t_intro3 VARCHAR2(2400);


commit;

select * from festival;
select * from tours;
delete festival where f_ny is null or f_nx is null;	--null값 다 제거

alter table my_route add(hit number default 0); -- 조회수 컬럼 추가

alter table my_route add reply_count number default 0;	-- 댓글 컬럼 추가

--나의 일정 게시판 댓글
create table mr_reply(
    mr_no number primary key,          -- 댓글 번호
    mr_bno number not null,            -- 댓글달 게시물 번호
    constraint fk_reply_bno foreign key(mr_bno) references my_route(mr_id)
    on delete cascade,
    mr_writer varchar2(50) not null,   -- 댓글 작성자
    constraint fk_reply_writer foreign key(mr_writer) references users(userid)
    on delete cascade,
    mr_content varchar2(1000),     -- 댓글 내용
    mr_regdate date default sysdate   --댓글 작성 날짜
);

--댓글 시퀀스
create sequence mrreply_seq
    minvalue 1
    maxvalue 99999
    increment by 1
    start with 1    
    nocache
    noorder
    nocycle;
    
-- 좋아요!!!!
create table heart(
    heartid number primary key,
    mr_id number not null,
    userid varchar2(50) not null,
    heart number default 0,
    constraint fk_mlid foreign key(userid) references users(userid) on delete cascade,
    constraint fk_mlbid foreign key(mr_id) references my_route(mr_id) on delete cascade
);   
-- 경로게시물 좋아요수 컬럼 추가
alter table my_route add like_count number default 0;

-- 좋아요 시퀀스
create sequence mrlike_seq
    minvalue 1
    maxvalue 99999
    increment by 1
    start with 1    
    nocache
    noorder
    nocycle;
    
-- 프로필사진
CREATE TABLE MP_FILE
(
    FILE_NO NUMBER,                         --파일 번호
    userId VARCHAR2(50) NOT NULL,                    --게시판 번호
    ORG_FILE_NAME VARCHAR2(260) NOT NULL,   --원본 파일 이름
    STORED_FILE_NAME VARCHAR2(36) NOT NULL, --변경된 파일 이름
    FILE_SIZE NUMBER,                       --파일 크기
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,--삭제구분
    PRIMARY KEY(FILE_NO)                    --기본키 FILE_NO
);

CREATE SEQUENCE SEQ_MP_FILE_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

ALTER TABLE mp_file
ADD CONSTRAINT uk_STORED_FILE_NAME unique(STORED_FILE_NAME);

alter table users add STORED_FILE_NAME VARCHAR2(36);
desc users;