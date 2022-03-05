USE [master]
GO
/****** Object:  Database [CreditosBancarios]    Script Date: 04/03/2022 05:47:42 p. m. ******/
CREATE DATABASE [CreditosBancarios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CreditosBancarios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CreditosBancarios.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CreditosBancarios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CreditosBancarios_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CreditosBancarios] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CreditosBancarios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CreditosBancarios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CreditosBancarios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CreditosBancarios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CreditosBancarios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CreditosBancarios] SET ARITHABORT OFF 
GO
ALTER DATABASE [CreditosBancarios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CreditosBancarios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CreditosBancarios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CreditosBancarios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CreditosBancarios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CreditosBancarios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CreditosBancarios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CreditosBancarios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CreditosBancarios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CreditosBancarios] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CreditosBancarios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CreditosBancarios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CreditosBancarios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CreditosBancarios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CreditosBancarios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CreditosBancarios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CreditosBancarios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CreditosBancarios] SET RECOVERY FULL 
GO
ALTER DATABASE [CreditosBancarios] SET  MULTI_USER 
GO
ALTER DATABASE [CreditosBancarios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CreditosBancarios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CreditosBancarios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CreditosBancarios] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CreditosBancarios] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CreditosBancarios', N'ON'
GO
USE [CreditosBancarios]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 04/03/2022 05:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbClientes]    Script Date: 04/03/2022 05:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbClientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](200) NULL,
	[Apellidos] [nvarchar](200) NULL,
	[NumeroIdentificacion] [bigint] NULL,
 CONSTRAINT [PK_tbClientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbCuentasAhorro]    Script Date: 04/03/2022 05:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCuentasAhorro](
	[IdCuentaAhorro] [int] IDENTITY(1,1) NOT NULL,
	[NumeroCuenta] [bigint] NULL,
	[SaldoActual] [money] NULL,
	[IdCliente] [int] NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_tbCuentasAhorro] PRIMARY KEY CLUSTERED 
(
	[IdCuentaAhorro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbHistorialTransacciones]    Script Date: 04/03/2022 05:47:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbHistorialTransacciones](
	[IdHistorialTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[IdCuentaAhorro] [int] NULL,
	[monto] [money] NULL,
	[FechaTransaccion] [datetime] NULL,
	[Concepto] [nvarchar](300) NULL,
	[SaldoAnterior] [money] NULL,
	[SaldoActual] [money] NULL,
 CONSTRAINT [PK_tbHistorialTransacciones] PRIMARY KEY CLUSTERED 
(
	[IdHistorialTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220303185323_AddAuthentication', N'6.0.2')
SET IDENTITY_INSERT [dbo].[tbClientes] ON 

INSERT [dbo].[tbClientes] ([IdCliente], [Nombre], [Apellidos], [NumeroIdentificacion]) VALUES (3, N'José Humberto', N'Castillo Rodriguez', 122)
INSERT [dbo].[tbClientes] ([IdCliente], [Nombre], [Apellidos], [NumeroIdentificacion]) VALUES (4, N'Carlos', N'Hernandez Lopez', 123123)
INSERT [dbo].[tbClientes] ([IdCliente], [Nombre], [Apellidos], [NumeroIdentificacion]) VALUES (5, N'Ricardo', N'Castillo Vazquez', 3231)
INSERT [dbo].[tbClientes] ([IdCliente], [Nombre], [Apellidos], [NumeroIdentificacion]) VALUES (6, N'Felipe', N'Gutierrez Fernandez', 322)
SET IDENTITY_INSERT [dbo].[tbClientes] OFF
SET IDENTITY_INSERT [dbo].[tbCuentasAhorro] ON 

INSERT [dbo].[tbCuentasAhorro] ([IdCuentaAhorro], [NumeroCuenta], [SaldoActual], [IdCliente], [FechaCreacion]) VALUES (1, 12312312, 6640003.0000, 3, CAST(N'2022-03-03 16:25:05.703' AS DateTime))
INSERT [dbo].[tbCuentasAhorro] ([IdCuentaAhorro], [NumeroCuenta], [SaldoActual], [IdCliente], [FechaCreacion]) VALUES (2, 123123122, 200000.0000, 5, CAST(N'2022-03-03 16:33:54.283' AS DateTime))
INSERT [dbo].[tbCuentasAhorro] ([IdCuentaAhorro], [NumeroCuenta], [SaldoActual], [IdCliente], [FechaCreacion]) VALUES (3, 12312312, 200000.0000, 6, CAST(N'2022-03-03 16:37:40.957' AS DateTime))
INSERT [dbo].[tbCuentasAhorro] ([IdCuentaAhorro], [NumeroCuenta], [SaldoActual], [IdCliente], [FechaCreacion]) VALUES (4, 12312312222, 115000.0000, 5, CAST(N'2022-03-03 16:39:31.460' AS DateTime))
INSERT [dbo].[tbCuentasAhorro] ([IdCuentaAhorro], [NumeroCuenta], [SaldoActual], [IdCliente], [FechaCreacion]) VALUES (5, 1231231221, 250001.0000, 5, CAST(N'2022-03-03 16:39:59.547' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbCuentasAhorro] OFF
SET IDENTITY_INSERT [dbo].[tbHistorialTransacciones] ON 

INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (1, 1, 100000.0000, CAST(N'2022-03-04 12:56:11.113' AS DateTime), N'Deposito', 100000.0000, 200000.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (2, 1, 100000.0000, CAST(N'2022-03-04 12:57:13.280' AS DateTime), N'Deposito', 200000.0000, 300000.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (3, 2, 100000.0000, CAST(N'2022-03-04 12:59:04.453' AS DateTime), N'Deposito', 100000.0000, 200000.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (4, 3, 100000.0000, CAST(N'2022-03-04 12:59:29.960' AS DateTime), N'Deposito', 100000.0000, 200000.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (5, 4, 100000.0000, CAST(N'2022-03-04 13:00:04.530' AS DateTime), N'Deposito', 15000.0000, 115000.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (6, 5, 100000.0000, CAST(N'2022-03-04 13:42:10.767' AS DateTime), N'Deposito', 150001.0000, 250001.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (7, 1, 500000.0000, CAST(N'2022-03-04 15:28:29.297' AS DateTime), N'Deposito', 300000.0000, 800000.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (8, 1, 900000.0000, CAST(N'2022-03-04 15:29:04.683' AS DateTime), N'Deposito', 800000.0000, 1700000.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (9, 1, 1700001.0000, CAST(N'2022-03-04 15:29:37.457' AS DateTime), N'Deposito', 1700000.0000, 3400001.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (10, 1, 3400002.0000, CAST(N'2022-03-04 15:31:51.037' AS DateTime), N'Deposito', 3400001.0000, 6800003.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (11, 1, 100000.0000, CAST(N'2022-03-04 16:45:27.800' AS DateTime), N'Retiro', 6800003.0000, 6700003.0000)
INSERT [dbo].[tbHistorialTransacciones] ([IdHistorialTransaccion], [IdCuentaAhorro], [monto], [FechaTransaccion], [Concepto], [SaldoAnterior], [SaldoActual]) VALUES (13, 1, 60000.0000, CAST(N'2022-03-04 16:46:20.880' AS DateTime), N'Retiro', 6700003.0000, 6640003.0000)
SET IDENTITY_INSERT [dbo].[tbHistorialTransacciones] OFF
ALTER TABLE [dbo].[tbCuentasAhorro]  WITH CHECK ADD  CONSTRAINT [FK_tbCuentasAhorro_tbClientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[tbClientes] ([IdCliente])
GO
ALTER TABLE [dbo].[tbCuentasAhorro] CHECK CONSTRAINT [FK_tbCuentasAhorro_tbClientes]
GO
ALTER TABLE [dbo].[tbHistorialTransacciones]  WITH CHECK ADD  CONSTRAINT [FK_tbHistorialTransacciones_tbCuentasAhorro] FOREIGN KEY([IdCuentaAhorro])
REFERENCES [dbo].[tbCuentasAhorro] ([IdCuentaAhorro])
GO
ALTER TABLE [dbo].[tbHistorialTransacciones] CHECK CONSTRAINT [FK_tbHistorialTransacciones_tbCuentasAhorro]
GO
USE [master]
GO
ALTER DATABASE [CreditosBancarios] SET  READ_WRITE 
GO
