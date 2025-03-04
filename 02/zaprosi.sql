SELECT `director`.`dirname`, `director`.`facult`
FROM `director`
WHERE `director`.`facult` ='ИД';
SELECT `director`.`dirname` as 'Фамилия директора',`director`.`facult` as "Институт", `employee`.`empname` as 'Фамилия преподавателя'
FROM `director`, `employee`
WHERE `employee`.`director_#director` = `director`. `#director` AND `director`.`facult` = 'ИД';



Select
`employee`.`#employee` as 'Препод',
`vedomost`.`employee_#employee` as 'Препод',
`vedomost`.`mark` as 'Оценка',
`employee`.`empname` as 'Имя препода'
from `vedomost`,`employee`
Where `employee`.`#employee` = `vedomost`.`employee_#employee` and `vedomost`.`mark` = 'Незачет' and `employee`.`#employee` = '2';


Select `lessontype`.`lessonname`as 'Варианты занятий',
`schedule`.`lessontype_lessonname` as 'Варианты занятий',
`schedule`.`#room` as 'Кабинет'
From `schedule`,`lessontype`
Where `lessontype`.`lessonname` = `schedule`.`lessontype_lessonname` and `schedule`.`#room` = '301' and `lessontype`.`lessonname` = 'Лекция';
