USE [master]
GO
/****** Object:  Database [HoliDayRentalSolution]    Script Date: 24-02-22 15:58:22 ******/
CREATE DATABASE [HoliDayRentalSolution]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HoliDayRentalSolution', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HoliDayRentalSolution_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HoliDayRentalSolution_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HoliDayRentalSolution_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HoliDayRentalSolution] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HoliDayRentalSolution].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HoliDayRentalSolution] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [HoliDayRentalSolution] SET ANSI_NULLS ON 
GO
ALTER DATABASE [HoliDayRentalSolution] SET ANSI_PADDING ON 
GO
ALTER DATABASE [HoliDayRentalSolution] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [HoliDayRentalSolution] SET ARITHABORT ON 
GO
ALTER DATABASE [HoliDayRentalSolution] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HoliDayRentalSolution] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [HoliDayRentalSolution] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [HoliDayRentalSolution] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [HoliDayRentalSolution] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HoliDayRentalSolution] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HoliDayRentalSolution] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET RECOVERY FULL 
GO
ALTER DATABASE [HoliDayRentalSolution] SET  MULTI_USER 
GO
ALTER DATABASE [HoliDayRentalSolution] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [HoliDayRentalSolution] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HoliDayRentalSolution] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HoliDayRentalSolution] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HoliDayRentalSolution] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HoliDayRentalSolution] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HoliDayRentalSolution', N'ON'
GO
ALTER DATABASE [HoliDayRentalSolution] SET QUERY_STORE = OFF
GO
USE [HoliDayRentalSolution]
GO
/****** Object:  Table [dbo].[BienEchange]    Script Date: 24-02-22 15:58:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BienEchange](
	[IdBien] [int] IDENTITY(1,1) NOT NULL,
	[Titre] [nvarchar](50) NOT NULL,
	[DescCourte] [nvarchar](150) NOT NULL,
	[DescLong] [ntext] NOT NULL,
	[NombrePerson] [int] NOT NULL,
	[Pays] [int] NOT NULL,
	[Ville] [nvarchar](50) NOT NULL,
	[Rue] [nvarchar](50) NOT NULL,
	[Numero] [nvarchar](5) NOT NULL,
	[CodePostal] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[AssuranceObligatoire] [bit] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[DisabledDate] [date] NULL,
	[Latitude] [nvarchar](50) NOT NULL,
	[Longitude] [nvarchar](50) NOT NULL,
	[IdMembre] [int] NOT NULL,
	[DateCreation] [date] NOT NULL,
 CONSTRAINT [PK_BienEchange] PRIMARY KEY CLUSTERED 
(
	[IdBien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vue_BiensParPays]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vue_BiensParPays]
AS
SELECT     TOP (100) PERCENT idBien, titre, DescCourte, DescLong, NombrePerson, Pays, Ville, Rue, Numero, CodePostal, Photo, AssuranceObligatoire, isEnabled, DisabledDate, Latitude, Longitude, 
                      idMembre, DateCreation
FROM         dbo.BienEchange
ORDER BY Pays
GO
/****** Object:  View [dbo].[Vue_CinqDernierBiens]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vue_CinqDernierBiens]
AS
SELECT     TOP (5) idBien, titre, DescCourte, DescLong, NombrePerson, Pays, Ville, Rue, Numero, CodePostal, Photo, AssuranceObligatoire, isEnabled, DisabledDate, Latitude, Longitude, idMembre, 
                      DateCreation
FROM         dbo.BienEchange
ORDER BY DateCreation DESC
GO
/****** Object:  Table [dbo].[AvisMembreBien]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvisMembreBien](
	[IdAvis] [int] IDENTITY(1,1) NOT NULL,
	[Note] [int] NOT NULL,
	[Message] [ntext] NOT NULL,
	[IdMembre] [int] NOT NULL,
	[IdBien] [int] NOT NULL,
	[DateAvis] [datetime] NOT NULL,
	[Approuve] [bit] NOT NULL,
 CONSTRAINT [PK_AvisMembreBien] PRIMARY KEY CLUSTERED 
(
	[IdAvis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vue_MeilleursAvis]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vue_MeilleursAvis]
AS
SELECT     TOP (100) PERCENT dbo.BienEchange.idBien, dbo.BienEchange.titre, dbo.BienEchange.DescCourte, dbo.BienEchange.DescLong, dbo.BienEchange.NombrePerson, dbo.BienEchange.Pays, 
                      dbo.BienEchange.Ville, dbo.BienEchange.Rue, dbo.BienEchange.Numero, dbo.BienEchange.CodePostal, dbo.BienEchange.Photo, dbo.BienEchange.AssuranceObligatoire, 
                      dbo.BienEchange.isEnabled, dbo.BienEchange.DisabledDate, dbo.BienEchange.Latitude, dbo.BienEchange.Longitude, dbo.BienEchange.idMembre, dbo.BienEchange.DateCreation
FROM         dbo.AvisMembreBien INNER JOIN
                      dbo.BienEchange ON dbo.AvisMembreBien.idBien = dbo.BienEchange.idBien
WHERE     (dbo.AvisMembreBien.note > 6)
ORDER BY dbo.AvisMembreBien.note DESC
GO
/****** Object:  Table [dbo].[Membre]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membre](
	[IdMembre] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
	[Prenom] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Pays] [int] NOT NULL,
	[Telephone] [nvarchar](20) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_membre] PRIMARY KEY CLUSTERED 
(
	[IdMembre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembreBienEchange]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembreBienEchange](
	[IdMembre] [int] NOT NULL,
	[IdBien] [int] NOT NULL,
	[DateDebEchange] [date] NOT NULL,
	[DateFinEchange] [date] NOT NULL,
	[Assurance] [bit] NULL,
	[Valide] [bit] NOT NULL,
 CONSTRAINT [PK_MembreBienEchange] PRIMARY KEY CLUSTERED 
(
	[IdMembre] ASC,
	[IdBien] ASC,
	[DateDebEchange] ASC,
	[DateFinEchange] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[IdOption] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[IdOption] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionsBien]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionsBien](
	[IdOption] [int] NOT NULL,
	[IdBien] [int] NOT NULL,
	[Valeur] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OptionsBien] PRIMARY KEY CLUSTERED 
(
	[IdOption] ASC,
	[IdBien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pays](
	[IdPays] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pays] PRIMARY KEY CLUSTERED 
(
	[IdPays] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AvisMembreBien] ADD  CONSTRAINT [DF_AvisMembreBien_Approuve]  DEFAULT ((0)) FOR [Approuve]
GO
ALTER TABLE [dbo].[BienEchange] ADD  CONSTRAINT [DF_BienEchange_Pays]  DEFAULT ((1)) FOR [Pays]
GO
ALTER TABLE [dbo].[BienEchange] ADD  CONSTRAINT [DF_BienEchange_AssuranceObligatoire]  DEFAULT ((0)) FOR [AssuranceObligatoire]
GO
ALTER TABLE [dbo].[BienEchange] ADD  CONSTRAINT [DF_BienEchange_isEnabled]  DEFAULT ((0)) FOR [IsEnabled]
GO
ALTER TABLE [dbo].[BienEchange] ADD  CONSTRAINT [DF_BienEchange_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[MembreBienEchange] ADD  CONSTRAINT [DF_MembreBienEchange_Valide]  DEFAULT ((0)) FOR [Valide]
GO
ALTER TABLE [dbo].[AvisMembreBien]  WITH CHECK ADD  CONSTRAINT [FK_AvisMembreBien_BienEchange] FOREIGN KEY([IdBien])
REFERENCES [dbo].[BienEchange] ([IdBien])
GO
ALTER TABLE [dbo].[AvisMembreBien] CHECK CONSTRAINT [FK_AvisMembreBien_BienEchange]
GO
ALTER TABLE [dbo].[AvisMembreBien]  WITH CHECK ADD  CONSTRAINT [FK_AvisMembreBien_membre] FOREIGN KEY([IdMembre])
REFERENCES [dbo].[Membre] ([IdMembre])
GO
ALTER TABLE [dbo].[AvisMembreBien] CHECK CONSTRAINT [FK_AvisMembreBien_membre]
GO
ALTER TABLE [dbo].[BienEchange]  WITH CHECK ADD  CONSTRAINT [FK_BienEchange_membre] FOREIGN KEY([IdMembre])
REFERENCES [dbo].[Membre] ([IdMembre])
GO
ALTER TABLE [dbo].[BienEchange] CHECK CONSTRAINT [FK_BienEchange_membre]
GO
ALTER TABLE [dbo].[BienEchange]  WITH CHECK ADD  CONSTRAINT [FK_BienEchange_Pays] FOREIGN KEY([Pays])
REFERENCES [dbo].[Pays] ([IdPays])
GO
ALTER TABLE [dbo].[BienEchange] CHECK CONSTRAINT [FK_BienEchange_Pays]
GO
ALTER TABLE [dbo].[MembreBienEchange]  WITH CHECK ADD  CONSTRAINT [FK_MembreBienEchange_BienEchange] FOREIGN KEY([IdBien])
REFERENCES [dbo].[BienEchange] ([IdBien])
GO
ALTER TABLE [dbo].[MembreBienEchange] CHECK CONSTRAINT [FK_MembreBienEchange_BienEchange]
GO
ALTER TABLE [dbo].[MembreBienEchange]  WITH CHECK ADD  CONSTRAINT [FK_MembreBienEchange_membre] FOREIGN KEY([IdMembre])
REFERENCES [dbo].[Membre] ([IdMembre])
GO
ALTER TABLE [dbo].[MembreBienEchange] CHECK CONSTRAINT [FK_MembreBienEchange_membre]
GO
ALTER TABLE [dbo].[OptionsBien]  WITH CHECK ADD  CONSTRAINT [FK_OptionsBien_BienEchange] FOREIGN KEY([IdBien])
REFERENCES [dbo].[BienEchange] ([IdBien])
GO
ALTER TABLE [dbo].[OptionsBien] CHECK CONSTRAINT [FK_OptionsBien_BienEchange]
GO
ALTER TABLE [dbo].[OptionsBien]  WITH CHECK ADD  CONSTRAINT [FK_OptionsBien_Options] FOREIGN KEY([IdOption])
REFERENCES [dbo].[Options] ([IdOption])
GO
ALTER TABLE [dbo].[OptionsBien] CHECK CONSTRAINT [FK_OptionsBien_Options]
GO
/****** Object:  StoredProcedure [dbo].[sp_RecupBienDispo]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Cognitic 
-- Create date: 28/02/2015
-- Description:	Récupérer les biens disponible entre deux dates
-- =============================================
Create PROCEDURE [dbo].[sp_RecupBienDispo]
	@DateDeb date,
	@DateFin date
AS
BEGIN
	SELECT     *
FROM         BienEchange
where idBien not in (select idBien from MembreBienEchange where 
(@DateDeb >=DateDebEchange and DateFinEchange >= @DateDeb)
or
(DateFinEchange>=@DateFin and DateDebEchange<= @DateFin )
or 
(@DateDeb<=DateDebEchange and DateFinEchange>= @DateFin)
)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RecupBienMembre]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Cognitic 
-- Create date: 28/02/2015
-- Description:	Récupérer les biens d'un membre
-- =============================================
CREATE PROCEDURE [dbo].[sp_RecupBienMembre] 
	@idMembre int
AS
BEGIN
	select * from BienEchange
	where idMembre = @idMembre
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RecupToutesInfosBien]    Script Date: 24-02-22 15:58:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Cognitic 
-- Create date: 28/02/2015
-- Description:	Récupérer les infos complètes d'un bien à partir de son id
-- =============================================
CREATE PROCEDURE [dbo].[sp_RecupToutesInfosBien] 
	@idBien int
AS
BEGIN
SELECT     *
FROM        BienEchange  left JOIN
                      AvisMembreBien ON AvisMembreBien.idBien = BienEchange.idBien left JOIN
                      Membre ON AvisMembreBien.idMembre = Membre.idMembre AND BienEchange.idMembre = Membre.idMembre left JOIN
                      MembreBienEchange ON BienEchange.idBien = MembreBienEchange.idBien AND Membre.idMembre = MembreBienEchange.idMembre left JOIN
                      OptionsBien ON BienEchange.idBien = OptionsBien.idBien left JOIN
                      Options ON OptionsBien.idOption = Options.idOption left JOIN
                      Pays ON BienEchange.Pays = Pays.idPays
                      where BienEchange.idBien=@idBien
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BienEchange"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 247
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_BiensParPays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_BiensParPays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BienEchange"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 269
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_CinqDernierBiens'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_CinqDernierBiens'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AvisMembreBien"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 219
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BienEchange"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 126
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_MeilleursAvis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_MeilleursAvis'
GO
USE [master]
GO
ALTER DATABASE [HoliDayRentalSolution] SET  READ_WRITE 
GO
