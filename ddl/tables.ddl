DROP TABLE IF EXISTS enroll;
DROP TABLE IF EXISTS section;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course; 
DROP TABLE IF EXISTS prof; 

CREATE TABLE Users (
  id            INT          NOT NULL AUTO_INCREMENT,
  email         VARCHAR(255)    NOT NULL,
  password      VARCHAR(255)    NOT NULL,
  last_name     VARCHAR(255),
  first_name    VARCHAR(255),
  phone         VARCHAR(25),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
);

CREATE TABLE Posts (
  postId        INT          NOT NULL AUTO_INCREMENT,
  postUpvotes   INT,
  userId        INT,
  productId     INT,
  posted_at     DATETIME DEFAULT CURRENT_TIMESTAMP, 
  content   TEXT NULL DEFAULT NULL,          
    PRIMARY KEY (postId),
    FOREIGN KEY (userId) 
      REFERENCES Users(userId)
      ON UPDATE CASCADE 
      ON DELETE CASCADE,
);

ALTER TABLE Users AUTO_INCREMENT = 100001;
ALTER TABLE postId AUTO_INCREMENT = 100001;

INSERT INTO Users(email,password,last_name,first_name,phone) VALUES ("acejace@hotmail.com", "just4funlol", "Lai", "Jace" , "2505756763");