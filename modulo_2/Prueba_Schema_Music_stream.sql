
-- nombre de las columnas que tenemos en el Dataframe:
/*'name', 'artist', 'artistid', 'album', 'album_id_x', 'release_date_x', 'popularity', 'year', 'genre_label', 'artist_popularity', 'artist_followers', 
'artist_genres', 'track', 'url', 'listeners', 'match', 'album_id_y', 'album_name', 'album_type', 'total_tracks', 'release_date_y', 'artist_name'*/ 

-- Creamos el esquema
CREATE SCHEMA MusicStream_prueba;

-- LLamamoa al esquema

USE MusicStream_prueba;

-- Creamos tablas dentro del esquema
CREATE TABLE Artista (
    artistid INT PRIMARY KEY AUTO_INCREMENT,
    artist VARCHAR(300) NOT NULL,
    artist_popularity INT,
    artist_followers BIGINT,
    genre_label VARCHAR(100)
);
    
CREATE TABLE Album (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(300) NOT NULL,
    album_type VARCHAR(50),
    release_date DATE,           
    total_tracks INT,
    artistid INT,
    FOREIGN KEY (artistid) REFERENCES Artista(artistid)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
CREATE TABLE Cancion (
    track_id INT PRIMARY KEY AUTO_INCREMENT,
    track_name VARCHAR(300) NOT NULL,
    album_id INT,
    url VARCHAR(500),
    popularity INT,
    track_year YEAR,
    release_date DATE,          
    listeners INT,
    track_match BOOLEAN,
    user_playcount BIGINT,
    playcount BIGINT,
    tags TEXT,
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


-- LE HE PASADO A CHAT SI ASÍ SERVIRÍA CON LO QUE QUEREMOS ANALIZAR Y ME HA SUGERIDO LO SIGUIENTE ADEMÁS DE LAS TRES TABLAS QUE YA HABIAMOS COMENTADO:
-- Dice que creemos una que sea Cancion_Genero para poder analizar el apartado de (hibridación de géneros).

CREATE TABLE Cancion_Genero (
    track_id INT,
    genre_label VARCHAR(100),
    PRIMARY KEY (track_id, genre_label),
    FOREIGN KEY (track_id) REFERENCES Cancion(track_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);