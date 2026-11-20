SELECT 
    *
FROM
    exams
WHERE
    teacher = (SELECT 
            idteacher
        FROM
            teachers
        WHERE
            name = 'Сартаков Игорь Витальевич');
            
/* гарантия одного результата*/

SELECT 
    *
FROM
    exams
WHERE
    mark_exam < (SELECT 
            AVG(mark_exam)
        FROM
            exams
        WHERE
            '2026-09-09');
            
	SELECT 
    Round(AVG(stage))
FROM
    teachers
WHERE
    city = 'Москва';

SELECT 
    *
FROM
    exams
WHERE
    teacher IN (SELECT 
            idteacher
        FROM
            teachers
        WHERE
            city = 'Новосибирск');
/*IN может ввести в заблуждение*/

/*выражения в поздапросах*/

SELECT 
    stage, COUNT(DISTINCT idteacher)
FROM
    teachers
GROUP BY stage
HAVING stage > (SELECT 
        AVG(stage)
    FROM
        teachers
    WHERE
        city = 'Новосибирск');
        
