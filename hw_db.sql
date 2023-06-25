CREATE TABLE IF NOT EXISTS Genre (
 	genre_id SERIAL PRIMARY KEY,
 	title varchar(80) UNIQUE
 	);
 
CREATE TABLE IF NOT EXISTS Artist (
	artist_id SERIAL PRIMARY KEY,
	name varchar(40) NOT NULL 
);

CREATE TABLE IF NOT EXISTS GenreArtist (
	genre_id integer REFERENCES Genre(genre_id),
	artist_id integer REFERENCES Artist(artist_id),
	CONSTRAINT ga_pk PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
 	title varchar(80) NOT NULL,
	release_year integer CHECK (release_year >= 2000)
);

 CREATE TABLE IF NOT EXISTS ArtistAlbum (
	album_id integer REFERENCES Album(album_id),
	artist_id integer REFERENCES Artist(artist_id),
	CONSTRAINT aa_pk PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	album_id integer REFERENCES Album(album_id),
	title varchar(80) NOT NULL,
	duration integer CHECK (duration > 0)
);
 	
 CREATE TABLE IF NOT EXISTS Collectoin (
	collectoin_id SERIAL PRIMARY KEY,
 	title varchar(80) NOT NULL,
	release_year integer CHECK (release_year >= 2000)
 );
 	
  CREATE TABLE IF NOT EXISTS TrackCollection (
  	id SERIAL PRIMARY KEY,
	track_id integer NOT NULL REFERENCES Track(track_id),
	collectoin_id integer NOT NULL REFERENCES Collectoin(collectoin_id)
);
