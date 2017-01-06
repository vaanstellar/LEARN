CREATE TABLE IF NOT EXISTS APP_USER (
   id  serial PRIMARY KEY UNIQUE,
   sso_id VARCHAR(30) UNIQUE NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL
);
   
/* USER_PROFILE table contains all possible roles */ 
CREATE TABLE IF NOT EXISTS USER_PROFILE(
   id  serial PRIMARY KEY UNIQUE,
   type VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);

CREATE TABLE IF NOT EXISTS persistent_logins (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);