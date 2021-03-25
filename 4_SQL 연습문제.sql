#날짜 : 2021/03/25
#이름 : 이지황
#내용 : SQL 연습문제

#실습1
CREATE TABLE `Book`(
	`bookid`		INT AUTO_INCREMENT PRIMARY KEY,	
	`bookname`	VARCHAR(30),
	`publisher`	VARCHAR(10),
	`price`		INT
);

INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("축구의 역사","굿스포츠",7000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("축구아는 여자","나무수",13000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("축구의 이해","대한미디어",22000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("골프 바이블","대한미디어",35000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("피겨 교본","굿스포츠",8000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("역도 단계별기술","굿스포츠",6000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("야구의 추억","이상미디어",20000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("야구를 부탁해","이상미디어",13000);
INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("올림픽 이야기","삼성당",7500);
INSERT INTO `Book` (`bookname`, `publisher`, `price`)VALUES ("Olympic Champions","Pearson",13000);

#실습2
CREATE TABLE `Customer`(
	`custid`		INT AUTO_INCREMENT PRIMARY KEY,	
	`name`		VARCHAR(10),
	`address`	VARCHAR(20),
	`phone`		CHAR(13)
);

INSERT INTO `Customer` (`name`,`address`, `phone`)VALUES ("박지성","영국 맨체스타","000-5000-0001");
INSERT INTO `Customer` (`name`,`address`, `phone`)VALUES ("김연아","대한민국 서울","000-6000-0001");
INSERT INTO `Customer` (`name`,`address`, `phone`)VALUES ("장미란","대한민국 강원도","000-7000-0001");
INSERT INTO `Customer` (`name`,`address`, `phone`)VALUES ("추신수","미국 클리블랜드","000-8000-0001");
INSERT INTO `Customer` (`name`,`address`)VALUES ("박세리","대한민국 대전");

#실습3
CREATE TABLE `Orders`(
	`orderid`	INT AUTO_INCREMENT PRIMARY KEY,	
	`custid`		INT,
	`bookid`		INT,
	`saleprice`	INT,
	`orderdate` DATE
);

INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (1,1,6000,'2014-07-01');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (1,3,21000,'2014-07-03');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (2,5,8000,'2014-07-03');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (3,6,6000,'2014-07-04');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (4,7,20000,'2014-07-05');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (1,2,12000,'2014-07-07');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (4,8,13000,'2014-07-07');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (3,10,12000,'2014-07-08');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (2,10,7000,'2014-07-09');
INSERT INTO `Orders` (`custid`, `bookid`, `saleprice`, `orderdate`)VALUES (3,8,13000,'2014-07-10');


#실습4
#실습5
SELECT * FROM Book;

#실습6
SELECT DISTINCT `publisher` FROM Book;  #중복된거 합쳐줌

#실습7
SELECT * FROM Book WHERE `price`<=20000;

#실습8
SELECT * FROM Book WHERE `price`>=10000 AND `price`<=20000;
SELECT * FROM Book WHERE `price` BETWEEN 10000 AND 20000;

#실습9
SELECT * FROM Book WHERE `publisher`="굿스포츠" OR `publisher`= "대한미디어";
SELECT * FROM Book WHERE `publisher` IN("굿스포츠","대한미디어");

#실습10
SELECT `publisher` FROM Book WHERE `bookname`="축구의 역사";

#실습11
SELECT `publisher` FROM Book WHERE `bookname` LIKE '%축구%';

#실습12
SELECT * FROM Book WHERE `bookname` LIKE '_구%';

#실습13
SELECT * FROM Book WHERE `bookname` LIKE '%축구%' AND `price` >= 20000;

#실습14
SELECT * FROM Book ORDER BY `bookname`;

#실습15
SELECT * FROM Book ORDER BY `price`,`bookname`;

#실습16
SELECT * FROM Book ORDER BY `price` DESC,`publisher`;

#실습17
SELECT SUM(`saleprice`) AS '총판매액' FROM `Orders`;

#실습18
SELECT SUM(`saleprice`) AS '총판매액' FROM `Orders` WHERE `custid`=2;

#실습19
SELECT 
	SUM(`saleprice`) AS '총판매액',
	AVG(`saleprice`) AS '평균값',
	MIN(`saleprice`) AS '최소값',
	MAX(`saleprice`) AS '최대값'
FROM `Orders`;

#실습20
SELECT COUNT(*) AS '판매건수' FROM `Orders`;

#실습21
SELECT `custid` , COUNT(*)AS '수량'
FROM `Orders`
WHERE `saleprice` >=8000
GROUP BY `custid`
HAVING `수량` >= 2;

#실습22
SELECT * FROM `Customer` AS a
JOIN `Orders` AS b
ON a.custid = b.custid;

#실습23
SELECT * FROM `Customer` AS a
JOIN `Orders` AS b
ON a.custid = b.custid
ORDER BY a.custid;

#실습24
SELECT a.`name`,b.`saleprice` FROM `Customer` AS a
JOIN `Orders` AS b
USING(`custid`);

#실습25
SELECT * FROM `Customer` AS a
JOIN `Orders` AS b 
ON a.custid = b.custid
GROUP BY a.`name`
ORDER BY a.`name`;

#실습26
SELECT a.`name`, c.`bookname` FROM `Customer` AS a 
JOIN `Orders` AS b ON a.custid = b.custid
JOIN `Book`	 AS c ON b.bookid = c.bookid;

#실습27
SELECT a.`name`, c.`bookname` FROM `Customer` AS a 
JOIN `Orders` AS b ON a.custid = b.custid
JOIN `Book`	 AS c ON b.bookid = c.bookid
WHERE b.saleprice = 20000;

#실습28
SELECT `bookname` FROM `Book` ORDER BY `price` DESC LIMIT 1;
	# 두개같음
SELECT `bookname` FROM `Book` WHERE `price`=(SELECT MAX(`price`) FROM `Book`);

#실습29
INSERT INTO `Book` (`bookname`, `publisher`, `price`)
VALUES ('스포츠의학', '한솔의학서적', 90000);

#실습30
INSERT INTO `Book` (`bookname`, `publisher`)
VALUES ('스포츠의학', '한솔의학서적');

#실습31
UPDATE `Customer` 
SET `address`='대한민국 부산'
WHERE `custid`=5;

#실습32
DELETE FROM `Customer` WHERE `custid`=5;