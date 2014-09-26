CREATE TABLE Comments
(
	id int identity(1,1) primary key,
	commentId varchar(255) ,
	videoId varchar(255),
	name varchar(255),
	comment text,
	sentiment varchar(2) default '-'	
);

drop table Comments
select * from Comments;
select * from youtube;
CREATE TABLE WORDNET
(
	id int identity(1,1) primary key,
	word varchar(255),
	positive float,
	negative float
);

delete from WORDNET where positive=0 and negative=0
