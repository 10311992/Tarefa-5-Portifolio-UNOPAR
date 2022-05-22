----------------------------------------------------------------------
>> b) Elabore o código para uma consulta SQL que exiba corretamente
-- os dados completos de uma matrícula, contendo nome do aluno, seu
-- número de matrícula, o curso que está matriculado e demais 
-- informações que houver.
----------------------------------------------------------------------

SELECT A.MATRICULA, A.Nome, A.CPF, A.Endereco, 
    C.Codigo, C.Nome 
    FROM ALUNO A 
    INNER JOIN MATRICULA M ON A.MATRICULA = M.Matricula_aluno 
    INNER JOIN Curso C ON M.Codigo_Curso = C.Codigo 
    WHERE A.MATRICULA = ?;

-----------------------------------------------------------------------
-- INSTRUÇÃO: segue a sintaxe SQL para a realização da query de forma 
-- statement, onde o desenvolvedor ao fazer o uso desta query deverá
-- inserir o valor da matricula no lugar da '?'
-----------------------------------------------------------------------
