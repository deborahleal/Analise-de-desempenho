ALTER

-- Busca 1 otimizada: Livros por autor
SELECT L.Titulo, A.Nome
FROM Livro L
JOIN Autor A ON L.Autor = A.ID_Autor
WHERE A.Nome = 'Machado de Assis';

-- Busca 2 otimizada: Empréstimos por usuário
SELECT U.Nome, L.Titulo, E.Data_Emprestimo
FROM Emprestimo E
JOIN Usuario U ON E.ID_Usuario = U.ID_Usuario
JOIN Livro L ON E.ID_Livro = L.ID_Livro
WHERE U.Email = 'ana@email.com';

-- NOVA BUSCA 1: Total de livros emprestados por usuário
SELECT U.Nome, COUNT(*) AS Total_Emprestimos
FROM Emprestimo E
JOIN Usuario U ON E.ID_Usuario = U.ID_Usuario
GROUP BY U.Nome;

-- NOVA BUSCA 2: Listar livros que nunca foram emprestados
SELECT L.Titulo
FROM Livro L
LEFT JOIN Emprestimo E ON L.ID_Livro = E.ID_Livro
WHERE E.ID_Livro IS NULL;

-- NOVA BUSCA 3: Empréstimos com devolução atrasada (considerando hoje)
SELECT U.Nome, L.Titulo, E.Data_Devolucao
FROM Emprestimo E
JOIN Usuario U ON E.ID_Usuario = U.ID_Usuario
JOIN Livro L ON E.ID_Livro = L.ID_Livro
WHERE E.Data_Devolucao < CURRENT_DATE;
