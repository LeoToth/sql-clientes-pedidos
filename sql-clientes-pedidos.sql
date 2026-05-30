CREATE TABLE Clientes (
idCliente INT IDENTITY(1,1) PRIMARY KEY,
nomeClinete VARCHAR(100) NOT NULL
);

CREATE TABLE Pedidos(
idPedido INT PRIMARY KEY,
valorPedido DECIMAL(10,2),
idCliente INT FOREIGN KEY REFERENCES Clientes (idCliente)
);

INSERT INTO Clientes (nomeClinete)
VALUES ('Ana'),
        ('Carlos'),
        ('Julia');
        
INSERT INTO Pedidos (idPedido, valorPedido, idCliente)
VALUES (1, 150.00, 1),
        (2, 80.00, 1),
        (3, 200.80, 2),
        (4, 50.00, 1),
        (5, 120.00, 3);
        

SELECT nomeClinete, COUNT(idPedido) AS quantidadePedidos
FROM Clientes
JOIN Pedidos
ON Clientes.idCliente = Pedidos.idCliente
GROUP BY nomeClinete
ORDER BY nomeClinete ASC;

SELECT AVG(valorPedido) AS mediaPedidos
FROM Pedidos;

SELECT SUM(valorPedido) AS faturamentoTotal
FROM Pedidos;