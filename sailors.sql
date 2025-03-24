-- 1. Find all information of sailors who have reserved boat number 101.
SELECT * FROM Sailors 
WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 101);

-- 2. Find the names of sailors who have reserved a red boat, and list in the order of age.
SELECT DISTINCT s.sname FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red'
ORDER BY s.age;

-- 3. Find the names of sailors who have reserved at least one boat.
SELECT DISTINCT sname FROM Sailors 
WHERE sid IN (SELECT sid FROM Reserves);

-- 4. Find the ids and names of sailors who have reserved two different boats on the same day.
SELECT s.sid, s.sname FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
GROUP BY s.sid, s.sname, r.day
HAVING COUNT(DISTINCT r.bid) >= 2;

-- 5. Find the ids of sailors who have reserved a red boat or a green boat (Using IN, EXISTS, UNION).
SELECT DISTINCT sid FROM Reserves 
WHERE bid IN (SELECT bid FROM Boats WHERE color IN ('red', 'green'));

-- 6. Find the names of sailors who have reserved boat 103.
SELECT DISTINCT sname FROM Sailors 
WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 103);

-- 7. Find the names of sailors who have reserved boat 103 using IN operator.
SELECT sname FROM Sailors 
WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 103);

-- 8. Find the names of sailors who have reserved boat 103 using EXISTS Operator.
SELECT sname FROM Sailors s 
WHERE EXISTS (SELECT 1 FROM Reserves r WHERE s.sid = r.sid AND r.bid = 103);

-- 9. Find sailors whose rating is better than some sailor called ‘BOB’ using ANY Operator.
SELECT sname FROM Sailors 
WHERE rating > ANY (SELECT rating FROM Sailors WHERE sname = 'Bob');

-- 10. Find the sailors with the highest rating using ALL Operator.
SELECT sname FROM Sailors 
WHERE rating >= ALL (SELECT rating FROM Sailors);

-- 11. Find the name and the age of the youngest sailor.
SELECT sname, age FROM Sailors 
ORDER BY age ASC LIMIT 1;

-- 12. Find the names and ratings of sailors whose rating is better than sailor called Horatio.
SELECT sname, rating FROM Sailors 
WHERE rating > (SELECT rating FROM Sailors WHERE sname = 'Horatio' LIMIT 1);

-- 13. Count the number of different sailor names.
SELECT COUNT(DISTINCT sname) FROM Sailors;

-- 14. Calculate the average age of all sailors.
SELECT AVG(age) FROM Sailors;

-- 15. Find the name and the age of the youngest sailor using an aggregate function.
SELECT sname, age FROM Sailors 
WHERE age = (SELECT MIN(age) FROM Sailors);

-- 16. Find the average age of sailors for each rating level.
SELECT rating, AVG(age) FROM Sailors 
GROUP BY rating;

-- 17. Find the average age of sailors for each rating level that has at least two sailors.
SELECT rating, AVG(age) FROM Sailors 
GROUP BY rating 
HAVING COUNT(*) >= 2;

-- 18. Find all Sid’s of sailors who have a rating of 10 or reserved boat number 103.
SELECT DISTINCT sid FROM Sailors WHERE rating = 10
UNION
SELECT DISTINCT sid FROM Reserves WHERE bid = 103;

-- 19. Find the names of sailors that have reserved both a red and a green boat.
SELECT s.sname FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red'
INTERSECT
SELECT s.sname FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'green';

-- 20. Find the names of sailors who have not reserved boat number 103.
SELECT sname FROM Sailors 
WHERE sid NOT IN (SELECT sid FROM Reserves WHERE bid = 103);
