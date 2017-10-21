select *
from dbo.Genero

insert into Genero(IdGenero, Nombre)
values (NEwid(), 'Gore')

insert into Genero(IdGenero, Nombre)
values (NEwid(), 'Musical')

insert into Genero(IdGenero, Nombre)
values (NEwid(), 'Terror')

insert into Genero(IdGenero, Nombre)
values (NEwid(), 'Yaoi')

insert into Genero(IdGenero, Nombre)
values (NEwid(), 'Accion')

insert into Genero(IdGenero, Nombre)
values (NEwid(), 'Aventura')

delete from Genero
where Nombre = 'yuri' 

select *
-- update Genero set Nombre = 'Yuri', IdGenero = NEWID()
from dbo.Genero
where Nombre = 'Yaoi' and IdGenero = 'EEAD77D8-AEA0-41EC-9B6D-B2E01566852D'


select *
from dbo.Anime

insert into Anime(IdAnime,Nombre,Descripcion, IdGenero, Estado, Descarga)
values (NEWID(),'One Piece', 'Esta bien largo', 'F0D91A84-FDA5-4E98-B11A-21D5799926F9', 'Emision', 'actual')

insert into Anime(IdAnime,Nombre,Descripcion, IdGenero, Estado, Descarga)
values (NEWID(),'Course Party', 'Demasiado sangriento', '05F213A2-1EA0-40E2-8316-03500E2A7DC4', 'Finalizado', 'actual')

insert into Anime(IdAnime,Nombre,Descripcion, IdGenero, Estado, Descarga)
values (NEWID(),'Ganz', 'Buena animacion', '1C4B901D-0156-4C03-A45A-7081B579648C', 'Emision', 'actual')

delete from Anime
where Nombre = 'One piece'

select *
-- update Anime set Estado = 'Finalizado'
from dbo.Anime
where Nombre = 'Ganz'


select *
from dbo.CapituloA

insert into CapituloA(IdCapitulo, Nombre, IdAnime, URL, Descripcion, Temporada, Duracion, NumeroCapitulo)
values (NEWID(), 'One piece', 'EBB7203B-D804-47BE-A311-457BDA3E51CB', NEWID(), 'Esta bien largo', '8', '30' , '526')

insert into CapituloA(IdCapitulo, Nombre, IdAnime, URL, Descripcion, Temporada, Duracion, NumeroCapitulo)
values (NEWID(), 'Ganz', '86803A50-EB85-4654-8FBB-3F6C06E7426F', NEWID(), 'Buena animacion', '1', '30' , '26')

insert into CapituloA(IdCapitulo, Nombre, IdAnime, URL, Descripcion, Temporada, Duracion, NumeroCapitulo)
values (NEWID(), 'Course Party', 'EB3322AF-2903-4B22-A46B-0FE5FCFE0861', NEWID(), 'Demasiado sangriento', '2', '30' , '56')

delete from CapituloA
where IdCapitulo = '069A22AA-C79C-4AFA-AC81-898B669EAA01'

select * 
--update CapituloA set IdCapitulo = NEWID()
from dbo.CapituloA
where Nombre = 'One Piece'

select *
from dbo.CapituloM

insert into CapituloM(IdCapitulo, Nombre, URL, IdManga, Descripcion, Temporada, NombreCapitulo, NumeroCapitulo)
values (NEWID(), 'One piece', NEWID(), NEWID(), 'Esta bien largo', '8', 'ta bien chido' , '526')

insert into CapituloM(IdCapitulo, Nombre, URL, IdManga, Descripcion, Temporada, NombreCapitulo, NumeroCapitulo)
values (NEWID(), 'Ganz', NEWID(), '4CD474B5-7CBA-467A-BA3A-DFB19FF3492F', 'Buena animacion', '1', 'chidongongo' , '26')

insert into CapituloM(IdCapitulo, Nombre, URL, IdManga, Descripcion, Temporada, NombreCapitulo, NumeroCapitulo)
values (NEWID(), 'Course Party', NEWID(), NEWID(), 'Demaciado sangriento', '2', 'Ojos' , '56')

delete from CapituloM
where Nombre = 'Course Party'

select *
--update CapituloM set IdCapitulo = NEWID()
from dbo.CapituloM
where Nombre =  'Course Party'

select *
from dbo.Manga

insert into Manga(IdManga,Nombre,Descripcion,IdGenero,Estado,Descarga)
values (NEWID(), 'One piece', 'chidongongo', '26FB1E0A-24A3-4759-BC79-89665387ADBE','Emision', 'Actual')

insert into Manga(IdManga,Nombre,Descripcion,IdGenero,Estado,Descarga)
values (NEWID(), 'Ganz', 'Buena animacion', 'C5A49456-ED27-4441-BA00-F4FD77FE41B0','Emision', 'Actual')

insert into Manga(IdManga,Nombre,Descripcion,IdGenero,Estado,Descarga)
values (NEWID(), 'Course Party', 'Ojos', '159D478F-ED68-4F8D-A096-FD1EB4F43FEA','Finalizado', 'Actual')

delete from Manga
where IdManga= '0D2DE009-CF14-4F7D-A6D4-D72B682A7BAB'

select *
--update Manga set Estado= 'Finalizado'
from dbo.Manga
where Nombre = 'Ganz'

--1.-select con group by, 2.-select con una columna y tres funciones agregadas, 3.-igual al dos pero con where, 4.-como el dos pero con having, 5.- uno con la clausula TOP y order by

select Genero.Nombre
from Genero
group by Genero.Nombre
order by Genero.Nombre desc

select COUNT(CapituloM.Temporada) as 'Cantidad de Mangas', SUM(CapituloM.Temporada) as 'Suma de las temporadas con 56 cap', MAX(CapituloM.NumeroCapitulo) as 'Anime con mayor numero de capitulos'
from CapituloM
group by CapituloM.NumeroCapitulo

select SUM(CapituloA.Duracion) as 'Suma de tiempo' , COUNT(CapituloA.Duracion) as 'Cantidad de capitulos', AVG(CapituloA.Duracion) as 'Promedio entre capitulos'
from CapituloA
where Duracion= '30'

Select COUNT(CapituloA.NumeroCapitulo) as 'Cantidad de animes con menos de 100 cap', COUNT(CapituloA.Temporada)  as 'Cantidad de temporadas', MAX(CapituloA.Duracion) as 'capitulo mas largo'
from CapituloA
group by CapituloA.NumeroCapitulo
having CapituloA.NumeroCapitulo < 100

select top 3 Genero.Nombre
from Genero
group by Genero.Nombre
order by Genero.Nombre desc