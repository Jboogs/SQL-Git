CREATE DATABASE db_City_Library
USE db_City_Library

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1, 1),
	BranchName varchar(100) NOT NULL,
	BranchAddress varchar(100)
	);

CREATE TABLE Book_Copies (
	BookID INT NOT NULL,--FK Done
	BranchID INT NOT NULL, --FK DONE
	Number_Of_Copies INT NOT NULL
	);

ALTER TABLE Book_Copies
	ADD CONSTRAINT fk_branch_id_book_copies 
	FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Book_Copies
	ADD CONSTRAINT fk_book_ID_book_copies 
	FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE Books (
	BookID INT NOT NULL PRIMARY KEY IDENTITY (10000, 1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(100) --FK Done
	);
ALTER TABLE Books
	ALTER COLUMN PublisherName VARCHAR(100) NOT NULL;

ALTER TABLE Books
ADD CONSTRAINT fk_publisher_name
	FOREIGN KEY (PublisherName) REFERENCES Publisher(PublisherName) ON DELETE CASCADE ON UPDATE CASCADE;
	
CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_book_id REFERENCES Books(BookID) ON DELETE CASCADE ON UPDATE CASCADE,
	AuthorName VARCHAR(100) NOT NULL
	);

CREATE TABLE Publisher (
PublisherName VARCHAR(100) NOT NULL PRIMARY KEY,
Address VARCHAR(100) NOT NULL,
Phone VARCHAR(15)
);
-- all code above executed


--Customer information tables

CREATE TABLE Borrower (
	CardNo INT NOT NULL PRIMARY KEY IDENTITY (100, 1),
	Name VARCHAR(100) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR (15) NOT NULL
	);

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_bookid REFERENCES Books(BookID) ON DELETE CASCADE ON UPDATE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_branch_id REFERENCES Library_Branch(BranchID) ON DELETE CASCADE ON UPDATE CASCADE,
	CardNo INT NOt NULL CONSTRAINT fk_card_no REFERENCES Borrower(CardNo) ON DELETE CASCADE ON UPDATE CASCADE,
	DateOut DATE NOT NULL,
	DateIn DATE NOT NULL
	);

SELECT * FROM Library_Branch

INSERT INTO Library_Branch
	(BranchName, BranchAddress)
	VALUES
	('Sharpstown', '121 Sharpstown Blvd'),
	('Randolph', '17 Tamari Court'),
	('Waterbury', '46 Henry Hough Rd'),
	('Stowe', '192 Thomas Lane'),
	('Burlington', '142 South Winooski Ave'),
	('South Burlington', '190 South Willard Ave');

	SELECT * FROM Publisher

INSERT INTO Borrower
	(Name, Address, Phone)
	VALUES
	('John Doe', '12 Thatplace place', '973-598-5837'),
	('Justin Doughnut', '91 Thisplace place', '973-598-5832'),
	('Jennifer Dee', '64 Programmer ave', '973-598-5981'),
	('Katy Perry', '12 Thisandthatplace rd', '973-598-5837'),
	('Louie Labrador', '75 State Route 109', '971-528-5997'),
	('Susana Lander', '36 whoknows place', '575-555-9090'),
	('Chee Mann', '90 Whoknows plaza', '802-253-9090'),
	('Johnny Dee', '12 1st ave', '878-889-1010')
	;

INSERT INTO Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Pottermore Publishing', 'London, UK', '1-800-888-9087'),
	('Bantam Spectra', 'New York, NY', '212-518-9090'),
	('Scribner', 'New York, NY', '212-345-9090'),
	('Allen & Unwin', 'Crows Nest, AU', '1-800-909-9813'),
	('Penguin Random House', 'New York, NY', '1-800-733-3000'),
	('Hatchette Livre', 'Paris France', '1-800-759-0190'),
	('HarperCollins', 'New York, NY', '1-800-242-7737'),
	('MacMillan Publishers', 'New York, NY', '1-800-901-9876'),
	('Simon & Schuster', 'New York, NY', '1-866-506-1949'),
	('McGraw-Hill Education', 'New York, NY', '1-800-338-3987')
	;

	SELECT * FROM Books
--NOT EXECUTED YET
INSERT INTO Books 
	(Title, PublisherName)
	VALUES
	('Harry Potter and the Halfblood Prince', 'Pottermore Publishing'),
	('Harry Potter and the Prisoner of Azkaban', 'Pottermore Publishing'),
	('Fire & Blood', 'Bantam Spectra'),
	('A song of Ice and Fire', 'Bantam Spectra'),
	('It', 'Scribner'),
	('The Outsider', 'Scribner'),
	('Different Seasons', 'Scribner'),
	('The Hobbit', 'Allen & Unwin'),
	('The Lord of the Rings: The Fellowship of the Ring', 'Allen & Unwin'),
	('The Lord of the Rings: The Twin Towers', 'Allen & Unwin'),
	('The Lord of the Rings: The Return of the King', 'Allen & Unwin'),
	('The Guardians', 'Penguin Random House'),
	('Talking to Strangers', 'Hachette Livre'),
	('On the Come Up', 'HarperCollins'),
	('Me', 'MacMillan Publishers'),
	('The Institute', 'Simon & Schuster'),
	('SAT/ACT Prep Book', 'McGraw-Hill Education'),
	('Sleeping Beauties', 'Scribner'),
	('Harry Potter and the Sorcerers Stone', 'Pottermore Publishing'),
	('Howerd Stern Comes Again', 'Simon & Schuster');
--NOT EXECUTED YET


