DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

-- CREATE TABLE AREA --
-- plann --
CREATE TABLE SpotifyClone.plann(
    plann_id INTEGER NOT NULL AUTO_INCREMENT,
    plann_name VARCHAR(100) NOT NULL,
    plann_value DECIMAL(3, 2) NOT NULL,
    CONSTRAINT PRIMARY KEY(plann_id),
) engine = InnoDB;

-- user --
CREATE TABLE SpotifyClone.user(
    user_id INTEGER NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    user_age INTEGER NOT NULL,
    user_date_signature DATE NOT NULL,
    plann_id INTEGER,
    FOREIGN KEY (plann_id) REFERENCES plann (plann_id),
    CONSTRAINT PRIMARY KEY(user_id),
) engine = InnoDB;

-- artist --
CREATE TABLE SpotifyClone.artist(
    artist_id INTEGER NOT NULL AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY(artist_id),
) engine = InnoDB;

-- album --
CREATE TABLE SpotifyClone.album(
    album_id INTEGER NOT NULL AUTO_INCREMENT,
    artist_id VARCHAR(100),
    album_name VARCHAR(100) NOT NULL,
    album_year_release DATE NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
    CONSTRAINT PRIMARY KEY(album_id),
) engine = InnoDB;

-- song --
CREATE TABLE SpotifyClone.song(
    song_id INTEGER NOT NULL AUTO_INCREMENT,
    album_id INTEGER,
    artist_id VARCHAR(100),
    song_name VARCHAR(100) NOT NULL,
    song_duration_seconds INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (album_id),
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
    CONSTRAINT PRIMARY KEY(song_id),
) engine = InnoDB;

-- reproduction_history --
CREATE TABLE SpotifyClone.reproduction_history(
    reproduction_id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER,
    song_id INTEGER,
    date_reproduction DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (song_id) REFERENCES song (song_id),
    CONSTRAINT PRIMARY KEY(reproduction_id),
) engine = InnoDB;

-- following_schema --
CREATE TABLE SpotifyClone.following_schema(
    user_id INTEGER,
    artist_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
) engine = InnoDB;

-- INSERT AREA --
-- plann
INSERT INTO SpotifyClone.plann (plann_name, plann_value)
VALUES
  ('gratuito', 0.00), --1--
  ('universitário', 5.99), --2--
  ('pessoal', 6.99), --3--
  ('familiar', 7.99); --4--

-- user
INSERT INTO SpotifyClone.user (user_name, user_age, user_date_signature, plann_id)
VALUES
  ('Thati', 23, '2019-10-20', 1),
  ('Cintia', 35, '2017-12-30', 4),
  ('Bill', 20, '2019-06-05', 2),
  ('Roger', 45, '2020-05-13', 3),
  ('Norman', 58, '2017-02-17', 3),
  ('Patrick', 33, '2017-01-06', 4),
  ('Vivian', 26, '2018-01-05', 2),
  ('Carol', 19, '2018-02-14', 2),
  ('Angelina', 42, '2018-04-29', 4),
  ('Paul', 46, '2017-01-17', 4);

-- artist
INSERT INTO SpotifyClone.artist (artist_name)
VALUES
  ('Fog'), --1--
  ('Freddie Shannon'), --2--
  ('Lance Day'), --3--
  ('Peter Strong'), --4--
  ('Tyler Isle'), --5--
  ('Walter Phoenix'); --6--

-- album
INSERT INTO SpotifyClone.album (artist_id, album_name, album_year_release)
VALUES
  (6, 'Envious', 1990), --1--
  (6, 'Exuberant', 1993), --2--
  (4, 'Hallowed Steam', 1995), --3--
  (3, 'Incandescent', 1998), --4--
  (2, 'Temporary Culture', 2001), --5--
  (2, 'Library of liberty', 2003), --6--
  (5, 'Chained Down', 2007), --7--
  (5, 'Cabinet of fools', 2012), --8--
  (5, 'No guarantees', 2015), --9--
  (1, 'Apparatus', 2015); --10--

-- song
INSERT INTO SpotifyClone.song (album_id, artist_id, song_name, song_duration_seconds)
VALUES
  (1, 6, 'Soul For Us', 200), --1
  (1, 6, 'Reflection Of Magic', 163), --2
  (1, 6, 'Dance With Her Own', 116), --3

  (2, 6, 'Troubles Of My Inner Fire', 203), --3
  (2, 6, 'Time Fireworks', 152), --4

  (3, 4, 'Magic Circus', 105), --5
  (3, 4, 'Honey, So Do I', 207), --6
  (3, 4, "Sweetie, Lets's Go Wild", 139), --7
  (3, 4, 'She Knows', 244), --8

  (4, 3, 'Fantasy For Me', 100), --9
  (4, 3, 'Celebration Of More', 146), --10
  (4, 3, 'Rock His Everything', 223), --11
  (4, 3, 'Home Forever', 231), --12
  (4, 3, 'Diamond Power', 241), --13
  (4, 3, "Let's Be Silly", 132), --14

  (5, 2, 'Thang Of Thunder', 240), --15
  (5, 2, 'Words Of Her Life', 185), --16
  (5, 2, 'Without My Streets', 176), --17

  (6, 2, 'Need Of The Evening', 190), --18
  (6, 2, 'History Of My Roses', 222), --19
  (6, 2, 'Without My Love', 111), --20
  (6, 2, 'Walking And Game', 123), --21
  (6, 2, 'Young And Father', 197), --22

  (7, 5, 'Finding My Traditions', 179), --23
  (7, 5, 'Walking And Man', 229), --24
  (7, 5, 'Hard And Time', 135), --25 
  (7, 5, "Honey, I'm A Lone Wolf", 150), --26

  (8, 5, "She Thinks I Won't Stay Tonight", 166), --27
  (8, 5, "He Heard You're Bad For Me", 154), --28 
  (8, 5, "He Hopes We Can't Stay", 210), --29
  (8, 5, 'I Know I Know', 117), --30

  (9, 5, "He's Walking Away", 159), --31
  (9, 5, "He's Trouble", 138), --32
  (9, 5, 'I Heard I Want To Bo Alone', 120), --33
  (9, 5, 'I Ride Alone', 151), --34

  (10, 1, 'Honey', 79), --35
  (10, 1, 'You Cheated On Me', 95), --36
  (10, 1, "Wouldn't It Be Nice", 213), --37
  (10, 1, 'Baby', 136), --38
  (10, 1, 'You Make Me Feel So..', 83); --39

-- following_schema
INSERT INTO SpotifyClone.following_schema (user_id, artist_id)
VALUES
  (1, 6),
  (1, 2),
  (1, 3),

  (2, 6),
  (2, 3),

  (3, 4),
  (3, 6),

  (4, 2),

  (5, 5),
  (5, 1),

  (6, 1),
  (6, 3),
  (6, 6),

  (7, 4),
  (7, 5),

  (8, 6),
  (8, 5),

  (9, 1),
  (9, 2),
  (9, 3),

  (10, 4),
  (10, 1);

-- reproduction_history
INSERT INTO SpotifyClone.reproduction_history (user_id, song_id, date_reproduction)
VALUES
  (1, 35, '2020-02-28 10:45:55'),
  (1, 24 , '2020-05-02 05:30:35'),
  (1, 22, '2020-03-06 11:22:33'),
  (1, 13, '2020-08-05 08:05:17'),
  (1, 14, '2020-09-14 16:32:22'),

  (2, 33, '2020-01-02 07:40:33'),
  (2, 23, '2020-05-16 06:16:22'),
  (2, 20, '2020-10-09 12:27:48'),
  (2, 38, '2020-09-21 13:14:46'),

  (3, 5, '2020-11-13 16:55:13'),
  (3, 3, '2020-12-05 18:38:30'),
  (3, 25, '2020-07-30 10:00:00'),

  (4, 2, '2021-08-15 17:10:10'),
  (4, 34, '2021-07-10 15:20:30'),
  (4, 26, '2021-01-09 01:44:33'),

  (5, 6, '2020-07-03 19:33:28'),
  (5, 11, '2017-02-24 21:14:22'),
  (5, 13, '2020-08-06 15:23:43'),
  (5, 1, '2020-11-10 13:52:27'),

  (6, 37, '2019-02-07 20:33:48'), 
  (6, 28, '2017-01-24 00:31:17'),
  (6, 29, '2017-10-12 12:35:20'),
  (6, 21, '2018-05-29 14:56:41'),

  (7, 4, '2018-05-09 22:30:49'),
  (7, 3, '2020-07-27 12:52:58'),
  (7, 10, '2018-01-16 18:40:43'),

  (8, 38, '2018-03-21 16:56:40'),
  (8, 39, '2020-10-18 13:38:05'),
  (8, 31, '2019-05-25 08:14:03'),
  (8, 32, '2021-08-15 21:37:09'),

  (9, 15, '2021-05-24 17:23:45'),
  (9, 16, '2018-12-07 22:48:52'),
  (9, 7, '2021-03-14 06:14:26'),
  (9, 8, '2020-04-01 03:36:00'),

  (10, 19, '2017-02-06 08:21:34'),
  (10, 20, '2017-12-04 05:33:43'),
  (10, 11, '2017-07-27 05:24:49'),
  (10, 12, '2017-12-25 01:03:57');
