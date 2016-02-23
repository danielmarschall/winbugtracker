
CREATE TABLE [dbo].[bugs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titel] [varchar](255) NULL,
	[beschreibung] [text] NULL,
	[erstellt] [datetime] NOT NULL,
	[wichtigkeit] [int] NOT NULL,
	[erfasser] [int] NOT NULL,
	[bearbeiter] [int] NULL,
	[fixdatum] [datetime] NULL,
	[version_release] [int] NULL,
	[version_agenda] [int] NULL,
	[modul] [int] NULL,
	[projekt] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
ALTER TABLE [dbo].[bugs] ADD  CONSTRAINT [DF_bugs_wichtigkeit]  DEFAULT ((5)) FOR [wichtigkeit]

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
