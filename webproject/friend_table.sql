
create table friend_table(
   idx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   myId VARCHAR(20),
    friendId VARCHAR(30)
)

truncate friend_table;