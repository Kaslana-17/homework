SELECT E.nombre, AVG(M.id_estudiante) AS Numero_cursos 
FROM estudiantes E 
INNER JOIN matriculas M ON E.id = M.id_estudiante 
GROUP BY E.nombre;