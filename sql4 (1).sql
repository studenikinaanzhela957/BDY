/*Агрегатные функции (COUNT, SUM, AVG, MAX, MIN)*/
/*Вычисление общей суммы по всем значениям в таблице*/
SELECT 
    SUM(k_hours)
FROM
    subjects
WHERE 1;
/*Вычисление суммы часов по отдельной кафедре */
SELECT 
    SUM(k_hours)
FROM
    subjects
WHERE kaf=4;
/*Подсчёт количества строк*/
/*Подсчёт общего количества строк в поле kaf без учёта NULL-значений*/
SELECT 
    COUNT(kaf)
FROM
    subjects
WHERE 1;
/*Подсчёт количества уникальных (не повторяющихся) значений*/
SELECT 
    COUNT(distinct kaf)
FROM
    subjects
WHERE 1;
/*Подсчёт общего количества строк в таблице*/
SELECT 
    COUNT(*)
FROM
    teachers;
    
SELECT 
    COUNT(num_group)
FROM
    teachers;
/*Поиск минимального значения по полю name*/    
SELECT 
    MIN(`name`)
FROM
    teachers
WHERE
    `name` LIKE 'С%' OR name LIKE 'В%';
/*Вычисление среднего стажа для всех записей в таблице*/
SELECT 
    AVG(`stage`)
FROM
    teachers;
/*Вычисление среднего стажа только среди тех, кому сопоставлена какая-нибудь группа*/ 
SELECT 
    AVG(`stage`)
FROM
    teachers
WHERE
    num_group IS NOT NULL; 
/*Использование выражения внутри агрегатной функции*/
SELECT 
    AVG(`stage` * 12)
FROM
    teachers
WHERE
    num_group IS NOT NULL; 

SELECT 
    AVG(`stage`) * 12
FROM
    teachers
WHERE
    num_group IS NOT NULL;
/*Группировка агрегатных значений*/
/*Посчитали сумму часов по каждой отдельно*/
SELECT 
    kaf, SUM(k_hours)
FROM
    subjects
GROUP BY kaf;
/*Вычисление средней оценки по каждому предмету*/
SELECT 
    subj, AVG(mark_exam)
FROM
    exams
GROUP BY subj;    
/*Вычисление средней оценки по каждому предмету на каждую дату*/
SELECT 
    date_exam, subj, AVG(mark_exam)
FROM
    exams
GROUP BY date_exam , subj;  
/*Вычисление средней оценки на каждую дату*/
SELECT 
    date_exam, AVG(mark_exam)
FROM
    exams
GROUP BY date_exam;
/*Вычисляем количество принятых экзаменов каждым преподавателем по датам*/
/*Предложение HAVING исключает из результатов запроса те значения, которые получились равными нулю после вычислений (группировки)*/
SELECT 
    teacher, date_exam, COUNT(mark_exam)
FROM
    exams
GROUP BY teacher , date_exam
HAVING COUNT(mark_exam) <> 0;

/*Перед группировкой можно отфильтровать количество строк при помощи предложения WHERE*/
SELECT 
    teacher, date_exam, COUNT(mark_exam)
FROM
    exams
WHERE
    date_exam BETWEEN '2026-09-09' AND '2026-09-11'
GROUP BY teacher , date_exam
HAVING COUNT(mark_exam) <> 0;

/*Использование оператора IN в предложении HAVING*/
SELECT 
    teacher, date_exam, COUNT(mark_exam)
FROM
    exams
GROUP BY teacher
HAVING date_exam IN ('2026-09-09' , '2026-09-11');
/*Использование агрегатной функции в качестве аргумента другой агрегатной функции не допускается*/
SELECT 
    date_exam, SUM(MAX(mark_exam))
FROM
    exams
GROUP BY date_exam;