create table content_table(
	idx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	subject VARCHAR(20),
    chapter VARCHAR(30),
    password VARCHAR(20),
    name VARCHAR(10),
    day DATE,
    content VARCHAR(10000)
)

truncate content_table;