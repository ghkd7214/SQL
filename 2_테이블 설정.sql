#날짜 : 2021/03/23
#이름 : 이지황
#내용 : SQL 기본 실습하기

#실습하기 2-1
CREATE DATABASE `MyDB`;
DROP DATABASE `MyDB`;

#실습하기 2-2
CREATE TABLE `USER1`(
	`uid` 	VARCHAR(10),  #가변
	`name`	VARCHAR(10),
	`hp`		CHAR(13),		
	`age`		TINYINT

);

DROP TABLE `USER1`
 
#실습하기 2-3
INSERT INTO `USER1` VALUES ("A101","김유신","010-1234-1111",25);
INSERT INTO `USER1` VALUES ("A102","김춘추","010-1234-2222",23);
INSERT INTO `USER1` VALUES ("A103","장보고","010-1234-3333",32);
INSERT INTO `USER1` (age,name,uid,hp) VALUES(45,"강감찬","A104","010-1234-4444");
INSERT INTO `USER1` SET NAME="이순신",age=51,hp="010-1234-5555",uid="A105";

#실습하기 2-4
SELECT * FROM `USER1`;

#실습하기 2-5
UPDATE `USER1` SET hp="010-123-1234";
UPDATE `USER1` SET `uid`="B101",`name`="홍길동";
UPDATE `USER1` SET uid="A101",name="김유신" WHERE age=25;
UPDATE `USER1` SET uid="A102",NAME="김춘추", hp="010-1234-2222" WHERE age=23;

#실습하기 2-6
DELETE FROM `USER1` WHERE uid="A101";
DELETE FROM `USER1` WHERE uid="A102" AND age=25;
DELETE FROM `USER1` WHERE age>=40;

#실습하기 3-1
CREATE TABLE `USER2`(
	`uid`		VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10),
	`hp`		CHAR(13),
	`age`		TINYINT
);

INSERT INTO `USER2` VALUES ("A101","김유신","010-1234-1111",25);
INSERT INTO `USER2` VALUES ("A102","김춘추","010-1234-2222",23);
INSERT INTO `USER2` VALUES ("A103","장보고","010-1234-3333",32);
INSERT INTO `USER2` VALUES ("A104","강감찬","010-1234-1111",32);

#실습하기 3-2
CREATE TABLE `USER3`(
	`uid`		VARCHAR(10) PRIMARY KEY, 	#기본기
	`name`	VARCHAR(10),	
	`hp`		CHAR(13) UNIQUE,	 	 		#고유키
	`age`		TINYINT
);

INSERT INTO `USER3` VALUES ("A101","김유신","010-1234-1111",25);
INSERT INTO `USER3` VALUES ("A102","김춘추","010-1234-2222",23);
INSERT INTO `USER3` VALUES ("A103","장보고","010-1234-3333",32);
INSERT INTO `USER3` VALUES ("A104","강감찬","010-1234-4444",32);
INSERT INTO `USER3` (`uid`,`name`,`age`) VALUES ("A105","이순신",32); #고유키는 null값입력 가능

SELECT * FROM `USER3`

#실습하기 3-3
CREATE TABLE `USER4`(
	`seq` 		INT AUTO_INCREMENT PRIMARY KEY,  
	`name`		VARCHAR(10),
	`gender` 	TINYINT,
	`age` 		TINYINT,
	`addr`		VARCHAR(255)
)

INSERT INTO `USER4` (`name`, `gender`, `age`, `addr`)VALUES ("강감찬",1,32,"김해시");
INSERT INTO `USER4` (`name`, `gender`, `age`, `addr`)VALUES ("강감찬",1,32,"김해시");

DELETE FROM `USER4` WHERE `seq`= 3;

SELECT * FROM `USER4`

#실습하기 3-4
CREATE TABLE `USER5` SELECT * FROM `USER4`; #데이터만 복사함(제약조건은 복사안함)

#실습하기 3-5
CREATE TABLE `USER6` LIKE `USER4`; #제약조건의 구조만 복사함(데이터는 복사안함)

#실습하기 3-6
INSERT INTO `USER6` SELECT * FROM `USER4`;

INSERT INTO `USER6` (`name`, `gender`, `age`, `addr`)
SELECT `name`, `gender`, `age` ,`addr` FROM `USER4`;