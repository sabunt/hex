ТЕСТОВОЕ КОДЕР
-------
1)
Исправьте ошибку в SQL запросе
SELECT DepartmentName, COUNT(*) 
FROM employee,department 
WHERE employee.DepartmentID = department.DepartmentID 
GROUP BY DepartmentName
WHERE COUNT(*)>1

-------

SELECT DepartmentName, COUNT(*) 
FROM employee,department 
WHERE employee.DepartmentID = department.DepartmentID 
GROUP BY DepartmentName
HAVING COUNT(*)>1
-------
2)
Найти последовательность и реализовать вывод этой пирамиды + 1 следующая строчка на любом человекочитаемом яп (желательно Ruby):
9
99
89
9899
999889
798899
-------

def change(s)
  s.chars.chunk { |c| c }.map { |c, arr| [10-arr.size.to_i, c.to_i] }.join
end
puts c = '9'

8.times {puts c = change(c)}

-------


3) Реализовать на RoR вывод календаря, который выводи текущий месяц.
Должны быть реализованы:
- Выделение дней других месяцев попавших в сетку текущего месяца
- Заголовок текущего месяца с плурализацией
- Листание месяца вперед назад

В репозитории решение.
