#
# MySQL Statements for simple Postfix virtualisation
#

CREATE TABLE IF NOT EXISTS Domains_tbl (
	DomainId INT NOT NULL AUTO_INCREMENT,
	DomainName VARCHAR(50) NOT NULL,
	PRIMARY KEY (DomainId),
	UNIQUE KEY DomainName (DomainName)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Users_tbl (
	UserId INT NOT NULL AUTO_INCREMENT,
	DomainId INT NOT NULL,
	password VARCHAR(128) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	PRIMARY KEY (UserId),
	UNIQUE KEY Email (Email),
	FOREIGN KEY (DomainId) REFERENCES Domains_tbl(DomainId) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Alias_tbl (
	AliasId INT NOT NULL AUTO_INCREMENT,
	DomainId INT NOT NULL,
	Source varchar(100) NOT NULL,
	Destination varchar(100) NOT NULL,
	PRIMARY KEY (AliasId),
	UNIQUE KEY Alias (Source, Destination),
	FOREIGN KEY (DomainId) REFERENCES Domains_tbl(DomainId) ON DELETE CASCADE
) ENGINE = InnoDB;

