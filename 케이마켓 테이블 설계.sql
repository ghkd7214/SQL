#날짜 : 2021/04/20
#이름 : 이지황
#내용 : 케이마켓 테이블 설계

#1차 카테고리
CREATE TABLE  `km_cate1` (
	`code1`	TINYINT PRIMARY KEY,
	`title`	VARCHAR(100)
);

#2차 카테고리
CREATE TABLE  `km_cate2` (
	`seq`		INT AUTO_INCREMENT PRIMARY KEY,
	`code1` 	TINYINT,
	`code2` 	TINYINT,
	`title`	VARCHAR(100)
);

#약관
CREATE TABLE  `km_term` (
	`terms`		TEXT,
	`privacy`	TEXT,
	`location`	TEXT,
	`finance`	TEXT,
	`tax`			TEXT
);

#회원
CREATE TABLE  `km_member` (
	`uid`			VARCHAR(20) PRIMARY KEY,
	`pass`		VARCHAR(255),
	`name`		VARCHAR(20),
	`gender`		TINYINT,
	`hp`			CHAR(13),
	`email`		VARCHAR(100),
	`type`		TINYINT,
	`point`		INT DEFAULT 0,
	`grade`		TINYINT DEFAULT 2,
	`zip`			CHAR(5),
	`add1`		VARCHAR(255),
	`add2`		VARCHAR(255),	
	`company`	VARCHAR(20),
	`ceo`			VARCHAR(20),
	`bizRegNum`	CHAR(12),
	`commRepNum`	VARCHAR(100),
	`tel`			VARCHAR(20),
	`manager`	VARCHAR(20),
	`managerHp`	CHAR(13),
	`fax`			VARCHAR(20),
	`ip`			VARCHAR(100),
	`leaveDate`	DATETIME,
	`rdate`		DATETIME,	
	`etc1`		INT,
	`etc2`		INT,
	`etc3`		VARCHAR(20),
	`etc4`		VARCHAR(20),
	`etc5` 		VARCHAR(20)
);

#포인트
CREATE TABLE  `km_member_point` (
	`seq`		INT AUTO_INCREMENT PRIMARY KEY,
	`uid`		VARCHAR(20),
	`code`	INT,
	`price`	INT,
	`point`	INT,
	`rdate`	DATETIME
);

#상품
CREATE TABLE  `km_product` (
	`code`		INT(10) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
	`cate1`		TINYINT,
	`cate2`		TINYINT,
	`name`		VARCHAR(100),
	`descript`	VARCHAR(100),
	`company`	VARCHAR(100),
	`seller`		VARCHAR(20),
	`price`		INT,
	`discount`	TINYINT DEFAULT 0,
	`point`		INT DEFAULT 0,	
	`stock`		INT DEFAULT 0,
	`sold`		INT DEFAULT 0,
	`delivery`	INT DEFAULT 0,
	`hit`			INT DEFAULT 0,
	`score`		INT DEFAULT 0,
	`review`		INT DEFAULT 0,
	`thumb1`		VARCHAR(255),
	`thumb2`		VARCHAR(255),
	`thumb3`		VARCHAR(255),
	`detail`		VARCHAR(255),
	`status`		VARCHAR(20) DEFAULT '새상품',
	`dutyFree`	VARCHAR(20) DEFAULT '과세상품',
	`receipt`	VARCHAR(60) DEFAULT '발행가능-신용카드전표,온라인 현금영수증',	
	`bizClass`	VARCHAR(20) DEFAULT '사업자 판매자',
	`origin`		VARCHAR(20) DEFAULT '국내산',
	`ip`			VARCHAR(100),
	`rdate`		DATETIME,
	`etc1`		INT,
	`etc2`		INT,
	`etc3`		VARCHAR(20),
	`etc4`		VARCHAR(20),
	`etc5`		VARCHAR(20)
);

#장바구니
CREATE TABLE  `km_product_cart` (
	`seq`			INT AUTO_INCREMENT PRIMARY KEY,
	`uid`			VARCHAR (20),
	`code`		INT,
	`name`		VARCHAR (100),
	`count`		INT,
	`price`		INT,
	`discount`	INT,
	`point`		INT,
	`delivery`	INT,
	`total`		INT,
	`rdate`		DATETIME
);

#결제
CREATE TABLE  `km_product_order` (
	`seq`			INT AUTO_INCREMENT PRIMARY KEY,
	`uid`			VARCHAR (20),
	`code`		INT,
	`name`		VARCHAR (100),
	`count`		INT,
	`price`		INT,
	`discount`	INT,
	`point`		INT,
	`delivery`	INT,
	`total`		INT,
	`payment`	TINYINT,
	`complete`	TINYINT,
	`rdate`		DATETIME
);

#리뷰 
CREATE TABLE  `km_product_review` (
	`seq`			INT AUTO_INCREMENT PRIMARY KEY,
	`code`		INT,
	`content`	VARCHAR(255),
	`uid`			VARCHAR(20),
	`rating`		INT,
	`ip`			VARCHAR(255),
	`rdate`		DATETIME
);