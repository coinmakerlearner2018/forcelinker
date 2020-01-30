CREATE DATABASE forcelinker;

CREATE TABLE user_target_infor (
  id SERIAL PRIMARY KEY,
  data_of_start TIMESTAMP,
  data_of_finish TIMESTAMP,
  time_zone TIMESTAMPTZ,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(500),
    user_email VARCHAR(500),
    password_digest VARCHAR(500)     
);

ALTER TABLE table_name ADD COLUMN new_column_name data_type;

ALTER TABLE user_target_infor ADD COLUMN milestone VARCHAR(2000);