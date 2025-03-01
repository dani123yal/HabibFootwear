USE [master]
GO
/****** Object:  Database [HabibFootwear]    Script Date: 1/26/2020 5:07:22 AM ******/
CREATE DATABASE [HabibFootwear]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HabibFootwear', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HabibFootwear.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HabibFootwear_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HabibFootwear_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HabibFootwear] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HabibFootwear].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HabibFootwear] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HabibFootwear] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HabibFootwear] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HabibFootwear] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HabibFootwear] SET ARITHABORT OFF 
GO
ALTER DATABASE [HabibFootwear] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HabibFootwear] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HabibFootwear] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HabibFootwear] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HabibFootwear] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HabibFootwear] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HabibFootwear] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HabibFootwear] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HabibFootwear] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HabibFootwear] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HabibFootwear] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HabibFootwear] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HabibFootwear] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HabibFootwear] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HabibFootwear] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HabibFootwear] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HabibFootwear] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HabibFootwear] SET RECOVERY FULL 
GO
ALTER DATABASE [HabibFootwear] SET  MULTI_USER 
GO
ALTER DATABASE [HabibFootwear] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HabibFootwear] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HabibFootwear] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HabibFootwear] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HabibFootwear] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HabibFootwear]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[batch_Id] [int] IDENTITY(1,1) NOT NULL,
	[shoe_Id] [int] NULL,
	[cost] [int] NULL,
	[batchDate] [date] NULL,
	[vendorOrder_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[batch_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[color_Id] [int] IDENTITY(1,1) NOT NULL,
	[colorName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[color_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerOrder]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerOrder](
	[customerOrder_Id] [int] IDENTITY(1,1) NOT NULL,
	[dateOfOrder] [datetime] NULL,
	[totalAmount] [int] NULL,
	[discount] [int] NULL,
	[finalAmount] [int] NULL,
	[customerName] [nvarchar](max) NULL,
	[orderRemarks] [nvarchar](max) NULL,
	[deleteStatus] [nvarchar](max) NULL,
	[deleteRemarks] [nvarchar](max) NOT NULL,
	[deleteDate] [datetime] NULL,
	[employee_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customerOrder_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomrOrder]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomrOrder](
	[customOrder_Id] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [nvarchar](max) NULL,
	[customerContactNo] [nvarchar](max) NULL,
	[articleNo] [nvarchar](max) NULL,
	[colorName] [nvarchar](max) NULL,
	[material] [nvarchar](max) NULL,
	[size] [int] NULL,
	[advance] [int] NULL,
	[balance] [int] NULL,
	[deliveryDate] [date] NULL,
	[orderStatus] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[customOrder_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[employeeName] [nvarchar](max) NULL,
	[employeeContactNo] [nvarchar](max) NULL,
	[employeeAddress] [nvarchar](max) NULL,
	[salary] [int] NULL,
	[dateOfHiring] [nvarchar](max) NULL,
	[typeOfEmployee] [nvarchar](max) NULL,
	[DeleteStatus] [tinyint] NOT NULL CONSTRAINT [DF__Employee__Delete__03F0984C]  DEFAULT ((0)),
 CONSTRAINT [PK__Employee__C51D7820283C4B0F] PRIMARY KEY CLUSTERED 
(
	[employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outlet]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outlet](
	[outlet_Id] [int] IDENTITY(1,1) NOT NULL,
	[outletName] [nvarchar](max) NULL,
	[outletAddress] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[outlet_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outlet_ShoeSizeColor]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outlet_ShoeSizeColor](
	[outletShoeSizeColor] [int] IDENTITY(1,1) NOT NULL,
	[shoeSizeColor_Id] [int] NULL,
	[outlet_Id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[outletShoeSizeColor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RemainingPayment]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RemainingPayment](
	[remaining_Id] [int] IDENTITY(1,1) NOT NULL,
	[dueDate] [date] NULL,
	[vendorOrder_Id] [int] NULL,
	[remainingAmount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[remaining_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoe]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoe](
	[shoe_Id] [int] IDENTITY(1,1) NOT NULL,
	[shoeArticle] [nvarchar](20) NOT NULL,
	[shoeCost] [int] NULL,
	[shoePrice] [int] NULL,
	[shoeVariety] [nvarchar](max) NULL,
	[UpdateDate] [date] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
PRIMARY KEY CLUSTERED 
(
	[shoe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoe_Size]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoe_Size](
	[shoeSize_Id] [int] IDENTITY(1,1) NOT NULL,
	[shoe_Id] [int] NULL,
	[size_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[shoeSize_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoe_Size_Color]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoe_Size_Color](
	[shoeSizeColor_Id] [int] IDENTITY(1,1) NOT NULL,
	[shoeSize_Id] [int] NULL,
	[color_Id] [int] NULL,
	[quantityInWH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[shoeSizeColor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoeSizeColor_CustomerOrder]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoeSizeColor_CustomerOrder](
	[shoeSizeColorCustomerOrder_Id] [int] IDENTITY(1,1) NOT NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[customerOrder_Id] [int] NULL,
	[shoeSizeColor_Id] [int] NULL,
	[batch_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[shoeSizeColorCustomerOrder_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[size_Id] [int] IDENTITY(1,1) NOT NULL,
	[sizeNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[size_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transfer_ShoeSizeColor]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfer_ShoeSizeColor](
	[transferShoeSizeColor_Id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[shoeSizeColor_Id] [int] NULL,
	[transfer_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[transferShoeSizeColor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransferRecord]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransferRecord](
	[transfer_Id] [int] IDENTITY(1,1) NOT NULL,
	[outlet_Id] [int] NULL,
	[dateOfTransfer] [date] NULL,
	[shoesTransfered] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[transfer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[vendor_Id] [int] IDENTITY(1,1) NOT NULL,
	[vendorName] [nvarchar](max) NOT NULL,
	[vendorCompany] [nvarchar](max) NULL,
	[vendorContactNo] [nvarchar](max) NULL,
	[vendorAddress] [nvarchar](max) NULL,
	[DeleteStatus] [tinyint] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[vendor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VendorOrder]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorOrder](
	[vendorOrder_Id] [int] IDENTITY(1,1) NOT NULL,
	[dateOfOrder] [date] NULL,
	[totalAmount] [int] NULL,
	[amountRemaining] [int] NULL,
	[totalQty] [int] NULL,
	[vendor_Id] [int] NULL,
	[paymentStatus] [nvarchar](max) NULL,
	[paymentMode] [nvarchar](max) NULL,
	[deleteStatus] [nvarchar](max) NULL,
	[deleteRemarks] [nvarchar](max) NULL,
	[deleteDate] [date] NULL,
	[paymentType] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[vendorOrder_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VendorOrder_ShoeSizeColor]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorOrder_ShoeSizeColor](
	[vendorOrderShoeSizeColor_Id] [int] IDENTITY(1,1) NOT NULL,
	[shoeSizeColor_Id] [int] NULL,
	[quantity] [int] NULL,
	[cost] [int] NULL,
	[vendorOrder_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[vendorOrderShoeSizeColor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VendorPayment]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorPayment](
	[vendorPayment_Id] [int] IDENTITY(1,1) NOT NULL,
	[vendorOrder_Id] [int] NULL,
	[paymentDate] [date] NULL,
	[amount] [int] NULL,
	[deleteStatus] [nvarchar](max) NULL,
	[deleteRemarks] [nvarchar](max) NULL,
	[deleteDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[vendorPayment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 1/26/2020 5:07:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Batch] ON 

INSERT [dbo].[Batch] ([batch_Id], [shoe_Id], [cost], [batchDate], [vendorOrder_Id]) VALUES (30, 37, 400, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Batch] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([color_Id], [colorName]) VALUES (1, N'BLACK')
INSERT [dbo].[Color] ([color_Id], [colorName]) VALUES (2, N'GREY')
INSERT [dbo].[Color] ([color_Id], [colorName]) VALUES (3, N'BLUE')
INSERT [dbo].[Color] ([color_Id], [colorName]) VALUES (4, N'BROWN')
INSERT [dbo].[Color] ([color_Id], [colorName]) VALUES (5, N'GOLDEN')
INSERT [dbo].[Color] ([color_Id], [colorName]) VALUES (6, N'RED')
INSERT [dbo].[Color] ([color_Id], [colorName]) VALUES (7, N'WHITE')
INSERT [dbo].[Color] ([color_Id], [colorName]) VALUES (20, N'CYAN')
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[CustomerOrder] ON 

INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (39, CAST(N'2020-01-26 04:48:57.567' AS DateTime), 2000, 0, 2000, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (41, CAST(N'2020-01-26 04:51:48.597' AS DateTime), 1000, 0, 1000, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (42, CAST(N'2020-01-26 04:52:07.413' AS DateTime), 3400, 0, 3400, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (43, CAST(N'2020-01-26 04:52:21.223' AS DateTime), 2800, 0, 2800, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (44, CAST(N'2020-01-26 04:52:36.343' AS DateTime), 800, 0, 800, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (45, CAST(N'2020-01-26 04:52:49.403' AS DateTime), 6000, 0, 6000, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (46, CAST(N'2020-01-26 04:53:00.560' AS DateTime), 2800, 0, 2800, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (47, CAST(N'2020-01-26 04:53:14.823' AS DateTime), 2400, 0, 2400, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (48, CAST(N'2020-01-26 04:53:23.427' AS DateTime), 1800, 0, 1800, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (49, CAST(N'2020-01-26 04:53:31.103' AS DateTime), 800, 0, 800, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (50, CAST(N'2020-01-26 04:53:38.167' AS DateTime), 1200, 0, 1200, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (51, CAST(N'2020-01-26 04:53:49.847' AS DateTime), 3600, 0, 3600, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (52, CAST(N'2020-01-26 04:53:59.393' AS DateTime), 2200, 0, 2200, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (53, CAST(N'2020-01-26 04:54:00.097' AS DateTime), 2200, 0, 2200, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (54, CAST(N'2020-01-26 04:54:06.467' AS DateTime), 800, 0, 800, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (55, CAST(N'2020-01-26 04:54:11.450' AS DateTime), 2000, 0, 2000, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (56, CAST(N'2020-01-26 04:54:18.213' AS DateTime), 1600, 0, 1600, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (57, CAST(N'2020-01-26 04:54:45.147' AS DateTime), 3200, 0, 3200, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (58, CAST(N'2020-01-26 04:54:56.890' AS DateTime), 4200, 0, 4200, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (59, CAST(N'2020-01-26 04:55:16.497' AS DateTime), 3000, 0, 3000, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (60, CAST(N'2020-01-26 04:55:28.967' AS DateTime), 3600, 0, 3600, N'', NULL, NULL, N'a', NULL, 1009)
INSERT [dbo].[CustomerOrder] ([customerOrder_Id], [dateOfOrder], [totalAmount], [discount], [finalAmount], [customerName], [orderRemarks], [deleteStatus], [deleteRemarks], [deleteDate], [employee_Id]) VALUES (61, CAST(N'2020-01-26 04:55:44.527' AS DateTime), 5000, 0, 5000, N'', NULL, NULL, N'a', NULL, 1009)
SET IDENTITY_INSERT [dbo].[CustomerOrder] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([employee_Id], [employeeName], [employeeContactNo], [employeeAddress], [salary], [dateOfHiring], [typeOfEmployee], [DeleteStatus]) VALUES (1009, N'Majid Kaleem', N'0321-231230', N'U-102, Malir Colony, Karachi', 15000, N'01-07-2019', N'Salesman', 0)
INSERT [dbo].[Employee] ([employee_Id], [employeeName], [employeeContactNo], [employeeAddress], [salary], [dateOfHiring], [typeOfEmployee], [DeleteStatus]) VALUES (1010, N'Wafa Khan', N'0320-123593', N'770, Blaid View, Johar', 25000, N'12-11-2018', N'HeadOffice Manager', 0)
INSERT [dbo].[Employee] ([employee_Id], [employeeName], [employeeContactNo], [employeeAddress], [salary], [dateOfHiring], [typeOfEmployee], [DeleteStatus]) VALUES (1011, N'Nasir Hameed', N'0324-123840', N'B-88, Belle View Appartments, Johar', 15000, N'17-08-2019', N'Stock Boy', 0)
INSERT [dbo].[Employee] ([employee_Id], [employeeName], [employeeContactNo], [employeeAddress], [salary], [dateOfHiring], [typeOfEmployee], [DeleteStatus]) VALUES (1012, N'Aiman Shah', N'0321-211393', N'D121, Rufi Fountain, Karachi', 20000, N'18-12-2019', N'Branch Manager', 0)
INSERT [dbo].[Employee] ([employee_Id], [employeeName], [employeeContactNo], [employeeAddress], [salary], [dateOfHiring], [typeOfEmployee], [DeleteStatus]) VALUES (1013, N'Yousuf Shah', N'0344-231849', N'H-100, Malir Cantt, Karachi', 40000, N'17-04-2018', N'HeadOffice Manager', 0)
INSERT [dbo].[Employee] ([employee_Id], [employeeName], [employeeContactNo], [employeeAddress], [salary], [dateOfHiring], [typeOfEmployee], [DeleteStatus]) VALUES (1014, N'Hamza Shah', N'0329-329192', N'F-21, Farhan Classic, Johar', 24000, N'17-07-2019', N'Stock Boy', 0)
INSERT [dbo].[Employee] ([employee_Id], [employeeName], [employeeContactNo], [employeeAddress], [salary], [dateOfHiring], [typeOfEmployee], [DeleteStatus]) VALUES (1015, N'Kashif Khan', N'0323-129489', N'A-29, Mariam Paradise, Karachi', 10000, N'20-11-2019', N'Stock Boy', 0)
INSERT [dbo].[Employee] ([employee_Id], [employeeName], [employeeContactNo], [employeeAddress], [salary], [dateOfHiring], [typeOfEmployee], [DeleteStatus]) VALUES (1016, N'Farooq Shah', N'0329-123849', N'D-22, Royal View, Johar', 24000, N'01-10-2019', N'Salesman', 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Outlet] ON 

INSERT [dbo].[Outlet] ([outlet_Id], [outletName], [outletAddress]) VALUES (1, N'outlet 1', N'abc')
INSERT [dbo].[Outlet] ([outlet_Id], [outletName], [outletAddress]) VALUES (2, N'outlet 2', N'cdb')
SET IDENTITY_INSERT [dbo].[Outlet] OFF
SET IDENTITY_INSERT [dbo].[Outlet_ShoeSizeColor] ON 

INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (14, 61, 1, 30)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (15, 62, 1, 26)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (16, 67, 1, 15)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (17, 68, 1, 20)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (18, 65, 1, 5)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (19, 78, 1, 10)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (20, 78, 1, 12)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (21, 81, 1, 5)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (22, 83, 1, 15)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (23, 84, 1, 10)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (24, 121, 1, 14)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (25, 121, 1, 10)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (26, 121, 1, 15)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (27, 123, 1, 14)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (28, 71, 1, 10)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (29, 145, 1, 4)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (30, 144, 1, 5)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (31, 144, 1, 8)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (32, 97, 1, 6)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (33, 96, 1, 6)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (34, 120, 1, 23)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (35, 119, 1, 13)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (36, 126, 1, 14)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (37, 156, 1, 6)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (38, 61, 2, 4)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (39, 62, 2, 4)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (40, 106, 2, 5)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (41, 107, 2, 3)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (42, 122, 2, 5)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (43, 123, 2, 5)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (44, 63, 2, 4)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (45, 96, 2, 5)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (46, 95, 2, 2)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (47, 119, 2, 20)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (48, 63, 1, 4)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (49, 165, 2, 10)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (50, 79, 1, 4)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (51, 94, 1, 3)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (52, 106, 1, 5)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (53, 122, 1, 4)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (54, 124, 1, 5)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (55, 131, 1, 4)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (56, 133, 1, 3)
INSERT [dbo].[Outlet_ShoeSizeColor] ([outletShoeSizeColor], [shoeSizeColor_Id], [outlet_Id], [quantity]) VALUES (57, 139, 1, 5)
SET IDENTITY_INSERT [dbo].[Outlet_ShoeSizeColor] OFF
SET IDENTITY_INSERT [dbo].[Shoe] ON 

INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (37, N'A-501', 600, 1000, N'Gents', CAST(N'2020-01-08' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (38, N'A-321', 900, 1000, N'Gents', CAST(N'2020-01-28' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (39, N'B-102', 600, 1600, N'Gents', CAST(N'2020-01-08' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (40, N'U-009', 500, 1400, N'Gents', CAST(N'2019-12-10' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (41, N'A-220', 400, 800, N'Gents', CAST(N'2019-11-13' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (42, N'A-301', 200, 600, N'Gents', CAST(N'2020-01-26' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (43, N'H-221', 200, 1500, N'Gents', CAST(N'2020-01-21' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (44, N'Y-221', 900, 1500, N'Gents', CAST(N'2020-01-28' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (45, N'R-301', 500, 1000, N'Gents', CAST(N'2019-12-10' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (46, N'A-200', 200, 1000, N'Gents', CAST(N'2020-01-21' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (47, N'A-231', 300, 400, N'Gents', CAST(N'2019-11-30' AS Date))
INSERT [dbo].[Shoe] ([shoe_Id], [shoeArticle], [shoeCost], [shoePrice], [shoeVariety], [UpdateDate]) VALUES (48, N'A-777', 300, 1200, N'Gents', CAST(N'2019-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[Shoe] OFF
SET IDENTITY_INSERT [dbo].[Shoe_Size] ON 

INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (66, 37, 1)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (67, 37, 1)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (68, 37, 1)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (69, 37, 1)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (70, 37, 2)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (71, 37, 2)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (72, 37, 2)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (73, 37, 2)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (74, 37, 3)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (75, 37, 3)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (76, 37, 3)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (77, 37, 3)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (78, 37, 4)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (79, 37, 4)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (80, 37, 4)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (81, 37, 5)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (82, 37, 5)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (83, 37, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (84, 38, 3)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (85, 38, 3)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (86, 38, 3)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (87, 38, 4)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (88, 38, 4)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (89, 38, 4)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (90, 38, 4)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (91, 38, 5)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (92, 38, 5)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (93, 38, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (94, 38, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (95, 38, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (96, 38, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (97, 38, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (98, 38, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (99, 39, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (100, 39, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (101, 39, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (102, 39, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (103, 39, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (104, 39, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (105, 39, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (106, 39, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (107, 39, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (108, 39, 9)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (109, 39, 9)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (110, 40, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (111, 40, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (112, 40, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (113, 40, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (114, 40, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (115, 40, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (116, 40, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (117, 40, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (118, 40, 9)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (119, 40, 9)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (120, 40, 9)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (121, 40, 9)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (122, 40, 10)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (123, 40, 10)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (124, 41, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (125, 41, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (126, 41, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (127, 42, 10)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (128, 42, 10)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (129, 43, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (130, 43, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (131, 44, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (132, 44, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (133, 44, 10)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (134, 44, 10)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (135, 44, 10)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (136, 45, 11)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (137, 46, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (138, 46, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (139, 46, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (140, 46, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (141, 46, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (142, 47, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (143, 47, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (144, 47, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (145, 47, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (146, 47, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (147, 47, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (148, 48, 9)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (149, 48, 9)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (150, 48, 10)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (151, 45, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (152, 45, 6)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (153, 45, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (154, 45, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (155, 40, 3)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (156, 45, 4)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (157, 45, 4)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (158, 39, 10)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (159, 44, 8)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (160, 37, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (161, 38, 9)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (162, 42, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (163, 43, 7)
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (164, 46, 2)
GO
INSERT [dbo].[Shoe_Size] ([shoeSize_Id], [shoe_Id], [size_Id]) VALUES (165, 46, 2)
SET IDENTITY_INSERT [dbo].[Shoe_Size] OFF
SET IDENTITY_INSERT [dbo].[Shoe_Size_Color] ON 

INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (61, 66, 1, 66)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (62, 66, 2, 20)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (63, 66, 5, 22)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (64, 66, 4, 45)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (65, 70, 1, 82)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (66, 70, 2, 80)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (67, 70, 3, 55)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (68, 70, 4, 26)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (69, 74, 20, 32)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (70, 74, 7, 40)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (71, 74, 6, 35)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (72, 74, 4, 87)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (73, 78, 2, 46)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (74, 78, 1, 55)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (75, 78, 4, 25)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (76, 81, 5, 45)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (77, 81, 6, 46)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (78, 83, 7, 8)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (79, 84, 20, 52)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (80, 84, 1, 87)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (81, 84, 2, 40)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (82, 87, 1, 77)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (83, 87, 2, 64)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (84, 87, 3, 40)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (85, 87, 4, 40)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (86, 91, 5, 65)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (87, 91, 6, 77)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (88, 93, 7, 35)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (89, 93, 20, 36)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (90, 95, 1, 87)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (91, 95, 2, 100)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (92, 95, 3, 45)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (93, 98, 4, 46)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (94, 99, 5, 75)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (95, 99, 6, 96)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (96, 99, 7, 54)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (97, 99, 20, 29)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (98, 103, 1, 45)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (99, 103, 2, 140)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (100, 103, 3, 92)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (101, 106, 4, 50)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (102, 106, 5, 90)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (103, 108, 6, 46)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (104, 108, 7, 50)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (105, 110, 20, 80)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (106, 110, 1, 66)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (107, 110, 2, 85)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (108, 113, 3, 108)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (109, 113, 4, 46)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (110, 115, 5, 32)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (111, 115, 6, 57)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (112, 115, 7, 77)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (113, 118, 20, 54)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (114, 118, 1, 64)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (115, 118, 2, 52)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (116, 118, 3, 70)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (117, 122, 4, 78)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (118, 122, 5, 70)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (119, 124, 6, 7)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (120, 124, 7, 12)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (121, 126, 20, -1)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (122, 127, 1, 35)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (123, 127, 2, 26)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (124, 129, 1, 29)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (125, 129, 3, 35)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (126, 131, 4, 16)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (127, 131, 5, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (128, 133, 6, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (129, 133, 7, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (130, 133, 20, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (131, 136, 1, 26)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (132, 137, 1, 45)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (133, 137, 2, 27)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (134, 139, 3, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (135, 139, 4, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (136, 141, 5, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (137, 142, 6, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (138, 142, 7, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (139, 144, 20, 25)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (140, 144, 1, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (141, 144, 2, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (142, 147, 3, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (143, 148, 4, 35)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (144, 148, 5, 17)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (145, 150, 6, 26)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (146, 151, 4, 35)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (147, 151, 5, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (148, 153, 6, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (149, 153, 7, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (150, 113, 2, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (151, 155, 1, 36)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (152, 156, 2, 38)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (153, 156, 3, 40)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (154, 153, 4, 36)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (155, 153, 5, 40)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (156, 131, 1, 69)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (157, 158, 4, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (158, 131, 2, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (159, 159, 3, 40)
GO
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (160, 160, 4, 30)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (161, 141, 1, 35)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (162, 161, 2, 40)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (163, 133, 3, 50)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (164, 133, 4, 60)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (165, 162, 4, 20)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (166, 163, 1, 20)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (167, 164, 2, 22)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (168, 164, 3, 10)
INSERT [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id], [shoeSize_Id], [color_Id], [quantityInWH]) VALUES (169, 141, 4, 34)
SET IDENTITY_INSERT [dbo].[Shoe_Size_Color] OFF
SET IDENTITY_INSERT [dbo].[ShoeSizeColor_CustomerOrder] ON 

INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (47, 1000, 1, 41, 61, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (48, 1000, 2, 42, 82, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (49, 1400, 1, 42, 105, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (50, 600, 1, 43, 122, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (51, 1000, 1, 43, 132, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (52, 1200, 1, 43, 143, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (53, 800, 1, 44, 121, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (54, 1000, 3, 45, 82, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (55, 1000, 3, 45, 83, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (56, 1000, 2, 46, 131, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (57, 400, 2, 46, 137, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (58, 400, 3, 47, 141, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (59, 400, 3, 47, 137, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (60, 600, 3, 48, 165, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (61, 800, 1, 49, 121, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (62, 1200, 1, 50, 145, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (63, 800, 1, 51, 121, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (64, 1600, 1, 51, 94, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (65, 1200, 1, 51, 143, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (66, 1000, 1, 52, 61, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (67, 800, 1, 52, 119, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (68, 400, 1, 52, 137, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (69, 1000, 1, 53, 61, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (70, 800, 1, 53, 119, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (71, 400, 1, 53, 137, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (72, 800, 1, 54, 119, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (73, 1000, 1, 55, 61, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (74, 1000, 1, 55, 79, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (75, 600, 1, 56, 122, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (76, 1000, 1, 56, 79, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (77, 1000, 1, 57, 61, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (78, 1400, 1, 57, 105, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (79, 800, 1, 57, 121, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (80, 1500, 1, 58, 124, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (81, 1200, 1, 58, 143, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (82, 1500, 1, 58, 126, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (83, 800, 1, 59, 121, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (84, 1200, 1, 59, 144, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (85, 1000, 1, 59, 131, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (86, 1000, 1, 60, 61, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (87, 1000, 1, 60, 79, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (88, 1600, 1, 60, 94, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (89, 800, 1, 61, 119, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (90, 600, 2, 61, 122, 30)
INSERT [dbo].[ShoeSizeColor_CustomerOrder] ([shoeSizeColorCustomerOrder_Id], [price], [quantity], [customerOrder_Id], [shoeSizeColor_Id], [batch_Id]) VALUES (91, 1500, 2, 61, 124, 30)
SET IDENTITY_INSERT [dbo].[ShoeSizeColor_CustomerOrder] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (1, 35)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (2, 36)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (3, 37)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (4, 38)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (5, 39)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (6, 40)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (7, 41)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (8, 42)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (9, 43)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (10, 44)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (11, 45)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (12, 12)
INSERT [dbo].[Size] ([size_Id], [sizeNo]) VALUES (13, 13)
SET IDENTITY_INSERT [dbo].[Size] OFF
SET IDENTITY_INSERT [dbo].[Transfer_ShoeSizeColor] ON 

INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (29, 10, 61, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (30, 15, 62, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (31, 15, 67, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (32, 20, 68, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (33, 5, 65, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (34, 10, 78, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (35, 12, 78, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (36, 5, 81, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (37, 15, 83, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (38, 10, 84, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (39, 14, 121, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (40, 10, 121, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (41, 15, 121, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (42, 14, 123, 12)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (43, 4, 61, 13)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (44, 5, 62, 13)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (45, 10, 71, 13)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (46, 4, 145, 13)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (47, 5, 144, 13)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (48, 8, 144, 13)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (49, 6, 61, 14)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (50, 6, 62, 14)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (51, 6, 97, 14)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (52, 6, 96, 14)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (53, 8, 120, 15)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (54, 8, 119, 15)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (55, 4, 126, 16)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (56, 6, 156, 16)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (57, 2, 61, 17)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (58, 4, 62, 17)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (59, 5, 106, 17)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (60, 3, 107, 17)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (61, 5, 122, 17)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (62, 3, 123, 17)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (63, 2, 61, 18)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (64, 4, 63, 18)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (65, 5, 96, 18)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (66, 2, 95, 18)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (67, 20, 119, 19)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (68, 10, 61, 20)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (69, 4, 63, 20)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (70, 5, 120, 20)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (71, 5, 119, 21)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (72, 10, 120, 21)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (73, 2, 123, 22)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (74, 10, 165, 22)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (75, 4, 79, 23)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (76, 3, 94, 23)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (77, 5, 106, 23)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (78, 4, 122, 24)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (79, 5, 124, 24)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (80, 10, 126, 24)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (81, 4, 131, 25)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (82, 3, 133, 25)
INSERT [dbo].[Transfer_ShoeSizeColor] ([transferShoeSizeColor_Id], [quantity], [shoeSizeColor_Id], [transfer_Id]) VALUES (83, 5, 139, 25)
SET IDENTITY_INSERT [dbo].[Transfer_ShoeSizeColor] OFF
SET IDENTITY_INSERT [dbo].[TransferRecord] ON 

INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (12, 1, CAST(N'2020-01-26' AS Date), 170)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (13, 1, CAST(N'2019-12-30' AS Date), 36)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (14, 1, CAST(N'2019-11-21' AS Date), 24)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (15, 1, CAST(N'2019-12-12' AS Date), 16)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (16, 1, CAST(N'2020-01-07' AS Date), 10)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (17, 2, CAST(N'2020-01-02' AS Date), 22)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (18, 2, CAST(N'2019-12-12' AS Date), 13)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (19, 2, CAST(N'2019-11-13' AS Date), 20)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (20, 1, CAST(N'2020-01-14' AS Date), 19)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (21, 1, CAST(N'2020-01-01' AS Date), 15)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (22, 2, CAST(N'2020-01-10' AS Date), 12)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (23, 1, CAST(N'2020-01-28' AS Date), 12)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (24, 1, CAST(N'2020-01-25' AS Date), 19)
INSERT [dbo].[TransferRecord] ([transfer_Id], [outlet_Id], [dateOfTransfer], [shoesTransfered]) VALUES (25, 1, CAST(N'2020-01-27' AS Date), 12)
SET IDENTITY_INSERT [dbo].[TransferRecord] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName]) VALUES (2, N'headoffice')
INSERT [dbo].[Users] ([UserId], [UserName]) VALUES (1, N'outlet_1')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Vendor] ON 

INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1009, N'Daniyal Safdar', N'Bata', N'0302-3784848', N'D190, Avenue Plaza, Karachi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1010, N'Afnan Ahmed', N'Service', N'0302-4833884', N'A-78, Main BD Colony, Karachi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1011, N'Huzaifa Khan', N'Czech', N'0322-1231231', N'F-122, Rufi Fountain, Karachi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1012, N'Moazzam Khan', N'Service', N'0321-5783212', N'U-81, PECHS, Karachi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1013, N'Fareed Khan', N'ABZone', N'0343-2889373', N'W-1201, Central Government Society, Johar, Karachi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1014, N'Hamza Ali', N'Bata', N'0322-2849462', N'A-11, Malir Colony, Karachi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1015, N'Intezam Hussain', N'Neepal Shoes', N'0302-3746482', N'Y-19, Bahria Town, Islamabad', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1016, N'Yasir Khan', N'Levis', N'0361-2948764', N'Shop-20B, Khad Market, Rawalpindi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1017, N'Haseeb Shah', N'Service', N'0328-4946192', N'D-77, Rabia City, Johar, Karachi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1018, N'Daniyal Baig', N'Bata', N'0321-3486839', N'F-10, Farhan Tower, Karachi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1019, N'Akhtar Hussain', N'Olson Shoes', N'0328-1728892', N'H-22, Saddar, Karachi', 0)
INSERT [dbo].[Vendor] ([vendor_Id], [vendorName], [vendorCompany], [vendorContactNo], [vendorAddress], [DeleteStatus]) VALUES (1020, N'Inam Khan', N'Service', N'0321-4739932', N'A-201, Main Tower, Karachi', 0)
SET IDENTITY_INSERT [dbo].[Vendor] OFF
SET IDENTITY_INSERT [dbo].[VendorOrder] ON 

INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (28, CAST(N'2019-11-02' AS Date), 150000, 0, 3418, 1009, N'Paid', N'cash', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (29, CAST(N'2019-11-13' AS Date), 40000, 0, 202, 1014, N'Paid', N'cash', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (30, CAST(N'2019-11-20' AS Date), 25000, 0, 249, 1009, N'Paid', N'card', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (31, CAST(N'2019-11-30' AS Date), 50000, 0, 440, 1018, N'Paid', N'cash', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (32, CAST(N'2020-01-26' AS Date), 20000, 0, 245, 1012, N'Paid', N'cash', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (33, CAST(N'2019-12-10' AS Date), 25000, 0, 190, 1009, N'Paid', N'card', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (34, CAST(N'2019-12-10' AS Date), 15000, 0, 147, 1019, N'Paid', N'cash', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (35, CAST(N'2019-12-26' AS Date), 16000, 0, 105, 1009, N'Paid', N'cash', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (36, CAST(N'2020-01-08' AS Date), 14000, 0, 70, 1009, N'Paid', N'card', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (37, CAST(N'2020-01-28' AS Date), 35000, 0, 185, 1011, N'Paid', N'cash', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (38, CAST(N'2020-01-26' AS Date), 10000, 0, 30, 1010, N'Paid', N'cash', NULL, NULL, NULL, N'Full')
INSERT [dbo].[VendorOrder] ([vendorOrder_Id], [dateOfOrder], [totalAmount], [amountRemaining], [totalQty], [vendor_Id], [paymentStatus], [paymentMode], [deleteStatus], [deleteRemarks], [deleteDate], [paymentType]) VALUES (39, CAST(N'2020-01-21' AS Date), 20000, 0, 86, 1016, N'Paid', N'cash', NULL, NULL, NULL, N'Full')
SET IDENTITY_INSERT [dbo].[VendorOrder] OFF
SET IDENTITY_INSERT [dbo].[VendorOrder_ShoeSizeColor] ON 

INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (58, 61, 100, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (59, 62, 50, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (60, 63, 30, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (61, 64, 45, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (62, 65, 87, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (63, 66, 80, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (64, 67, 70, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (65, 68, 46, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (66, 69, 32, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (67, 70, 40, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (68, 71, 45, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (69, 72, 87, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (70, 73, 46, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (71, 74, 55, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (72, 75, 25, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (73, 76, 45, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (74, 77, 46, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (75, 78, 30, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (76, 79, 56, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (77, 80, 87, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (78, 81, 45, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (79, 82, 77, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (80, 83, 79, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (81, 84, 50, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (82, 85, 40, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (83, 86, 65, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (84, 87, 77, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (85, 88, 35, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (86, 89, 36, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (87, 90, 87, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (88, 91, 100, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (89, 92, 45, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (90, 93, 46, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (91, 94, 78, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (92, 95, 98, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (93, 96, 65, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (94, 97, 35, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (95, 98, 45, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (96, 99, 105, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (97, 100, 50, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (98, 101, 50, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (99, 102, 50, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (100, 103, 46, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (101, 104, 50, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (102, 105, 50, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (103, 106, 46, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (104, 107, 88, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (105, 108, 78, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (106, 109, 46, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (107, 110, 32, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (108, 111, 57, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (109, 112, 77, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (110, 113, 54, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (111, 114, 64, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (112, 115, 52, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (113, 116, 70, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (114, 117, 78, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (115, 118, 70, 500, 28)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (116, 119, 40, 400, 29)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (117, 120, 35, 400, 29)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (118, 121, 38, 400, 29)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (119, 122, 44, 400, 29)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (120, 123, 45, 400, 29)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (121, 124, 34, 300, 30)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (122, 125, 35, 300, 30)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (123, 126, 30, 300, 30)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (124, 127, 30, 300, 30)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (125, 128, 30, 300, 30)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (126, 129, 30, 300, 30)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (127, 130, 30, 300, 30)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (128, 131, 30, 300, 30)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (129, 132, 45, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (130, 133, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (131, 134, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (132, 135, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (133, 136, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (134, 137, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (135, 138, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (136, 139, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (137, 140, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (138, 141, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (139, 142, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (140, 143, 35, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (141, 144, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (142, 145, 30, 300, 31)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (143, 146, 35, 500, 32)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (144, 147, 30, 500, 32)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (145, 148, 30, 500, 32)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (146, 149, 30, 500, 32)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (147, 105, 30, 500, 32)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (148, 106, 30, 500, 32)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (149, 150, 30, 500, 32)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (150, 108, 30, 500, 32)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (151, 151, 36, 500, 33)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (152, 152, 38, 500, 33)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (153, 153, 40, 500, 33)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (154, 154, 36, 500, 33)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (155, 155, 40, 500, 33)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (156, 156, 40, 550, 34)
GO
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (157, 99, 35, 550, 34)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (158, 100, 42, 550, 34)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (159, 157, 30, 550, 34)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (160, 156, 35, 400, 35)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (161, 158, 30, 400, 35)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (162, 159, 40, 400, 35)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (163, 160, 30, 600, 36)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (164, 102, 40, 600, 36)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (165, 161, 35, 900, 37)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (166, 162, 40, 900, 37)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (167, 163, 50, 900, 37)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (168, 164, 60, 900, 37)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (169, 165, 30, 200, 38)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (170, 166, 20, 200, 39)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (171, 167, 22, 200, 39)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (172, 168, 10, 200, 39)
INSERT [dbo].[VendorOrder_ShoeSizeColor] ([vendorOrderShoeSizeColor_Id], [shoeSizeColor_Id], [quantity], [cost], [vendorOrder_Id]) VALUES (173, 169, 34, 200, 39)
SET IDENTITY_INSERT [dbo].[VendorOrder_ShoeSizeColor] OFF
SET IDENTITY_INSERT [dbo].[VendorPayment] ON 

INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (23, 28, CAST(N'2019-11-02' AS Date), 150000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (24, 29, CAST(N'2019-11-13' AS Date), 40000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (25, 30, CAST(N'2019-11-20' AS Date), 25000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (26, 31, CAST(N'2019-11-30' AS Date), 50000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (27, 32, CAST(N'2020-01-26' AS Date), 20000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (28, 33, CAST(N'2019-12-10' AS Date), 25000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (29, 34, CAST(N'2019-12-10' AS Date), 15000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (30, 35, CAST(N'2019-12-26' AS Date), 16000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (31, 36, CAST(N'2020-01-08' AS Date), 14000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (32, 37, CAST(N'2020-01-28' AS Date), 35000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (33, 38, CAST(N'2020-01-26' AS Date), 10000, N'N', NULL, NULL)
INSERT [dbo].[VendorPayment] ([vendorPayment_Id], [vendorOrder_Id], [paymentDate], [amount], [deleteStatus], [deleteRemarks], [deleteDate]) VALUES (34, 39, CAST(N'2020-01-21' AS Date), 20000, N'N', NULL, NULL)
SET IDENTITY_INSERT [dbo].[VendorPayment] OFF
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(N'2019-09-04 16:24:46.327' AS DateTime), NULL, 1, CAST(N'2019-09-11 16:51:29.140' AS DateTime), 0, N'ALJyBi9pnZpEssWeb17b/wY903Mghe2gnY8EESWB5/G2h45YGlObO5T67ijTfNTwqw==', CAST(N'2019-09-04 16:24:46.327' AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(N'2019-09-09 23:37:18.640' AS DateTime), NULL, 1, CAST(N'2019-09-13 18:26:22.600' AS DateTime), 0, N'AAyHSo7A2ObxfiFxlX1/vkRgPVhwdVXLgSLtLk6+OEg/jSWkGm2YP9VaVgOmPqKoJQ==', CAST(N'2019-09-09 23:37:18.640' AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON 

INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'headOffice')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'outlet')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 2)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 1)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__C9F2845652874BA8]    Script Date: 1/26/2020 5:07:22 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__webpages__8A2B6160BF1E8F16]    Script Date: 1/26/2020 5:07:22 AM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD FOREIGN KEY([shoe_Id])
REFERENCES [dbo].[Shoe] ([shoe_Id])
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK_Batch_VendorOrder] FOREIGN KEY([vendorOrder_Id])
REFERENCES [dbo].[VendorOrder] ([vendorOrder_Id])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK_Batch_VendorOrder]
GO
ALTER TABLE [dbo].[CustomerOrder]  WITH CHECK ADD  CONSTRAINT [FK__CustomerO__emplo__239E4DCF] FOREIGN KEY([employee_Id])
REFERENCES [dbo].[Employee] ([employee_Id])
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK__CustomerO__emplo__239E4DCF]
GO
ALTER TABLE [dbo].[Outlet_ShoeSizeColor]  WITH CHECK ADD FOREIGN KEY([outlet_Id])
REFERENCES [dbo].[Outlet] ([outlet_Id])
GO
ALTER TABLE [dbo].[Outlet_ShoeSizeColor]  WITH CHECK ADD FOREIGN KEY([shoeSizeColor_Id])
REFERENCES [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id])
GO
ALTER TABLE [dbo].[RemainingPayment]  WITH CHECK ADD FOREIGN KEY([vendorOrder_Id])
REFERENCES [dbo].[VendorOrder] ([vendorOrder_Id])
GO
ALTER TABLE [dbo].[Shoe_Size]  WITH CHECK ADD FOREIGN KEY([shoe_Id])
REFERENCES [dbo].[Shoe] ([shoe_Id])
GO
ALTER TABLE [dbo].[Shoe_Size]  WITH CHECK ADD FOREIGN KEY([size_Id])
REFERENCES [dbo].[Size] ([size_Id])
GO
ALTER TABLE [dbo].[Shoe_Size_Color]  WITH CHECK ADD FOREIGN KEY([color_Id])
REFERENCES [dbo].[Color] ([color_Id])
GO
ALTER TABLE [dbo].[Shoe_Size_Color]  WITH CHECK ADD FOREIGN KEY([shoeSize_Id])
REFERENCES [dbo].[Shoe_Size] ([shoeSize_Id])
GO
ALTER TABLE [dbo].[ShoeSizeColor_CustomerOrder]  WITH CHECK ADD FOREIGN KEY([batch_Id])
REFERENCES [dbo].[Batch] ([batch_Id])
GO
ALTER TABLE [dbo].[ShoeSizeColor_CustomerOrder]  WITH CHECK ADD FOREIGN KEY([customerOrder_Id])
REFERENCES [dbo].[CustomerOrder] ([customerOrder_Id])
GO
ALTER TABLE [dbo].[ShoeSizeColor_CustomerOrder]  WITH CHECK ADD FOREIGN KEY([shoeSizeColor_Id])
REFERENCES [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id])
GO
ALTER TABLE [dbo].[Transfer_ShoeSizeColor]  WITH CHECK ADD FOREIGN KEY([shoeSizeColor_Id])
REFERENCES [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id])
GO
ALTER TABLE [dbo].[Transfer_ShoeSizeColor]  WITH CHECK ADD FOREIGN KEY([transfer_Id])
REFERENCES [dbo].[TransferRecord] ([transfer_Id])
GO
ALTER TABLE [dbo].[TransferRecord]  WITH CHECK ADD FOREIGN KEY([outlet_Id])
REFERENCES [dbo].[Outlet] ([outlet_Id])
GO
ALTER TABLE [dbo].[VendorOrder]  WITH CHECK ADD FOREIGN KEY([vendor_Id])
REFERENCES [dbo].[Vendor] ([vendor_Id])
GO
ALTER TABLE [dbo].[VendorOrder_ShoeSizeColor]  WITH CHECK ADD FOREIGN KEY([shoeSizeColor_Id])
REFERENCES [dbo].[Shoe_Size_Color] ([shoeSizeColor_Id])
GO
ALTER TABLE [dbo].[VendorOrder_ShoeSizeColor]  WITH CHECK ADD FOREIGN KEY([vendorOrder_Id])
REFERENCES [dbo].[VendorOrder] ([vendorOrder_Id])
GO
ALTER TABLE [dbo].[VendorPayment]  WITH CHECK ADD FOREIGN KEY([vendorOrder_Id])
REFERENCES [dbo].[VendorOrder] ([vendorOrder_Id])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [HabibFootwear] SET  READ_WRITE 
GO
