USE [master]
GO
/****** Object:  Database [MnhamMnham]    Script Date: 22/05/2017 17:17:04 ******/
CREATE DATABASE [MnhamMnham]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mnham-Mnham', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Mnham-Mnham.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Mnham-Mnham_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Mnham-Mnham_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MnhamMnham] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MnhamMnham].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MnhamMnham] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MnhamMnham] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MnhamMnham] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MnhamMnham] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MnhamMnham] SET ARITHABORT OFF 
GO
ALTER DATABASE [MnhamMnham] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MnhamMnham] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MnhamMnham] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MnhamMnham] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MnhamMnham] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MnhamMnham] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MnhamMnham] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MnhamMnham] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MnhamMnham] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MnhamMnham] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MnhamMnham] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MnhamMnham] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MnhamMnham] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MnhamMnham] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MnhamMnham] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MnhamMnham] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MnhamMnham] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MnhamMnham] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MnhamMnham] SET  MULTI_USER 
GO
ALTER DATABASE [MnhamMnham] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MnhamMnham] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MnhamMnham] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MnhamMnham] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MnhamMnham] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MnhamMnham] SET QUERY_STORE = OFF
GO
USE [MnhamMnham]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MnhamMnham]
GO
/****** Object:  Table [dbo].[Critica]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Critica](
	[id_critica] [int] IDENTITY(1,1) NOT NULL,
	[classificacao] [decimal](1, 0) NOT NULL,
	[comentario] [nchar](100) NULL,
	[id_utilizador] [int] NOT NULL,
	[id_estabelecimento] [int] NOT NULL,
 CONSTRAINT [PK_Critica] PRIMARY KEY CLUSTERED 
(
	[id_critica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estabelecimento]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estabelecimento](
	[id_estabelecimento] [int] IDENTITY(1,1) NOT NULL,
	[designaçao] [nchar](50) NOT NULL,
	[NIF] [decimal](9, 0) NOT NULL,
	[id_proprietario] [int] NOT NULL,
	[telefone] [int] NOT NULL,
	[rede_social] [nchar](20) NULL,
	[url_site] [nchar](30) NULL,
	[classificaçao] [decimal](3, 2) NOT NULL,
	[morada] [nchar](100) NOT NULL,
	[codigo_postal] [nchar](8) NOT NULL,
 CONSTRAINT [PK_Estabelecimento] PRIMARY KEY CLUSTERED 
(
	[id_estabelecimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EstabelecimentoRefeiçao]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstabelecimentoRefeiçao](
	[id_estabelecimento] [int] NOT NULL,
	[id_refeiçao] [int] NOT NULL,
	[preço] [decimal](7, 2) NOT NULL,
 CONSTRAINT [PK_EstabelecimentoRefeiçao] PRIMARY KEY CLUSTERED 
(
	[id_estabelecimento] ASC,
	[id_refeiçao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[id_ingrediente] [int] IDENTITY(1,1) NOT NULL,
	[designaçao] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Ingrediente] PRIMARY KEY CLUSTERED 
(
	[id_ingrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IngredienteRefeiçao]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredienteRefeiçao](
	[id_ingrediente] [int] NOT NULL,
	[id_refeiçao] [int] NOT NULL,
 CONSTRAINT [PK_IngredienteRefeiçao] PRIMARY KEY CLUSTERED 
(
	[id_ingrediente] ASC,
	[id_refeiçao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pesquisa]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pesquisa](
	[id_utilizador] [int] NOT NULL,
	[id_pesquisa] [int] IDENTITY(1,1) NOT NULL,
	[pesquisa] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Pesquisa] PRIMARY KEY CLUSTERED 
(
	[id_utilizador] ASC,
	[id_pesquisa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Preferencia]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preferencia](
	[id_preferencia] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [bit] NOT NULL,
	[ingrediente] [nchar](20) NULL,
	[tipo_de_cozinha] [nchar](20) NULL,
 CONSTRAINT [PK_Preferencia] PRIMARY KEY CLUSTERED 
(
	[id_preferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proprietario]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proprietario](
	[id_proprietario] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nchar](40) NOT NULL,
	[email] [nchar](40) NOT NULL,
	[telefone] [decimal](9, 0) NULL,
 CONSTRAINT [PK_Proprietario] PRIMARY KEY CLUSTERED 
(
	[id_proprietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Refeiçao]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Refeiçao](
	[id_refeiçao] [int] IDENTITY(1,1) NOT NULL,
	[designaçao] [nchar](40) NOT NULL,
	[descriçao] [nchar](100) NULL,
	[tipo_de_cozinha] [nchar](20) NOT NULL,
	[foto_path] [nchar](20) NULL,
 CONSTRAINT [PK_Refeiçao] PRIMARY KEY CLUSTERED 
(
	[id_refeiçao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Utilizador]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilizador](
	[id_utilizador] [int] IDENTITY(1,1) NOT NULL,
	[nome] [nchar](50) NOT NULL,
	[email] [nchar](40) NOT NULL,
	[password] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Utilizador] PRIMARY KEY CLUSTERED 
(
	[id_utilizador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UtilizadorPreferencia]    Script Date: 22/05/2017 17:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtilizadorPreferencia](
	[id_utilizador] [int] NOT NULL,
	[id_preferencia] [int] NOT NULL,
 CONSTRAINT [PK_UtilizadorPreferencia] PRIMARY KEY CLUSTERED 
(
	[id_utilizador] ASC,
	[id_preferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Critica]  WITH CHECK ADD  CONSTRAINT [FK_Critica_Estabelecimento] FOREIGN KEY([id_estabelecimento])
REFERENCES [dbo].[Estabelecimento] ([id_estabelecimento])
GO
ALTER TABLE [dbo].[Critica] CHECK CONSTRAINT [FK_Critica_Estabelecimento]
GO
ALTER TABLE [dbo].[Critica]  WITH CHECK ADD  CONSTRAINT [FK_Critica_Utilizador] FOREIGN KEY([id_utilizador])
REFERENCES [dbo].[Utilizador] ([id_utilizador])
GO
ALTER TABLE [dbo].[Critica] CHECK CONSTRAINT [FK_Critica_Utilizador]
GO
ALTER TABLE [dbo].[Estabelecimento]  WITH CHECK ADD  CONSTRAINT [FK_Estabelecimento_Estabelecimento1] FOREIGN KEY([id_proprietario])
REFERENCES [dbo].[Proprietario] ([id_proprietario])
GO
ALTER TABLE [dbo].[Estabelecimento] CHECK CONSTRAINT [FK_Estabelecimento_Estabelecimento1]
GO
ALTER TABLE [dbo].[EstabelecimentoRefeiçao]  WITH CHECK ADD  CONSTRAINT [FK_EstabelecimentoRefeiçao_EstabelecimentoRefeiçao] FOREIGN KEY([id_estabelecimento])
REFERENCES [dbo].[Estabelecimento] ([id_estabelecimento])
GO
ALTER TABLE [dbo].[EstabelecimentoRefeiçao] CHECK CONSTRAINT [FK_EstabelecimentoRefeiçao_EstabelecimentoRefeiçao]
GO
ALTER TABLE [dbo].[EstabelecimentoRefeiçao]  WITH CHECK ADD  CONSTRAINT [FK_EstabelecimentoRefeiçao_Refeiçao] FOREIGN KEY([id_refeiçao])
REFERENCES [dbo].[Refeiçao] ([id_refeiçao])
GO
ALTER TABLE [dbo].[EstabelecimentoRefeiçao] CHECK CONSTRAINT [FK_EstabelecimentoRefeiçao_Refeiçao]
GO
ALTER TABLE [dbo].[IngredienteRefeiçao]  WITH CHECK ADD  CONSTRAINT [FK_IngredienteRefeiçao_Ingrediente] FOREIGN KEY([id_ingrediente])
REFERENCES [dbo].[Ingrediente] ([id_ingrediente])
GO
ALTER TABLE [dbo].[IngredienteRefeiçao] CHECK CONSTRAINT [FK_IngredienteRefeiçao_Ingrediente]
GO
ALTER TABLE [dbo].[IngredienteRefeiçao]  WITH CHECK ADD  CONSTRAINT [FK_IngredienteRefeiçao_Refeiçao] FOREIGN KEY([id_refeiçao])
REFERENCES [dbo].[Refeiçao] ([id_refeiçao])
GO
ALTER TABLE [dbo].[IngredienteRefeiçao] CHECK CONSTRAINT [FK_IngredienteRefeiçao_Refeiçao]
GO
ALTER TABLE [dbo].[Pesquisa]  WITH CHECK ADD  CONSTRAINT [FK_Pesquisa_Utilizador] FOREIGN KEY([id_utilizador])
REFERENCES [dbo].[Utilizador] ([id_utilizador])
GO
ALTER TABLE [dbo].[Pesquisa] CHECK CONSTRAINT [FK_Pesquisa_Utilizador]
GO
ALTER TABLE [dbo].[UtilizadorPreferencia]  WITH CHECK ADD  CONSTRAINT [FK_UtilizadorPreferencia_Preferencia] FOREIGN KEY([id_preferencia])
REFERENCES [dbo].[Preferencia] ([id_preferencia])
GO
ALTER TABLE [dbo].[UtilizadorPreferencia] CHECK CONSTRAINT [FK_UtilizadorPreferencia_Preferencia]
GO
ALTER TABLE [dbo].[UtilizadorPreferencia]  WITH CHECK ADD  CONSTRAINT [FK_UtilizadorPreferencia_Utilizador] FOREIGN KEY([id_utilizador])
REFERENCES [dbo].[Utilizador] ([id_utilizador])
GO
ALTER TABLE [dbo].[UtilizadorPreferencia] CHECK CONSTRAINT [FK_UtilizadorPreferencia_Utilizador]
GO
USE [master]
GO
ALTER DATABASE [MnhamMnham] SET  READ_WRITE 
GO
