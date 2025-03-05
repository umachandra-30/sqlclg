CREATE TABLE Sailors ( 
    sid NUMBER PRIMARY KEY,  -- Sailor ID (integer) 
    sname VARCHAR2(100) NOT NULL,  -- Sailor's name (string) 
    rating NUMBER(3) NOT NULL,  -- Rating (integer, max 3 digits) 
    age NUMBER(5,2)  -- Age (real number with two decimal places) 
);

CREATE TABLE Boats ( 
    bid NUMBER PRIMARY KEY,  -- Boat ID (integer) 
    bname VARCHAR2(100) NOT NULL,  -- Boat name (string) 
    color VARCHAR2(50)  -- Boat color (string) 
);

CREATE TABLE Reserves ( 
    sid NUMBER,  -- Sailor ID (foreign key) 
    bid NUMBER,  -- Boat ID (foreign key) 
    day DATE,  -- Date of reservation 
    PRIMARY KEY (sid, bid, day),  -- Composite primary key (sid, bid, day must be unique)  
    FOREIGN KEY (sid) REFERENCES Sailors(sid),  -- Foreign key from Sailors table  
    FOREIGN KEY (bid) REFERENCES Boats(bid)  -- Foreign key from Boats table 
);

-- Insert data into Sailors table
INSERT INTO Sailors (sid, sname, rating, age) VALUES (22, 'Dustin', 7, 45);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (29, 'Brutus', 1, 33);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (31, 'Lubber', 8, 55.5);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (32, 'Andy', 8, 25.5);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (58, 'Rusty', 10, 35);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (64, 'Horatio', 7, 35);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (71, 'Zorba', 10, 16);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (74, 'Horatio', 9, 40);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (85, 'Art', 3, 25.5);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (95, 'Bob', 3, 63.5);

-- Insert data into Boats table
INSERT INTO Boats (bid, bname, color) VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats (bid, bname, color) VALUES (102, 'Interlake', 'red');
INSERT INTO Boats (bid, bname, color) VALUES (103, 'Clipper', 'green');
INSERT INTO Boats (bid, bname, color) VALUES (104, 'Marine', 'red');

-- Insert data into Reserves table
INSERT INTO Reserves (sid, bid, day) VALUES (22, 101, TO_DATE('1998-10-10', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (22, 102, TO_DATE('1998-10-10', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (22, 103, TO_DATE('1998-10-08', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (22, 104, TO_DATE('1998-10-07', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (31, 102, TO_DATE('1998-11-10', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (31, 103, TO_DATE('1998-11-06', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (31, 104, TO_DATE('1998-11-12', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (64, 101, TO_DATE('1998-09-05', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (64, 102, TO_DATE('1998-09-08', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (74, 103, TO_DATE('1998-09-08', 'YYYY-MM-DD'));
