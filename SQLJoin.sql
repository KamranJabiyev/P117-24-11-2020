drop table Students

create table Students(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Surname nvarchar(100),
	Email nvarchar(200) unique
)

insert into Students
values('Vasif','Xammedov','v@code.az'),
		('Melek','Muxtarli','m@code.az')

Select * from Students

--INSERT INTO Students (Surname,Email)
--values('Testov','t@code.az')

--INSERT INTO Students
--values('Kamran','Nebiyev','v@code.az')

CREATE TABLE GroupTypes(
	Id int primary key identity,
	Name nvarchar(50) not null
)

CREATE TABLE Groups(
	Id int primary key identity,
	Name nvarchar(50) not null,
	MaxSize int check(MaxSize<=18),
	GroupTypesId int references GroupTypes(Id)
)

SELECT * FROM Groups

SELECT * FROM GroupTypes

--inner join
SELECT g.Name 'Group',MaxSize,gt.Name 'Type' FROM Groups g
INNER JOIN GroupTypes gt
ON
g.GroupTypesId=gt.Id

--left outer join
SELECT * FROM Groups g
LEFT OUTER JOIN GroupTypes gt
ON
g.GroupTypesId=gt.Id

--right outer join
SELECT * FROM Groups g
RIGHT OUTER JOIN GroupTypes gt
ON
g.GroupTypesId=gt.Id

--full outer join
SELECT * FROM Groups g
FULL OUTER JOIN GroupTypes gt
ON
g.GroupTypesId=gt.Id


--self join
CREATE TABLE Positions(
	Id int primary key identity,
	Position nvarchar(200) not null,
	Dependency int
)

SELECT p1.Position,p2.Position 'Dependency' FROM Positions p1
LEFT JOIN Positions p2
ON
p1.Dependency=p2.Id

--non-equal join
ALTER TABLE Students
ADD Mark int

CREATE TABLE Grades(
	Id int primary key identity,
	Letter char not null,
	MinGrade int,
	MaxGrade int,
)

SELECT Name,Surname,Email,Mark,Letter FROM Students st
JOIN Grades gr
ON
st.Mark BETWEEN gr.MinGrade AND gr.MaxGrade

--cross join
CREATE TABLE Products(
	Id int primary key identity,
	Name nvarchar(100)
)

CREATE TABLE Sizes(
	Id int primary key identity,
	Size varchar(10)
)

SELECT Name,Size FROM Products
CROSS JOIN Sizes