--시퀀스를 생성할 때에는 'SEQ_'로 시작하는 것이 일반적입니다.
CREATE SEQUENCE SEQ_BOARD;

--테이블 생성시 'TBL_'로 시작하거나 'T_'와 같이 시작하는 것이 일반적입니다.
CREATE TABLE TBL_BOARD(
	BNO NUMBER(10),
	TITLE VARCHAR2(2000) NOT NULL,
	CONTENT VARCHAR2(2000) NOT NULL,
	WRITER VARCHAR2(100) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE,
	CONSTRAINT PK_BOARD PRIMARY KEY(BNO)
);

SELECT * FROM tbl_board ORDER BY bno DESC;

SELECT * FROM TBL_BOARD;
--더미 데이터 (테이블 생성시 넣는 의미 없는 데이터를 토이 데이터(toy data) 혹은 더미 데이터(dummy data)라고 합니다.
INSERT INTO TBL_BOARD (BNO, TITLE, CONTENT, WRITER)
VALUES (SEQ_BOARD.NEXTVAL, '한동석 테스트', '내용 테스트', 'user03');

INSERT INTO TBL_BOARD (BNO, TITLE, CONTENT, WRITER)
(SELECT SEQ_BOARD.NEXTVAL, TITLE, CONTENT, WRITER FROM TBL_BOARD);

----------------------------------------REPLY-----------------------------------------------
CREATE SEQUENCE SEQ_REPLY;

CREATE TABLE TBL_REPLY (
	RNO NUMBER(10),
	BNO NUMBER(10) NOT NULL,
	REPLY VARCHAR2(2000) NOT NULL,
	REPLYER VARCHAR2(100) NOT NULL,
	REPLYDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE
);

ALTER TABLE TBL_REPLY ADD CONSTRAINT PK_REPLY PRIMARY KEY(RNO);
ALTER TABLE TBL_REPLY ADD CONSTRAINT FK_REPLY_BOARD FOREIGN KEY (BNO) REFERENCES TBL_BOARD(BNO);

SELECT * FROM TBL_REPLY;

INSERT INTO TBL_REPLY (RNO, BNO, REPLY, REPLYER)
(SELECT SEQ_REPLY.NEXTVAL, BNO, REPLY, REPLYER FROM TBL_REPLY WHERE BNO = 34896);


CREATE TABLE TBL_USER (
	ID VARCHAR2(50),
	PASSWORD VARCHAR2(50) NOT NULL,
	NAME VARCHAR2(100) NOT NULL,
	POINT NUMBER(10) DEFAULT 0,
	CONSTRAINT PK_ID PRIMARY KEY (ID)
);

INSERT INTO TBL_USER (ID, PASSWORD, NAME)
VALUES ('user04', '1234', 'Quick Silver');

ALTER TABLE TBL_USER ADD (SESSIONKEY VARCHAR2(50) DEFAULT 'NONE');
ALTER TABLE TBL_USER ADD (SESSIONLIMIT DATE);