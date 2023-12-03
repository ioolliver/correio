create database Correio
go
use Correio;

create table Usuario (
  id_usuario int primary key identity,
  email varchar(60) not null unique,
  nome varchar(30) not null,
  senha varchar(64) not null,
  sala char(4) not null 
)

insert into Usuario
values 
  ('isaquereidelas69@gmail.com', 'Isaque', 'ab5a3', '2ds'),
  ('bbayerdev@gmail.com', 'Bayer', 'juanjuan', '2ds' ),
  ('bombom222@gmail.com', 'Luiz Ricardo', 'odeioAlunos', '3ds'),
  ('marielinda@gmail.com', 'Mariana Marcon', 'ma2023', '2ma'),
  ('caiodumon@gmail.com', 'Caio', 'xadrez', '2ds'),
  ('garciabino@gmail.com', 'Garcia Bino', 'panteraEnazi', '2elo')

create table Carta (
  id_carta int primary key identity,
  id_remetente int,
  id_destinatario int,
  data_envio datetime not null,
  lido bit not null,
  mensagem varchar(100) not null,
  foreign key (id_remetente) references Usuario(id_usuario),
  foreign key (id_destinatario) references Usuario(id_usuario)
)

insert into Carta
values 
  (1, 3, '2023-11-19T15:07:00', 0, 'VAI TOMAR NO P@TE!!', null),
  (2, 4, '2023-11-20T12:18:00', 1, 'TE AMOOOO', 1),
  (4, 2, '2023-11-20T13:02:00', 0, 'tb te amo bb <3', null),
  (2, 5, '2023-11-21T15:09:00', 1, 'GOXTOSO DO GUETO', 3),
  (1, 2, '2023-11-21T15:10:00', 0, 'Para meu melhor amigo Bayer', null);

--------------------------- ** PROCEDURES ** -----------------------------------------

-- Procedure Registro --
-- Procedure de Registro, que recebe nome, email, senha, etc e insere no banco--

create procedure RegistrarUsuario
  @nome varchar(30),
  @email varchar(60),
  @senha varchar(64),
  @sala char(4)
as
begin
  insert into Usuario (email, nome, senha, sala)
  values (@email, @nome, @senha, @sala);
end;



-- Procedure login --
-- Procedure de Login, que recebe o email e a senha e verifica se a senha bate --

create procedure LoginUsuario
  @email varchar(60),
  @senha varchar(64)
as
begin
  select * from Usuario WHERE email LIKE @email AND senha LIKE @senha
end

create procedure getUsuarioById
  @id int
as
begin
  select * from Usuario WHERE id_usuario = @id
end

create procedure getUsuariosBySala
  @sala char(4)
as
begin
  select id_usuario, nome, email, sala from Usuario WHERE sala LIKE @sala
end

-- Procedure de envio --
-- id de quem envie e quem recebe e a mensagem --

create procedure EnviarCorreio
  @id_remetente int,
  @id_destinatario int,
  @mensagem varchar(100)
as
begin
  insert into Carta (id_remetente, id_destinatario, data_envio, lido, mensagem)
  values (@id_remetente, @id_destinatario, getdate(), 0, @mensagem);
end;

select * from Carta

create procedure EstatisticasUsuario
	@id_usuario int
as
begin
	DECLARE @Enviadas as int = 0
	DECLARE @Recebidas as int = 0

	SELECT @Enviadas = (SELECT count(*) FROM Carta WHERE id_remetente = @id_usuario)
	SELECT @Recebidas = (SELECT count(*) FROM Carta WHERE id_destinatario = @id_usuario)

	SELECT @id_usuario as id_user, @Enviadas as Enviadas, @Recebidas as Recebidas
end;

create procedure GetCartasRecebidasNaoLidas
	@id_usuario int
as
begin
	SELECT Carta.*, remetente.nome as RemetenteNome from Carta
	INNER JOIN Usuario as remetente ON Carta.id_remetente = remetente.id_usuario
	WHERE id_destinatario = @id_usuario AND lido = 0
	ORDER BY data_envio DESC
end;

create procedure GetCartasRecebidas
	@id_usuario int
as
begin
	SELECT Carta.*, remetente.nome as RemetenteNome from Carta
	INNER JOIN Usuario as remetente ON Carta.id_remetente = remetente.id_usuario
	WHERE id_destinatario = @id_usuario
	ORDER BY data_envio DESC
end;

create procedure GetCartaInfo
	@id_carta int
as
begin
	select Carta.*, remetente.nome as remetenteNome, remetente.sala as remetenteSala, destinatario.nome as destinatarioNome, destinatario.sala as destinatarioSala from Carta
	INNER JOIN Usuario as remetente ON carta.id_remetente = remetente.id_usuario
	INNER JOIN Usuario as destinatario ON carta.id_destinatario = destinatario.id_usuario
	where id_carta = @id_carta
end;

create procedure MarkAsRead
	@id_carta int
as
begin
	UPDATE Carta 
	SET lido = 1
	WHERE id_carta = @id_carta
end

EXEC GetCartasRecebidas @id_usuario = 2