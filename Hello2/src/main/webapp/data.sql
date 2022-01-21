USE mysns;

INSERT INTO user VALUES("kim1@abc.com", "111", "±è½Ã¹Î", now());
INSERT INTO user VALUES("lee1@abc.com", "111", "ÀÌ¼ø½Å", now());
INSERT INTO user VALUES("kwon1@abc.com", "111", "±ÇÀ²", now());
INSERT INTO user VALUES("kim2@abc.com", "111", "±è½Ã¹Î", now());
INSERT INTO user VALUES("lee2@abc.com", "111", "ÀÌ¼ø½Å", now());
INSERT INTO user VALUES("kwon2@abc.com", "111", "±ÇÀ²", now());

INSERT INTO feed(id, content) VALUES("kim1@abc.com", "Hello");
INSERT INTO feed(id, content) VALUES("kwon1@abc.com", "Aloha");
