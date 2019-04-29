CREATE TABLE "admins" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_admins_on_email" ON "admins" ("email");
CREATE UNIQUE INDEX "index_admins_on_reset_password_token" ON "admins" ("reset_password_token");
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "author_name" varchar, "body" text, "movie_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_comments_on_movie_id" ON "comments" ("movie_id");
CREATE TABLE "favorites" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "favorited_id" integer, "favorited_type" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_favorites_on_favorited_type_and_favorited_id" ON "favorites" ("favorited_type", "favorited_id");
CREATE INDEX "index_favorites_on_user_id" ON "favorites" ("user_id");
CREATE TABLE "movies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "rating" varchar, "description" text, "release_date" datetime, "created_at" datetime, "updated_at" datetime, "imgurl" varchar, "favcounter" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20150809022253');

INSERT INTO schema_migrations (version) VALUES ('20190315221446');

INSERT INTO schema_migrations (version) VALUES ('20190315232452');

INSERT INTO schema_migrations (version) VALUES ('20190323170841');

INSERT INTO schema_migrations (version) VALUES ('20190404204150');

INSERT INTO schema_migrations (version) VALUES ('20190416193727');

INSERT INTO schema_migrations (version) VALUES ('20190417200728');

