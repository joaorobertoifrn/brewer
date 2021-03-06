USE [master]
GO
/****** Object:  Database [brewer]    Script Date: 01/06/2018 08:27:59 ******/
CREATE DATABASE [brewer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'brewer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\brewer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'brewer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\brewer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [brewer] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [brewer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [brewer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [brewer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [brewer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [brewer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [brewer] SET ARITHABORT OFF 
GO
ALTER DATABASE [brewer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [brewer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [brewer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [brewer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [brewer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [brewer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [brewer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [brewer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [brewer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [brewer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [brewer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [brewer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [brewer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [brewer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [brewer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [brewer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [brewer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [brewer] SET RECOVERY FULL 
GO
ALTER DATABASE [brewer] SET  MULTI_USER 
GO
ALTER DATABASE [brewer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [brewer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [brewer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [brewer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [brewer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [brewer] SET QUERY_STORE = OFF
GO
USE [brewer]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [brewer]
GO
/****** Object:  Table [dbo].[cerveja]    Script Date: 01/06/2018 08:27:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cerveja](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[comissao] [numeric](19, 2) NOT NULL,
	[content_type] [varchar](255) NULL,
	[descricao] [varchar](50) NOT NULL,
	[foto] [varchar](255) NULL,
	[nome] [varchar](255) NOT NULL,
	[origem] [varchar](255) NOT NULL,
	[quantidade_estoque] [int] NOT NULL,
	[sabor] [varchar](255) NOT NULL,
	[sku] [varchar](255) NOT NULL,
	[teor_alcoolico] [numeric](19, 2) NOT NULL,
	[valor] [numeric](19, 2) NOT NULL,
	[codigo_estilo] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cidade]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cidade](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[codigo_estado] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[cpf_cnpj] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[cep] [varchar](255) NULL,
	[complemento] [varchar](255) NULL,
	[logradouro] [varchar](255) NULL,
	[numero] [varchar](255) NULL,
	[nome] [varchar](255) NOT NULL,
	[telefone] [varchar](255) NULL,
	[tipo_pessoa] [varchar](255) NOT NULL,
	[codigo_cidade] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NULL,
	[sigla] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estilo]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estilo](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupo]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupo](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupo_permissao]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupo_permissao](
	[codigo_grupo] [bigint] NOT NULL,
	[codigo_permissao] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item_venda]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_venda](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[quantidade] [int] NULL,
	[valor_unitario] [numeric](19, 2) NULL,
	[codigo_cerveja] [bigint] NULL,
	[codigo_venda] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissao]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissao](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schema_version]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schema_version](
	[version_rank] [int] NOT NULL,
	[installed_rank] [int] NOT NULL,
	[version] [nvarchar](50) NOT NULL,
	[description] [nvarchar](200) NULL,
	[type] [nvarchar](20) NOT NULL,
	[script] [nvarchar](1000) NOT NULL,
	[checksum] [int] NULL,
	[installed_by] [nvarchar](100) NOT NULL,
	[installed_on] [datetime] NOT NULL,
	[execution_time] [int] NOT NULL,
	[success] [bit] NOT NULL,
 CONSTRAINT [schema_version_pk] PRIMARY KEY CLUSTERED 
(
	[version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[ativo] [bit] NULL,
	[data_nascimento] [date] NULL,
	[email] [varchar](255) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[senha] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_grupo]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_grupo](
	[codigo_usuario] [bigint] NOT NULL,
	[codigo_grupo] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_grupo] ASC,
	[codigo_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venda]    Script Date: 01/06/2018 08:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venda](
	[codigo] [bigint] IDENTITY(1,1) NOT NULL,
	[data_criacao] [datetime2](7) NULL,
	[data_hora_entrega] [datetime2](7) NULL,
	[observacao] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[valor_desconto] [numeric](19, 2) NULL,
	[valor_frete] [numeric](19, 2) NULL,
	[valor_total] [numeric](19, 2) NULL,
	[codigo_cliente] [bigint] NULL,
	[codigo_usuario] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[grupo] ON 

INSERT [dbo].[grupo] ([codigo], [nome]) VALUES (1, N'Administrador')
INSERT [dbo].[grupo] ([codigo], [nome]) VALUES (2, N'Vendedor')
SET IDENTITY_INSERT [dbo].[grupo] OFF
INSERT [dbo].[grupo_permissao] ([codigo_grupo], [codigo_permissao]) VALUES (1, 1)
INSERT [dbo].[grupo_permissao] ([codigo_grupo], [codigo_permissao]) VALUES (1, 2)
SET IDENTITY_INSERT [dbo].[permissao] ON 

INSERT [dbo].[permissao] ([codigo], [nome]) VALUES (1, N'ROLE_CADASTRAR_CIDADE')
INSERT [dbo].[permissao] ([codigo], [nome]) VALUES (2, N'ROLE_CADASTRAR_USUARIO')
SET IDENTITY_INSERT [dbo].[permissao] OFF
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([codigo], [ativo], [data_nascimento], [email], [nome], [senha]) VALUES (1, 1, NULL, N'admin@brewer.com', N'Admin', N'$2a$10$g.wT4R0Wnfel1jc/k84OXuwZE02BlACSLfWy6TycGPvvEKvIm86SG')
SET IDENTITY_INSERT [dbo].[usuario] OFF
INSERT [dbo].[usuario_grupo] ([codigo_usuario], [codigo_grupo]) VALUES (1, 1)
INSERT [dbo].[usuario_grupo] ([codigo_usuario], [codigo_grupo]) VALUES (1, 2)
/****** Object:  Index [schema_version_ir_idx]    Script Date: 01/06/2018 08:28:00 ******/
CREATE NONCLUSTERED INDEX [schema_version_ir_idx] ON [dbo].[schema_version]
(
	[installed_rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [schema_version_s_idx]    Script Date: 01/06/2018 08:28:00 ******/
CREATE NONCLUSTERED INDEX [schema_version_s_idx] ON [dbo].[schema_version]
(
	[success] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [schema_version_vr_idx]    Script Date: 01/06/2018 08:28:00 ******/
CREATE NONCLUSTERED INDEX [schema_version_vr_idx] ON [dbo].[schema_version]
(
	[version_rank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[schema_version] ADD  DEFAULT (getdate()) FOR [installed_on]
GO
ALTER TABLE [dbo].[cerveja]  WITH CHECK ADD  CONSTRAINT [FKr8cbc1uajb471swu38vd6olg] FOREIGN KEY([codigo_estilo])
REFERENCES [dbo].[estilo] ([codigo])
GO
ALTER TABLE [dbo].[cerveja] CHECK CONSTRAINT [FKr8cbc1uajb471swu38vd6olg]
GO
ALTER TABLE [dbo].[cidade]  WITH CHECK ADD  CONSTRAINT [FK3p3ii5fk4vpyyp0bju26kggbb] FOREIGN KEY([codigo_estado])
REFERENCES [dbo].[estado] ([codigo])
GO
ALTER TABLE [dbo].[cidade] CHECK CONSTRAINT [FK3p3ii5fk4vpyyp0bju26kggbb]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK6xsfn948sdgaetvsvrrdngser] FOREIGN KEY([codigo_cidade])
REFERENCES [dbo].[cidade] ([codigo])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK6xsfn948sdgaetvsvrrdngser]
GO
ALTER TABLE [dbo].[grupo_permissao]  WITH CHECK ADD  CONSTRAINT [FKfp14wb9mt832y4jlw2rx3pf6p] FOREIGN KEY([codigo_permissao])
REFERENCES [dbo].[permissao] ([codigo])
GO
ALTER TABLE [dbo].[grupo_permissao] CHECK CONSTRAINT [FKfp14wb9mt832y4jlw2rx3pf6p]
GO
ALTER TABLE [dbo].[grupo_permissao]  WITH CHECK ADD  CONSTRAINT [FKh1lvrl72de4u5xhr1u3jvo0rq] FOREIGN KEY([codigo_grupo])
REFERENCES [dbo].[grupo] ([codigo])
GO
ALTER TABLE [dbo].[grupo_permissao] CHECK CONSTRAINT [FKh1lvrl72de4u5xhr1u3jvo0rq]
GO
ALTER TABLE [dbo].[item_venda]  WITH CHECK ADD  CONSTRAINT [FK247w0wao66p6am6v0mmk92nv9] FOREIGN KEY([codigo_venda])
REFERENCES [dbo].[venda] ([codigo])
GO
ALTER TABLE [dbo].[item_venda] CHECK CONSTRAINT [FK247w0wao66p6am6v0mmk92nv9]
GO
ALTER TABLE [dbo].[item_venda]  WITH CHECK ADD  CONSTRAINT [FK600vi8bvy9mb5dxxd9belkuif] FOREIGN KEY([codigo_cerveja])
REFERENCES [dbo].[cerveja] ([codigo])
GO
ALTER TABLE [dbo].[item_venda] CHECK CONSTRAINT [FK600vi8bvy9mb5dxxd9belkuif]
GO
ALTER TABLE [dbo].[usuario_grupo]  WITH CHECK ADD  CONSTRAINT [FK4yweq9u2sokki6o060mejfw8r] FOREIGN KEY([codigo_grupo])
REFERENCES [dbo].[grupo] ([codigo])
GO
ALTER TABLE [dbo].[usuario_grupo] CHECK CONSTRAINT [FK4yweq9u2sokki6o060mejfw8r]
GO
ALTER TABLE [dbo].[usuario_grupo]  WITH CHECK ADD  CONSTRAINT [FKcx5f61jsftmpnlu4ec8fyndg3] FOREIGN KEY([codigo_usuario])
REFERENCES [dbo].[usuario] ([codigo])
GO
ALTER TABLE [dbo].[usuario_grupo] CHECK CONSTRAINT [FKcx5f61jsftmpnlu4ec8fyndg3]
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD  CONSTRAINT [FK9gr1cxfscbamxiroywi3tpoo3] FOREIGN KEY([codigo_usuario])
REFERENCES [dbo].[usuario] ([codigo])
GO
ALTER TABLE [dbo].[venda] CHECK CONSTRAINT [FK9gr1cxfscbamxiroywi3tpoo3]
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD  CONSTRAINT [FKfxhhl3ooou2gy9g5ijcvxv522] FOREIGN KEY([codigo_cliente])
REFERENCES [dbo].[cliente] ([codigo])
GO
ALTER TABLE [dbo].[venda] CHECK CONSTRAINT [FKfxhhl3ooou2gy9g5ijcvxv522]
GO
ALTER TABLE [dbo].[cerveja]  WITH CHECK ADD CHECK  (([quantidade_estoque]<=(9999)))
GO
USE [master]
GO
ALTER DATABASE [brewer] SET  READ_WRITE 
GO
