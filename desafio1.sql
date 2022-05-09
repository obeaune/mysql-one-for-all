DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

-- CREATE TABLE AREA --
-- plann --
CREATE TABLE SpotifyClone.plann(
    plann_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plann_name VARCHAR(50) NOT NULL,
    plann_value DECIMAL(3, 2) NOT NULL
) engine = InnoDB;

-- user --
CREATE TABLE SpotifyClone.user(
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_age INT NOT NULL,
    user_date_signature DATE NOT NULL,
    plann_id INT NOT NULL,
    FOREIGN KEY (plann_id) REFERENCES plann (plann_id)
) engine = InnoDB;

-- artist --
CREATE TABLE SpotifyClone.artist(
    artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(50) NOT NULL
) engine = InnoDB;

-- album --
CREATE TABLE SpotifyClone.album(
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist_id INT NOT NULL,
    album_name VARCHAR(100) NOT NULL,
    album_year_release YEAR NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) engine = InnoDB;

-- song --
CREATE TABLE SpotifyClone.song(
    song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    song_name VARCHAR(50) NOT NULL,
    song_duration_seconds INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (album_id),
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) engine = InnoDB;

-- reproduction_history --
CREATE TABLE SpotifyClone.reproduction_history(
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    date_reproduction DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (song_id) REFERENCES song (song_id)
) engine = InnoDB;

-- following_schema --
CREATE TABLE SpotifyClone.following_schema(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) engine = InnoDB;

-- INSERT AREA --
-- plann
INSERT INTO SpotifyClone.plann (plann_name, plann_value)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

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
  ('Fog'),
  ('Freddie Shannon'),
  ('Lance Day'),
  ('Peter Strong'),
  ('Tyler Isle'),
  ('Walter Phoenix'); 

-- album
INSERT INTO SpotifyClone.album (artist_id, album_name, album_year_release)
VALUES
  (6, 'Envious', 1990),
  (6, 'Exuberant', 1993),
  (4, 'Hallowed Steam', 1995),
  (3, 'Incandescent', 1998),
  (2, 'Temporary Culture', 2001),
  (2, 'Library of liberty', 2003),
  (5, 'Chained Down', 2007),
  (5, 'Cabinet of fools', 2012),
  (5, 'No guarantees', 2015),
  (1, 'Apparatus', 2015);

-- song
INSERT INTO SpotifyClone.song (album_id, artist_id, song_name, song_duration_seconds)
VALUES
  (1, 6, 'Soul For Us', 200),
  (1, 6, 'Reflection Of Magic', 163),
  (1, 6, 'Dance With Her Own', 116),

  (2, 6, 'Troubles Of My Inner Fire', 203),
  (2, 6, 'Time Fireworks', 152),

  (3, 4, 'Magic Circus', 105),
  (3, 4, 'Honey, So Do I', 207),
  (3, 4, "Sweetie, Lets's Go Wild", 139),
  (3, 4, 'She Knows', 244),

  (4, 3, 'Fantasy For Me', 100),
  (4, 3, 'Celebration Of More', 146),
  (4, 3, 'Rock His Everything', 223),
  (4, 3, 'Home Forever', 231),
  (4, 3, 'Diamond Power', 241),
  (4, 3, "Let's Be Silly", 132),

  (5, 2, 'Thang Of Thunder', 240),
  (5, 2, 'Words Of Her Life', 185),
  (5, 2, 'Without My Streets', 176),

  (6, 2, 'Need Of The Evening', 190),
  (6, 2, 'History Of My Roses', 222),
  (6, 2, 'Without My Love', 111),
  (6, 2, 'Walking And Game', 123),
  (6, 2, 'Young And Father', 197),

  (7, 5, 'Finding My Traditions', 179),
  (7, 5, 'Walking And Man', 229),
  (7, 5, 'Hard And Time', 135),
  (7, 5, "Honey, I'm A Lone Wolf", 150),

  (8, 5, "She Thinks I Won't Stay Tonight", 166),
  (8, 5, "He Heard You're Bad For Me", 154),
  (8, 5, "He Hopes We Can't Stay", 210),
  (8, 5, 'I Know I Know', 117),

  (9, 5, "He's Walking Away", 159),
  (9, 5, "He's Trouble", 138),
  (9, 5, 'I Heard I Want To Bo Alone', 120),
  (9, 5, 'I Ride Alone', 151),

  (10, 1, 'Honey', 79),
  (10, 1, 'You Cheated On Me', 95),
  (10, 1, "Wouldn't It Be Nice", 213),
  (10, 1, 'Baby', 136),
  (10, 1, 'You Make Me Feel So..', 83);

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
