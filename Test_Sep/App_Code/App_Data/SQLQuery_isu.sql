create database VisualAnalytic1;

create table round
(
	roundID int,
	episode int,
	roundName varchar(50),
	noOfParticipants int,
	noOfEliminations int,
	
	constraint pk_round primary key(roundID, episode),
);

drop table round;

create table contestant
(
	contestantID int,
	contestantName varchar(80),
	gender varchar(6),
	age int,
	hometown varchar(100),
	country varchar(100),
	image varchar(250),
	description varchar(250),
	fbPageUrl varchar(250),
	fbLikes int,
	fbTalking int,
	twitterPageUrl varchar(250),
	teamID int,
	roundID int,
	episode int,
	
	constraint pk_contestant primary key(contestantID),
	constraint fk1_contestant foreign key(roundID,episode) references round(roundID,episode)
);

select * from contestant;