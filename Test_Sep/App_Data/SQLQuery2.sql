create table popularity(
	candid varchar(50) primary key,
	youtubeLikes int,
	youtubeDislikes int,
	fblikes int,
	tweets int	
)

insert into popularity values('Jamie',3003,834,757,230);
insert into popularity values('Lee',600,153,78,354);
insert into popularity values('Rachael',2189,739,123,876);
insert into popularity values('Jai',348,602,465,657);
insert into popularity values('Jade Mayjean',862,378,878,566);
insert into popularity values('Gemyni',349,803,979,98);
insert into popularity values('Amelia',1490,344,879,678);
insert into popularity values('Femi',387,490,768,989);
insert into popularity values('Jimmy',599,800,343,943);
insert into popularity values('Joe',734,802,425,486);
insert into popularity values('Leo',1500,35,768,568);


insert into popularity values('Christina',1584,302,75,645);
insert into popularity values('Chris',347,802,566,68);
insert into popularity values('Emily',742,793,756,25);
insert into popularity values('Max',349,490,68,68);
insert into popularity values('Jazz',343,983,46,345);
insert into popularity values('Beth',394,803,567,232);
insert into popularity values('Jessica',304,345,456,389);
insert into popularity values('Jamie Lovatt',480,57,467,797);
insert into popularity values('Kelsey',900,35,578,746);
insert into popularity values('Tila&Tavelah',500,35,47,57);

insert into popularity values('Sally',2004,35,964,57);
insert into popularity values('Bizzy',359,942,546,563);
insert into popularity values('Georgia',454,809,467,248);
insert into popularity values('Melissa',400,545,43,56);
insert into popularity values('Celestine',3490,23,434,588)
insert into popularity values('Kenny',798,534,497,932);
insert into popularity values('Mairead',470,23,324,789);
insert into popularity values('Steven',349,202,375,16);
insert into popularity values('Talia',554,40,33,488);
insert into popularity values('Leverne',598,543,347,273);
insert into popularity values('Elesha',254,222,33,82);
insert into popularity values('Gary',500,24,36,539);
insert into popularity values('Vicky',380,35,58,99);

insert into popularity values('Jermain',453,490,495,793);
insert into popularity values('Sophie',640,345,246,508);
insert into popularity values('Iesher',145,403,474,88);
insert into popularity values('Kiki',465,400,234,975);
insert into popularity values('Cherri',415,503,890,334);
insert into popularity values('Sarah',657,735,454,75);
insert into popularity values('Jamie2',457,535,38,745);
insert into popularity values('Anna',956,35,595,568);
insert into popularity values('Callum',156,35,548,754);






select * from popularity;

drop table popularity;