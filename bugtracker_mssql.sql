
CREATE TABLE [dbo].[bugs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titel] [varchar](255) NULL,
	[beschreibung] [text] NULL,
	[erstellt] [datetime] NOT NULL,
	[wichtigkeit] [int] NOT NULL,
	[erfasser] [int] NOT NULL,
	[bearbeiter] [int] NULL,
	[status] [int] NOT NULL,
	[status_geandert] [datetime] NULL,
	[version_release] [int] NULL,
	[version_agenda] [int] NULL,
	[modul] [int] NULL,
	[projekt] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
ALTER TABLE [dbo].[bugs] ADD  CONSTRAINT [DF_bugs_wichtigkeit]  DEFAULT ((5)) FOR [wichtigkeit]
ALTER TABLE [dbo].[bugs] ADD  CONSTRAINT [DF_bugs_status]  DEFAULT ((1)) FOR [status]

CREATE TABLE [dbo].[mitarbeiter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[module](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[modul] [varchar](255) NULL,
	[projekt] [int] NOT NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[projekte](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[projekt] [varchar](255) NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[versionen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[version] [varchar](255) NULL,
	[projekt] [int] NOT NULL
) ON [PRIMARY]

CREATE TABLE [dbo].[lkp_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](255) NULL,
	[color] [int] NOT NULL
) ON [PRIMARY]
ALTER TABLE [dbo].[lkp_status] ADD  CONSTRAINT [DF_lkp_status_color]  DEFAULT ((0))

INSERT INTO [lkp_status] ([status]) VALUES ('Offen', 255);
INSERT INTO [lkp_status] ([status]) VALUES ('Abgelehnt', 128);
INSERT INTO [lkp_status] ([status]) VALUES ('In Arbeit', 8388736);
INSERT INTO [lkp_status] ([status]) VALUES ('Abgeschlossen', 8421376);
INSERT INTO [lkp_status] ([status]) VALUES ('Veröffentlicht', 32768);
