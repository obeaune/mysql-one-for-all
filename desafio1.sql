DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.user(
    user_id INTEGER NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    user_age INTEGER NOT NULL,
    plann_id INTEGER,
    plann_name VARCHAR(100),
    plann_value DECIMAL(4, 2),
    user_date_signature DATE NOT NULL,
    FOREIGN KEY (plann_id) REFERENCES plann (plann_id),
    FOREIGN KEY (plann_name) REFERENCES plann (plann_name),
    FOREIGN KEY (plann_value) REFERENCES plann (plann_value),
    CONSTRAINT PRIMARY KEY(user_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.plann(
    plann_id INTEGER NOT NULL AUTO_INCREMENT,
    plann_name VARCHAR(100) NOT NULL,
    plann_value DECIMAL(4, 2) NOT NULL,
    CONSTRAINT PRIMARY KEY(plann_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.following_schema(
    user_id INTEGER,
    user_name VARCHAR(100),
    follow_artist VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (user_name) REFERENCES user (user_name),
    -- FOREIGN KEY (follow_artist) REFERENCES artist (artist_name),
) engine = InnoDB;

CREATE TABLE SpotifyClone.artist(
    artist_id INTEGER NOT NULL AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY(artist_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id INTEGER NOT NULL AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    album_year_release DATE NOT NULL,
    artist_name VARCHAR(100),
    FOREIGN KEY (artist_name) REFERENCES artist (artist_name),
    CONSTRAINT PRIMARY KEY(album_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.song(
    song_id INTEGER NOT NULL AUTO_INCREMENT,
    album_id INTEGER,
    album_name VARCHAR(100),
    artist_name VARCHAR(100),
    song_name VARCHAR(100) NOT NULL,
    song_duration_seconds INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (album_id),
    FOREIGN KEY (album_name) REFERENCES album (album_name),
    FOREIGN KEY (artist_name) REFERENCES artist (artist_name),
    CONSTRAINT PRIMARY KEY(song_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.reproduction_history(
    user_id INTEGER,
    user_name VARCHAR(100),
    song_name VARCHAR(100),
    date_reproduction DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (user_name) REFERENCES user (user_name),
    FOREIGN KEY (song_name) REFERENCES song (song_name),
) engine = InnoDB;

-- INSERT AREA --
-- user
INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

-- plann
INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

-- following_schema
INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

-- artist
INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

-- album
INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

-- song
INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

-- reproduction_history
INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');

