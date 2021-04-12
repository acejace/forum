CREATE TABLE Users (
  id            INT             NOT NULL AUTO_INCREMENT ,
  email         VARCHAR(255)    NOT NULL,
  password      VARCHAR(255)    NOT NULL,
  last_name     VARCHAR(255),
  first_name    VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
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
      REFERENCES Users(id)
      ON UPDATE CASCADE 
      ON DELETE CASCADE
);

ALTER TABLE Users AUTO_INCREMENT = 100001;
ALTER TABLE Posts AUTO_INCREMENT = 100001;

