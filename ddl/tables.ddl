CREATE TABLE Users (
  id            INT             NOT NULL AUTO_INCREMENT ,
  email         VARCHAR(255)    NOT NULL,
  password      VARCHAR(255)    NOT NULL,
  last_name     VARCHAR(255),
  first_name    VARCHAR(255),
  is_admin Boolean DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  img_profile_link VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE Posts (
  postId        INT          NOT NULL AUTO_INCREMENT,
  postUpvotes   INT DEFAULT 0,
  userId        INT NOT NULL,
  post_name     VARCHAR(255),
  parent_id INT,
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

