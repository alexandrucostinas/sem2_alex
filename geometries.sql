--POINTS DEFINITIONS
--POINT(lat,long)
--POINT(45,25)
select POINT(45,25);

--LINESTRING(lat long, lat long, lat long, lat long etc...)
select LINE(20 40 , 25 45 , 26 46, 27 47);

--POLYGON
--POLYGON(lat long, lat long, lat long, lat long etc...)
select LINESTRING(20 40 , 25 45 , 26 46, 27 47, 20 40);

--POLYGON WITH HOLES
--POLYGON(POLYGON1, holes....)
--select POLYGON(20 40 , 25 45 , 26 46, 27 47, 20 40),(HOLE1),(HOLE2),()....)

--GEOMETRY COLLECTION
--GEOMETRYCOLLECTION(GEOM1, GEOM2, GEOM3, etc...)
select GEOMETRYCOLLECTION(POINT(45,25),LINESTRING(20 40 , 25 45 , 26 46, 27 47),POLYGON(25 45 , 26 46, 27 47, 20 40));

CREATE TABLE geometries
(
fid SERIAL primary key,
	name varchar(30) null,
	geom geometry
);

insert into geometries(name,geom) values
('POINT','POINT(45 25)'),
('LINESTRING','LINESTRING(20 40, 25 45, 26 46, 27 47)'),
('POLYGON','POLYGON(20 40, 25,45, 26,46, 27,47, 20 40)'),
('POLYGON WITH HOLES','POLYGON(20 40, 25 45, 26 46, 27 47,20 40),(25 45, 26 46,27 47, 25 45)'),
('GEOMETRYCOLLECTION','GEOMETRYCOLLECTION(POINT(45,25),LINESTRING(20 40, 25,45, 26,46, 27,47),POLYGON(20 40, 25,45, 26,46, 27,47,20 40))')

INSERT INTO geometries (name, geom)
VALUES
    ('POINT', 'POINT(45 25)'),
    ('LINESTRING', 'LINESTRING(20 40, 25 45, 26 46, 27 47)'),
    ('POLYGON', 'POLYGON((20 40, 25 45, 26 46, 27 47, 20 40))'),
    ('POLYGON WITH HOLES', 'POLYGON((20 40, 25 45, 26 46, 27 47, 20 40), (25 45, 26 46, 27 47, 25 45))'),
    ('GEOMETRYCOLLECTION', 'GEOMETRYCOLLECTION(POINT(45 25), LINESTRING(20 40, 25 45, 26 46, 27 47), POLYGON((20 40, 25 45, 26 46, 27 47, 20 40)))');
	
	INSERT INTO geometries(name, geom) VALUES
  ('Point', 'POINT(0 0)'),
  ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
  ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
  ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
  ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');
  
  update geometries set geom = ST_SetSRID(geom, 3844);