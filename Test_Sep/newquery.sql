select *  from contestant

drop table round

select * from leaders

select * from twitter

select * from eliminated

Select * from contestant where teamID=1

select contestantID from contestant where contestantName='christina'
select contestantID from contestant where contestantName='Jamie'

Delete from contestant where contestantID='3'

create table twitter(
	contestantID int,
	date varchar(100),
	tweets int,
	CONSTRAINT pk_twitter PRIMARY KEY (contestantID,date)
)

create table eliminated(
	contestantID int,
	roundName varchar(100),
	startDate varchar(100),
	episodeNo int,
	releaseDate varchar(100),
	CONSTRAINT pk_eliminated PRIMARY KEY (contestantID,roundName)
)

insert into twitter values(1,'8/3/2014',15600)
insert into twitter values(4,'8/3/2014',5600)
insert into twitter values(6,'8/3/2014',15000)
insert into twitter values(9,'8/3/2014',1700)
insert into twitter values(13,'8/3/2014',12600)
insert into twitter values(14,'8/3/2014',15670)
insert into twitter values(15,'8/3/2014',5650)

insert into twitter values(1,'7/27/2014',13600)
insert into twitter values(4,'7/27/2014',2600)
insert into twitter values(6,'7/27/2014',13000)
insert into twitter values(9,'7/27/2014',1500)
insert into twitter values(13,'7/27/2014',9600)
insert into twitter values(14,'7/27/2014',11670)
insert into twitter values(15,'7/27/2014',4650)

insert into twitter values(1,'7/20/2014',7600)
insert into twitter values(4,'7/20/2014',1600)
insert into twitter values(6,'7/20/2014',8000)
insert into twitter values(9,'7/20/2014',1200)
insert into twitter values(13,'7/20/2014',7600)
insert into twitter values(14,'7/20/2014',8670)
insert into twitter values(15,'7/20/2014',2650)


