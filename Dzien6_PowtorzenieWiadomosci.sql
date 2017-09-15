#1.
SELECT * FROM nurse WHERE Registered ='false';
#2.
SELECT * FROM nurse WHERE NOT  Position="Nurse";
#3.
-- SELECT * FROM physician WHERE Position LIKE "%Head%"; TO JEST ZLE 
SELECT d.Name AS 'Departament name',p.Name AS 'Physician name' FROM department AS d, physician AS p WHERE d.Head=p.EmployeeID;
#4.
SELECT COUNT(DISTINCT Patient) FROM appointment WHERE Physician>1; 
SELECT COUNT(DISTINCT Patient) FROM appointment;

-- DISTINCT - niepowtarzalny 

#5.
SELECT BlockFloor,BlockCode FROM room WHERE RoomNumber=212;
#6. 
SELECT COUNT(Unavailable) AS 'Free rooms' FROM room WHERE  Unavailable=0 ;
#7. 
SELECT COUNT(Unavailable) AS 'Unavailable rooms'  FROM room WHERE  Unavailable=1;
#8.
SELECT 
    p.Name, d.Name
FROM
    physician AS p,
    department AS d,
    affiliated_with AS aw
WHERE
    p.EmployeeID=aw.Physician
        AND aw.Department = d.DepartmentID;
 
 
SELECT p.Name, d.Name FROM physician AS p JOIN affiliated_with AS aw ON p.EmployeeID=aw.Physician JOIN department AS d ON aw.Department = d.DepartmentID;
        
#9. SPRAWDZIĆ 9 


SELECT 
    p.Name AS 'Physician', pr.Name AS 'Treatment'
FROM
    physician AS p,
    trained_in AS t,
    procedures AS pr
WHERE
    p.EmployeeID = t.Physician
        AND pr.Code = t.Treatment; 


#10. 
SELECT p.Name, a.PrimaryAffiliation FROM physician AS p, affiliated_with AS a WHERE  p.EmployeeID = a.Physician AND PrimaryAffiliation='false';
#11.
SELECT p.Name, p.Position FROM physician AS p LEFT JOIN trained_in AS t ON p.EmployeeID=t.Physician WHERE t.Treatment is null ORDER BY EmployeeID;
#12
SELECT COUNT(DISTINCT Patient) AS'Patient NO ' FROM appointment WHERE ExaminationRoom='C';
#13 
SELECT n.Name AS 'Nurse', a.ExaminationRoom AS 'Room NO.' FROM nurse AS n JOIN appointment AS a ON a.PrepNurse=n.EmployeeID;
#14 
SELECT 
    p.Name AS 'Patient',
    n.Name AS 'Nurse',
    ph.Name AS 'Physician',
    a.ExaminationRoom AS 'Room No',
    a.Start
FROM
    patient AS p
        JOIN
    appointment AS a ON p.SSN = a.Patient
        JOIN
    nurse AS n ON a.PrepNurse = n.EmployeeID
        JOIN
    physician AS ph ON a.Physician = ph.EmployeeID
    
WHERE
    a.Start = "2008-04-25 10:00:00"; 

#15. 
-- To trzeba sprawdzić ! 

SELECT p.Name AS 'Patient',ph.Name AS 'Physician',m.Name AS 'medication' FROM patient p JOIN prescribes s ON s.Patient=p.SSN JOIN physician ph ON s.Physician=p.EmployeeID JOIN medication m ON s.Medication=m.Code;

#16. 
SELECT 
    BlockCode AS 'Block', COUNT(*) 'No Rooms'
FROM
    room
WHERE
    Unavailable = 0
GROUP BY BlockCode ORDER BY BlockCode ; 

#17. 
SELECT BlockFloor AS 'Floor', COUNT(*) AS 'No Rooms' FROM room WHERE Unavailable = 0
GROUP BY BlockFloor ORDER BY BlockFloor;
#18.

SELECT 
    BlockFloor AS 'Floor',
    BlockCode AS 'Block',
    COUNT(*) 'No Rooms'
FROM
    room
WHERE
    Unavailable = 0
    GROUP BY BlockFloor,BlockCode ORDER BY BlockFloor,BlockCode ;
    
#19.
SELECT 
    BlockFloor AS 'Floor',
    BlockCode AS 'Block',
    COUNT(*) 'No Rooms'
FROM
    room
WHERE
    Unavailable = 1
    GROUP BY BlockFloor,BlockCode ORDER BY BlockCode, BlockFloor ;    
    
#20.

SELECT 
    MAX(zz),yy AS 'Highest'
FROM
    (SELECT 
        BlockFloor AS yy, COUNT(*) AS zz
    FROM
        Room r
    WHERE
        Unavailable = 0
    GROUP BY BlockFloor)AS zzz;
    
SELECT BlockFloor AS 'Floor', COUNT(*) AS 'No Rooms' FROM room WHERE Unavailable = 0 GROUP BY BlockFloor LIMIT 1;
