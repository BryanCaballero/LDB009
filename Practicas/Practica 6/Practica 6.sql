create view VerAnimes
as
select Anime.Nombre, CapituloAnime.IDAnime
from Anime
INNER JOIN CapituloAnime on Anime.IDAnime = CapituloAnime.IDAnime

select * from VerAnimes

create view IDSMangas
as select TOP 10 Manga.IDManga, CapituloManga.Nombre
from Manga
RIGHT JOIN CapituloManga on Manga.IDManga = CapituloManga.IDManga
ORDER BY Manga.Nombre;

select * from IDSMangas

create view FIDS
as
select AVG(Anime.IDAnime) as 'prom. de animes' , AVG(Manga.IDManga) as 'prom. de Manga', AVG(Genero.IDGenero) as 'prom. de generos'
FROM Anime
left join Manga on Anime.IDAnime = Manga.IDManga
inner join Genero on Manga.IDManga = Genero.IDGenero

select * from FIDS 

Create view Gen
as
select Genero.IDGenero, Anime.IDAnime, Manga.Descripcion
from Genero
right join Anime on Anime.IDGenero = Genero.IDGenero
right join Manga on Manga.IDGenero = Anime.IDGenero

select * from Gen

create view Descargas
as
select Anime.Descarga, Genero.Nombre, Manga.Estado, Manga.IDManga
From Anime
inner join Manga on Anime.IDAnime = Manga.IDManga
inner join Genero on Manga.IDGenero = Genero.IDGenero

select * from Descargas

--Subconsultas

select *
from(
select *
from CapituloAnime
where NumeroCap >= 1
)as Parentesis
where Parentesis.Nombre <> 'Another-1'


with WithTemp as (
select Genero.Nombre as 'Genero', Anime.Nombre, CapituloAnime.IDAnime
from Anime, Genero, CapituloAnime
where Genero.IDGenero = Anime.IDGenero and Anime.IDAnime = CapituloAnime.IDAnime
)
select *
from WithTemp
where WithTemp.Genero = 'AVENTURA'


--Tabla temporal

select Genero.Nombre as 'Genero', Manga.Nombre as 'Manga'
into #temp
from genero, Manga
where Genero.IDGenero = Manga.IDGenero

select *
from #temp