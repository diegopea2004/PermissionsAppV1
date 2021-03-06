USE [master]
GO
/****** Object:  Database [dot-net-test]    Script Date: 23/10/2020 15:00:20 ******/
CREATE DATABASE [dot-net-test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dot-net-test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DIEGOPEA2004\MSSQL\DATA\dot-net-test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dot-net-test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DIEGOPEA2004\MSSQL\DATA\dot-net-test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dot-net-test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dot-net-test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dot-net-test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dot-net-test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dot-net-test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dot-net-test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dot-net-test] SET ARITHABORT OFF 
GO
ALTER DATABASE [dot-net-test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dot-net-test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dot-net-test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dot-net-test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dot-net-test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dot-net-test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dot-net-test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dot-net-test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dot-net-test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dot-net-test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dot-net-test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dot-net-test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dot-net-test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dot-net-test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dot-net-test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dot-net-test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dot-net-test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dot-net-test] SET RECOVERY FULL 
GO
ALTER DATABASE [dot-net-test] SET  MULTI_USER 
GO
ALTER DATABASE [dot-net-test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dot-net-test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dot-net-test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dot-net-test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dot-net-test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dot-net-test', N'ON'
GO
ALTER DATABASE [dot-net-test] SET QUERY_STORE = OFF
GO
USE [dot-net-test]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 23/10/2020 15:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeFirstName] [nvarchar](50) NOT NULL,
	[EmployeeLastName] [nvarchar](50) NOT NULL,
	[PermissionType] [int] NOT NULL,
	[PermissionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionTypes]    Script Date: 23/10/2020 15:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PermissionTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_ToTable] FOREIGN KEY([PermissionType])
REFERENCES [dbo].[PermissionTypes] ([Id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_ToTable]
GO
/****** Object:  StoredProcedure [dbo].[INSERTPERMISSIONS]    Script Date: 23/10/2020 15:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTPERMISSIONS]
	@EMPLOYEEFIRSTNAME  NVARCHAR(50),
	@EMPLOYEELASTNAME NVARCHAR(50),  
	@PERMISSIONTYPE INT,  
	@PERMISSIONDATE DATETIME
 
AS
BEGIN
	INSERT INTO [dbo].[Permissions](EmployeeFirstName, EmployeeLastName, PermissionType, PermissionDate)
	VALUES (@EMPLOYEEFIRSTNAME,@EMPLOYEELASTNAME,@PERMISSIONTYPE, @PERMISSIONDATE)

	SELECT @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[Select_PERMISSIONS]    Script Date: 23/10/2020 15:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_PERMISSIONS]

 @ID INT = NULL,
 @EMPLOYEEFIRSTNAME  NVARCHAR(50) = NULL,  
 @EMPLOYEELASTNAME NVARCHAR(50) = NULL,  
 @PERMISSIONTYPE INT = NULL,  
 @PERMISSIONDATE DATETIME = NULL  
AS  
 BEGIN  
	-- Returns the  occurrence of employees that match the search criteria  
	SELECT *  
	FROM [dbo].[Permissions]
	WHERE ID = ISNULL(@ID,ID) OR
	EmployeeFirstName = ISNULL(@EMPLOYEEFIRSTNAME,EmployeeFirstName) OR  
	EmployeeLastName = ISNULL(@EMPLOYEELASTNAME,EmployeeLastName) OR 
	PermissionType = ISNULL(@PERMISSIONTYPE,PermissionType) OR
	PermissionDate = ISNULL(@PERMISSIONDATE,PermissionDate)
	 
 END 
GO
/****** Object:  StoredProcedure [dbo].[Select_PERMISSIONSTYPES]    Script Date: 23/10/2020 15:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Select_PERMISSIONSTYPES]

 @ID INT = NULL,
 @DESCRIPTION  NVARCHAR(50) = NULL

AS  
 BEGIN  
	-- Returns the  occurrence of employees that match the search criteria  
	SELECT *  
	FROM dbo.PermissionTypes
	WHERE ID = ISNULL(@ID,ID) OR
	[Description] = ISNULL(@DESCRIPTION,[Description])
END
GO
USE [master]
GO
ALTER DATABASE [dot-net-test] SET  READ_WRITE 
GO
