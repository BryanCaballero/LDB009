--Vistas
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



--Procedimientos almacenados

create Procedure ReporteAnime(@valor int)
as 
begin 
select * 
from dbo.VerAnimes
where IDAnime >4
end

exec ReporteAnime 4


create Procedure ReporteManga(@valor int)
as 
begin 
select * 
from dbo.IDSMangas
where IDManga > 2
end

exec ReporteManga 1


create Procedure ReporteFIDS(@valor int)
as 
begin 
select * 
from dbo.FIDS
where [prom. de generos] > 4
end

exec ReporteManga 1


create Procedure ReporteGenDes(@valor int)
as 
begin 
select * 
from dbo.Gen
where IDAnime <> 5 and IDGenero > 3
end

exec ReporteGenDes 6


create Procedure ReporteDescargas(@valor int)
as 
begin 
select * 
from dbo.Descargas
where IDManga <> 5 and IDManga <> 3 and IDManga <> 7
end

exec ReporteDescargas 8


--Funcion

create function PromedioDeCap(@Numero int, @Numero2 int, @Numero3 int, @Numero4 int)
returns float 
as
begin
	return (@Numero + @Numero2 + @Numero3 + @Numero4)/4   
	end

select dbo.PromedioDeCap(5,9,7,6) as 'suma de 4 capitulos'

--Triggers
--tipo after
create trigger DisparadorAnime
on Anime
after update 
as
begin
select * 
from inserted
end

update Anime
set Anime.Nombre = '99'
from Anime
where Anime.Nombre = 'Death Note'


--Tipo instead

create trigger DisparadorManga
on Manga
instead of update 
as declare @MangaNombre varchar(max) 
IF UPDATE (Nombre)
	begin
		set @MangaNombre = 'Es culpa del trigger'
		select Descripcion, @MangaNombre as 'columna extra'
		from Manga
		where Manga.Descripcion = 'El enorme sistema de cuevas, conocido como El Abismo, es el último lugar inexplorado en el mundo. Nadie sabe que tan profundo es este agujero titánico, habitado por extrañas y maravillosas criaturas y lleno de misterio y reliquias antiguas de propósito desconocido para la humanidad. Generaciones de valientes aventureros han sido atraídos a las profundidades cripticas del Abismo. Con el paso del tiempo estos exploradores son conocidos como "Exploradores de las Profundidades". En Oath, el pueblo al borde del Abismo, vive una pequeña niña huérfana llamada Riko, que sueña con convertirse en una gran exploradora como su madre y descubrir los misterios del Abismo. Un día explorando las obscuras profundidades se encuentra con un niño, que resulta ser un robot...'
		
		end
else 
	begin
		set @MangaNombre = 'No es culpa del trigger'
		select * 
		from Manga
end

update Manga
set Nombre = '99'
from Manga
where Nombre = 'Death Note'


--crear 1 funcion y usarla
--5 procedimientos almacenados
	--uno para cada reporte de la practica anterior
	--debe de utilizar parametros para filtrar el reporte
--crear 1 trigger tipo after
--crear 1 trigger tipo instead


