-- Active: 1673978064951@@127.0.0.1@3306

CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        created_at TEXT DEFAULT(DATETIME()) NOT NULL
    );


CREATE TABLE
    produtos(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        description TEXT NOT NULL,
        imagem_url TEXT NOT NULL
    );


CREATE TABLE
    purchases (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        total_price REAL NOT NULL,
        reated_at TEXT DEFAULT(DATETIME()) NOT NULL,
        paid INTEGER DEFAULT(0) NOT NULL,
        buyer TEXT NOT NULL,
        FOREIGN KEY (buyer) REFERENCES users(id)
    );


CREATE TABLE
    purchases_produtos(
        purchase_id TEXT NOT NULL,
        produto_id TEXT NOT NULL,
        quantity INTEGER NOT NULL DEFAULT(1),
        FOREIGN KEY (purchase_id) REFERENCES purchases(id),
        FOREIGN KEY (produto_id) REFERENCES produtos(id)
    );

    DROP TABLE purchases_produtos

    INSERT INTO users (id,name, email, password)
    VALUES
    ("u001", "gabriel oliva","gabrieltulio@gmail.com", "gab123"),
    ("u002", "kethlin bueno","kethvb@gmail.com", "keth987"),
    ("u003", "Rafael miguel","rafamiguel@gmail.com", "rafa456");

SELECT * FROM users;

DROP TABLE users;

INSERT INTO produtos (id,name,price,description,imagem_url)
VALUES
("p001","televisão",2000, "televisão 75","http://"),
("p002","X-box",1500, "X-box edicao especial","http://"),
("p003","Roteador",300, "roteador de longa distancia","http://"),
("p004","Fifa 23",199, "fifa midea online","http://"),
("p005","nfl",100, "nfl20","http://");

SELECT * FROM produtos ;

DROP Table produtos;

INSERT INTO purchases (id, total_price, paid, buyer)
VALUES 
    ("pu001", 280, 1, "u001"), 
    ("pu002", 85, 1, "u001"), 
    ("pu003",74.99, 0, "u002" ), 
    ("pu004", 110, 0, "u002"), 
    ("pu005", 140, 1, "u003"), 
    ("pu006", 85, 1, "u003");
SELECT * FROM purchases;

DROP Table purchases;

INSERT INTO purchases_produtos(purchase_id, produto_id, quantity)
VALUES
("pu001","p005",1),
("pu002","p004",2),
("pu003","p001",1),
("pu004","p003",2),
("pu005","p002",3);

SELECT * FROM purchases_produtos ;

DROP Table purchases_produtos ;

SELECT * FROM purchases_produtos
INNER JOIN produtos
ON purchases_produtos.produto_id = produto.id
INNER JOIN purchases
ON purchases_produtos.purchase_id = purchase_id
INNER JOIN users
ON purchases.buyer = users.id;      