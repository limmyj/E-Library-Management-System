-- Create a new database named Elibrary

(
	Book_ID nvarchar(50) PRIMARY KEY,
	ISBN nvarchar(50),
	Title nvarchar(50),
	Author nvarchar(50),
	Book_Description nvarchar(50),
	Genre nvarchar(50),
	Category nvarchar(50) FOREIGN KEY REFERENCES Loan_Period(Category), 
	Publisher nvarchar(50),
	Date_Published date,CREATE DATABASE Elibrary

-- Create a table named Member which records basic information of members
CREATE TABLE Member
(
	Member_ID nvarchar(50) PRIMARY KEY,
	Name nvarchar(50),
	Address nvarchar (50),
	Contact nvarchar(50),
	Status nvarchar(50)
)

-- Insert values and records into the Member table
INSERT INTO Member
(Member_ID, Name, Address, Contact, Status)
VALUES
('M00001', 'June', 'Bukit Jalil', '0123456789', 'Inactive'),
('M00002', 'Darren', 'Semenyih', '0122468102', 'Inactive'),
('M00003', 'Mil', 'Connaught', '0178476397', 'Active'),
('M00004', 'Jiun', 'Bukit Jalil', '0128796654', 'Inactive'),
('M00005', 'Samson', 'Labuan', '0126367489', 'Inactive'),
('M00006', 'Mike', 'Cheras', '0167899*453', 'Inactive'),
('M00007', 'Mawar', 'Sungai Besi', '0126357896', 'Inactive'),
('M00008', 'Naomi', 'Subang', '0123453452', 'Inactive'),
('M00009', 'Charlotte', 'Puchong', '0128876377', 'Inactive'),
('M00010', 'Michelle', 'Klang', '0122092870', 'Active')

-- Create a table named Book which records all the information of books in the Elibrary
CREATE TABLE Book
	Book_Status nvarchar(50)
)
-- Insert values into the Book table
INSERT INTO Book
(Book_ID, ISBN, Title, Author, Book_Description, Genre, Category, Publisher, Date_Published, Book_Status)
VALUES
('B00001', '0-545-01022-5', 'Pi', 'Jason', 'A book about young boy survives with a tiger.', 'Novel', 'Yellow', 'J&T', '19990706', 'Loaned'),
('B00002', '0-377-86478-7', 'Apple', 'Abu', 'A story which describe the life of an apple.', 'Short Story', 'Green', 'Rainbow', '20110926', 'Loaned'),
('B00003', '0-679-54637-9', 'Lilson', 'Jerry', 'A book describe the life of Lilson.', 'Short Story', 'Green', 'J&T', '20130728', 'Loaned'),
('B00004', '0-278-83721-2', 'Harry Potter', 'William, Shaun', 'A book about magic.', 'Novel', 'Yellow', 'JY', '20020819', 'Loaned'),
('B00005', '0-129-29832-3', 'System Development Life Cycle', 'Jason', 'A journal about SDLC', 'Journal', NULL, 'SinChow', '19941119', 'Cannot be loaned'),
('B00006', '0-398-10291-5', 'Biology', 'Benson', 'A book about biology.', 'Reference Book', NULL, 'ABC', '20050506', 'Cannot be loaned'),
('B00007', '0-232-32912-9', 'Cat and dog', 'Mary', 'A book describe the life of a cat and a dog.', 'Short Story', 'Green', 'J&T', '20100908', 'Available'),
('B00008', '0-294-12903-1', 'Sponge Bob', 'K.Vince', 'A book about  the life of Sponge Bob.', 'Comic', 'Red', 'CID', '19890305', 'Loaned'),
('B00009', '0-837-78329-4', 'Crayon Shin Chan', 'Jerry', 'A book about the life of Shin Chan in Japan.', 'Comic', 'Red', 'CCD', '20001201', 'Loaned'),
('B00010', '0-129-34892-8', 'Doraemon', 'Jason, Nobita, Xiaofu', 'A book about how Doraemon rescure Nobita.', 'Comic', 'Red', 'SinChow', '20031025', 'Available'),
('B00011', '0-392-19283-2', 'Crayon Shin Chan', 'KK.Johnson', 'A book about the life of Shin Chan in Japan.', 'Comic', 'Yellow', 'CCD', '20001201', 'Available'),
('B00012', '0-478-93718-7', 'Viking', 'K.Jervin', 'Viking riders will rise the kingdom.', 'Adventure', 'Yellow', 'DDT', '20000202', 'Available')


-- Create a table named Reservation which records all the reservations of members
CREATE TABLE Reservation
(
	ReservationID nvarchar(50) PRIMARY KEY,
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES Book(Book_ID),
	Member_ID nvarchar(50) FOREIGN KEY REFERENCES Member(Member_ID),
	Reservation_Date date
)

-- Insert values into Reservation table
INSERT INTO Reservation
(ReservationID, Book_ID, Member_ID, Reservation_Date)
VALUES
('R01', 'B00003', 'M00009', '20230526'),
('R02', 'B00008', 'M00004', '20230319'),
('R03', 'B00004', 'M00007', '20230707'),
('R04', 'B00002', 'M00008', '20230708'),
('R05', 'B00001', 'M00009', '20230610')


-- Create a table named Loan which records the loans of books by members
CREATE TABLE Loan
(
	Loan_ID nvarchar(50) PRIMARY KEY,
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES Book(Book_ID), -- foreign key
	Member_ID nvarchar(50) FOREIGN KEY REFERENCES Member(Member_ID), --foreign key
	Loan_Date date,
	Return_Date date NULL,
	Fines money NULL
)


-- Insert values into Loan table
INSERT INTO Loan
(Loan_ID, Book_ID, Member_ID, Loan_Date, Return_Date, Fines)
VALUES
('L01', 'B00003', 'M00002', '20230420', '20230427', 0),
('L02', 'B00008', 'M00002', '20230420', '20230508', 11),
('L03', 'B00002', 'M00005', '20230328', '20230430', 12),
('L04', 'B00007', 'M00009', '20230301', '20230422', 32),
('L05', 'B00008', 'M00010', '20230608', '20230614', 0),
('L06', 'B00009', 'M00010', '20230609', '20230619', 3),
('L07', 'B00003', 'M00010', '20230610', '20230702', 1),
('L08', 'B00001', 'M00001', '20230608', NULL, NULL),
('L09', 'B00002', 'M00001', '20230608', NULL, NULL),
('L10', 'B00004', 'M00001', '20230609', NULL, NULL),
('L11', 'B00008', 'M00001', '20230612', NULL, NULL)

-- Create a table named Payment_Status which records the payment status of the fine imposed on members who have overdue loan
CREATE TABLE Payment_Status
(
	Member_ID nvarchar(50) FOREIGN KEY REFERENCES Member(Member_ID),
	Book_ID nvarchar(50) FOREIGN KEY REFERENCES Book(Book_ID),
	Loan_ID nvarchar(50) FOREIGN KEY REFERENCES Loan(Loan_ID),
	Payment_Status nvarchar(50) DEFAULT 'Unpaid'
	PRIMARY KEY (Member_ID, Book_ID, Loan_ID)
)

-- Insert values into the Payment_Status table
INSERT INTO Payment_Status
(Member_ID, Book_ID, Loan_ID, Payment_Status)
VALUES
('M00002', 'B00008', 'L02', 'Paid'),
('M00005', 'B00002', 'L03', 'Paid'),
('M00009', 'B00007', 'L04', 'Paid'),
('M00010', 'B00009', 'L06', 'Paid'),
('M00010', 'B00003', 'L07', 'Paid')
 


-- Create a table named Loan_Period which records how long can each category of books be loaned for
CREATE TABLE Loan_Period
(
	Category nvarchar(50) PRIMARY KEY,
	Loan_Period int
)

-- Insert values into Loan_Period table
INSERT INTO Loan_Period
(Category, Loan_Period)
VALUES
('Green', 21),
('Yellow', 14),
('Red', 7)


-- For each member who has borrowed MORE THAN 2 books, list the MEMBERS NAME and the TOTAL NUMBER of books currently on loan to them. 
-- List the results in alphabetical order of member names.
SELECT Member.Name, COUNT(Loan.Book_ID ) AS Total_Number_Of_Books_On_Loan FROM Member
INNER JOIN Loan ON Member.Member_ID = Loan.Member_ID
WHERE Loan.Return_Date IS NULL
GROUP BY Member.Name
HAVING COUNT(Loan.Book_ID) > 2 
ORDER BY Member.Name ASC


-- List the total number of books AVAILABLE in each category. List the results in DESCENDING order of the TOTAL NUMBER.
SELECT Book.Category, COUNT(Book_ID) AS Total_Number_of_Books FROM Book
WHERE Book_Status = 'Available'
GROUP BY Book.Category
ORDER BY Total_Number_of_Books DESC

-- Find the GENRE which has the HIGHEST number of books.
SELECT Genre, COUNT(*) AS Total_Number_Of_Books FROM Book 
GROUP BY Genre -- count total of books for each genre
-- the condition for HAVING is the MAX of count of books
HAVING COUNT(*) = (SELECT MAX(Number_of_books) FROM (SELECT COUNT(*) AS Number_of_books FROM Book GROUP BY Genre) AS Highest_Number_of_Books) 


-- Show the books which are currently available for loan.
SELECT * FROM Book WHERE Book_Status = 'Available'

-- List the member(s) who had made more than 2 loans.
SELECT Member.Member_ID, Member.Name , COUNT(Loan.Member_ID) AS Number_Of_Loans FROM Member
INNER JOIN Loan ON Member.Member_ID = Loan.Member_ID
GROUP BY Member.member_ID, Member.Name
HAVING COUNT(*) > 2 

-- List the books which are written by more than 2 authors.
SELECT Book.Title, Author FROM Book WHERE Author LIKE '%,%,%'

-- Find the member(s) which has overdue loan.
SELECT Loan.Member_ID, Member.Name, SUM(Fines) AS Total_Fines FROM Loan 
INNER JOIN Member ON Member.Member_ID = Loan.Member_ID
WHERE Fines != 0
GROUP BY Loan.Member_ID, Member.Name


-- Find the most frequently loaned book(s)
SELECT Book.Title, COUNT(Loan.Book_ID) AS Number_of_Loans FROM LOAN
INNER JOIN Book ON Book.Book_ID = Loan.Book_ID
GROUP BY Book.Title
HAVING COUNT(*) = (SELECT MAX(Number_of_loans) FROM (SELECT COUNT(*) AS Number_of_loans FROM Loan GROUP BY Book_ID) AS Books_With_Highest_Loan)


-- Find the total number of books published by each publisher.
SELECT Book.Publisher, COUNT(Book.Book_ID) AS Number_of_Book_Published FROM Book
GROUP BY Book.Publisher

-- List the books which are currently under reservation. Show the result in alphabetical order of book name.
SELECT Reservation.Book_ID, Book.Title FROM Reservation
INNER JOIN Book ON Reservation.Book_ID = Book.Book_ID
WHERE Reservation.Reservation_Date > GETDATE()
ORDER BY Book.Title



SELECT * FROM Loan_Period 
SELECT * FROM Book 
SELECT * FROM Member 
SELECT * FROM Reservation
SELECT * FROM Loan
SELECT * FROM Payment_Status


