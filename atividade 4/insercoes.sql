-- Inserções em Autor
INSERT INTO Autor (ID_Autor, Nome, Data_Nascimento) VALUES
(1, 'Machado de Assis', '1839-06-21'),
(2, 'Clarice Lispector', '1920-12-10'),
(3, 'Jorge Amado', '1912-08-10'),
(4, 'Cecília Meireles', '1901-11-07'),
(5, 'Carlos Drummond', '1902-10-31'),
(6, 'Monteiro Lobato', '1882-04-18'),
(7, 'Graciliano Ramos', '1892-10-27'),
(8, 'Lima Barreto', '1881-05-13'),
(9, 'José de Alencar', '1829-05-01'),
(10, 'Manuel Bandeira', '1886-04-19'),
(11, 'Rachel de Queiroz', '1910-11-17'),
(12, 'Paulo Coelho', '1947-08-24'),
(13, 'Rubem Alves', '1933-09-15'),
(14, 'Lygia Fagundes Telles', '1923-04-19'),
(15, 'Fernando Sabino', '1923-10-12');

-- Inserções em Categoria
INSERT INTO Categoria (ID_Categoria, Nome) VALUES
(1, 'Romance'),
(2, 'Poesia'),
(3, 'Infantil'),
(4, 'Crônica'),
(5, 'Ficção'),
(6, 'Biografia'),
(7, 'Filosofia'),
(8, 'História'),
(9, 'Ensaios'),
(10, 'Autoajuda'),
(11, 'Terror'),
(12, 'Suspense'),
(13, 'Aventura'),
(14, 'Clássicos'),
(15, 'Didático');

-- Inserções em Usuario
INSERT INTO Usuario (ID_Usuario, Nome, Email) VALUES
(1, 'Ana Clara', 'ana@email.com'),
(2, 'Bruno Silva', 'bruno@email.com'),
(3, 'Carlos Lima', 'carlos@email.com'),
(4, 'Daniela Souza', 'daniela@email.com'),
(5, 'Eduardo Reis', 'eduardo@email.com'),
(6, 'Fernanda Alves', 'fernanda@email.com'),
(7, 'Gabriel Costa', 'gabriel@email.com'),
(8, 'Helena Rocha', 'helena@email.com'),
(9, 'Igor Santos', 'igor@email.com'),
(10, 'Juliana Mendes', 'juliana@email.com'),
(11, 'Lucas Tavares', 'lucas@email.com'),
(12, 'Marina Duarte', 'marina@email.com'),
(13, 'Nathalia Lima', 'nathalia@email.com'),
(14, 'Otávio Nunes', 'otavio@email.com'),
(15, 'Patrícia Gomes', 'patricia@email.com');

-- Inserções em Livro
INSERT INTO Livro (ID_Livro, Titulo, Autor, Ano_Publicacao) VALUES
(1, 'Dom Casmurro', 1, 1899),
(2, 'A Hora da Estrela', 2, 1977),
(3, 'Capitães da Areia', 3, 1937),
(4, 'Romanceiro da Inconfidência', 4, 1953),
(5, 'Alguma Poesia', 5, 1930),
(6, 'Sítio do Picapau Amarelo', 6, 1920),
(7, 'Vidas Secas', 7, 1938),
(8, 'Triste Fim de Policarpo Quaresma', 8, 1915),
(9, 'Senhora', 9, 1875),
(10, 'Libertinagem', 10, 1930),
(11, 'O Quinze', 11, 1930),
(12, 'O Alquimista', 12, 1988),
(13, 'Ostra Feliz Não Faz Pérola', 13, 2008),
(14, 'As Meninas', 14, 1973),
(15, 'O Encontro Marcado', 15, 1956);

-- Inserções em Emprestimo
INSERT INTO Emprestimo (ID_Emprestimo, ID_Livro, ID_Usuario, Data_Emprestimo, Data_Devolucao) VALUES
(1, 1, 1, '2025-05-01', '2025-05-10'),
(2, 2, 2, '2025-05-02', '2025-05-12'),
(3, 3, 3, '2025-05-03', '2025-05-13'),
(4, 4, 4, '2025-05-04', '2025-05-14'),
(5, 5, 5, '2025-05-05', '2025-05-15'),
(6, 6, 6, '2025-05-06', '2025-05-16'),
(7, 7, 7, '2025-05-07', '2025-05-17'),
(8, 8, 8, '2025-05-08', '2025-05-18'),
(9, 9, 9, '2025-05-09', '2025-05-19'),
(10, 10, 10, '2025-05-10', '2025-05-20'),
(11, 11, 11, '2025-05-11', '2025-05-21'),
(12, 12, 12, '2025-05-12', '2025-05-22'),
(13, 13, 13, '2025-05-13', '2025-05-23'),
(14, 14, 14, '2025-05-14', '2025-05-24'),
(15, 15, 15, '2025-05-15', '2025-05-25');
