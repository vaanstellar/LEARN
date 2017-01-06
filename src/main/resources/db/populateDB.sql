/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILE(type)
VALUES ('USER');
  
INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');
  
INSERT INTO USER_PROFILE(type)
VALUES ('DBA');

/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO APP_USER(sso_id, password, first_name, last_name, email)
VALUES ('ivan','$2a$10$VEpCn8WiqADHJ4EyGjbJz.gGla8eVpoPRCSjlFKAwiUNTqku25Iyq', 'Ivan','Kurniawan','ivan@xyz.com');
  
/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)(
  SELECT app_user.id , user_profile.id FROM app_user, user_profile
  where app_user.sso_id='ivan' and user_profile.type='ADMIN');	