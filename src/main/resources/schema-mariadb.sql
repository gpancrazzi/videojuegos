drop table if exists videojuego;
drop table if exists distribuidor;

create table videojuego (
    id int primary key auto_increment,
    nombre varchar(200) not null,
    descripcion varchar(3000),
    imagen_url varchar(500)
);

insert into videojuego
(id,   nombre,        descripcion,                                                                                                                                      imagen_url) values
(1,    'Silent Hill', 'La ciudad de Silent Hill está desierta y cubierta de niebla, con nieve cayendo fuera de temporada y monstruos hostiles vagando por las calles.', 'https://http2.mlstatic.com/silent-hill-playstation-1-espanol-D_NQ_NP_626993-MLA29175094016_012019-F.jpg'),
(2,    'Winning Eleven 4', 'La jugabilidad de este juego está muy por encima de la de otros títulos. Con él tendrás las sensaciones más cercanas a lo que este hermoso deporte representa.', 'https://i.pinimg.com/originals/14/d8/74/14d874866458dd6a7f46742eed345fa3.jpg'),
(3,    'Final Fantasy VIII', 'Final Fantasy VIII es un Videojuego de rol japonés, con un sistema de combate basado en turnos. En un combate se puede manejar hasta tres personajes.', 'https://4.bp.blogspot.com/-uFd51So8gT0/XBf_H5B6MrI/AAAAAAAABjw/Llvn8d2Dx_QCgvkTS1CZEMbvHgrUhGlIwCLcBGAs/s1600/4fbf0ff8aabf0.jpg'),
(4,    'Resident Evil 3', 'Jill Valentine deberá escapar de los zombies que abundan por Raccoon City y de Nemesis, un arma biológica programada especialmente para eliminar a todos los miembros de su escuadrón.', 'https://vignette.wikia.nocookie.net/residentevil/images/9/90/RE3.jpg/revision/latest?cb=20180816155908&path-prefix=es'),
(5,    'Metal Gear Solid', 'Solid Snake es un soldado que se infiltra en una instalación de armas nucleares para neutralizar la amenaza terrorista de FOXHOUND, una unidad genéticamente mejorada de fuerzas especiales.', 'https://http2.mlstatic.com/metal-gear-solid-1-y-metal-gear-vr-misions-ps3-D_NQ_NP_848715-MLA25308366639_012017-F.jpg'),
(6,    'Final Fantasy IX', 'En muchos aspectos se vuelve a lo visto en los antiguos capítulos de la saga, desde aspectos puramente argumentales a otros más importantes de tipo jugable. Los personajes vuelven a tener roles estrictos y con base en una clase concreta.', 'https://vignette.wikia.nocookie.net/videojuego/images/0/09/Final-fantasy-ix-cover.jpg/revision/latest?cb=20120113163347'),
(7,    'Parasite Eve II', 'Aya Brea es una agente del FBI, forma parte de una división especial que es enviada a una misión urgente en el centro de Los Ángeles, allí se encuentra con una nueva forma de humanoide mitocondrial que representa un grave peligro.', 'https://images-na.ssl-images-amazon.com/images/I/61VT3B0662L.jpg');

create table distribuidor (
    id int primary key auto_increment,
    nombre varchar(200) not null,
    sitio_web varchar(500)
);

insert into distribuidor
(id, nombre, sitio_web) values
(1, 'Konami', 'https://www.konami.com'),
(2, 'Capcom', 'http://www.capcom.com/'),
(3, 'Squaresoft', 'http://www.square-enix.com');

alter table videojuego
add column distribuidor_id int,
add foreign key (distribuidor_id) references distribuidor(id);

update videojuego set distribuidor_id = 1 where id in (1, 2, 5);
update videojuego set distribuidor_id = 3 where id in (3, 6, 7);
update videojuego set distribuidor_id = 2 where id in (4);

alter table videojuego
modify distribuidor_id int not null;