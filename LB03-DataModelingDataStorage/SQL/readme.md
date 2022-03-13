# SQL / SQlite  README
###### Last update: 13/3/22 dbe
</br>  

![image](https://user-images.githubusercontent.com/52699611/158074344-d10d01a2-34b8-4dff-a7e3-d26b7bd118b1.png)


### [SQLite Sample Database & Tutorial](https://www.sqlitetutorial.net/sqlite-sample-database/)

Introduction to chinook SQLite sample database. We provide you with the SQLite sample database named chinook. The chinook sample database is a good database for practicing with SQL, especially SQLite.

![image](https://user-images.githubusercontent.com/52699611/158073902-ac142af3-ca85-4fe8-81f5-cef62ca1094a.png)

### The Chinook Sample Database Tables
There are **11 tables** in the chinook sample database.

+ **employees** table stores employees data such as employee id, last name, first name, etc. It also has a field named ReportsTo to specify who reports to whom.  
+ **customers** table stores customers data.  
+ **invoices** & **invoice_items** tables: these two tables store invoice data. The invoices table stores invoice header data and the invoice_items table stores the invoice line items data.  
+ **artists** table stores artists data. It is a simple table that contains only the artist id and name.  
+ **albums** table stores data about a list of tracks. Each album belongs to one artist. However, one artist may have multiple albums.  
+ **media_types** table stores media types such as MPEG audio and AAC audio files.  
+ **genres** table stores music types such as rock, jazz, metal, etc.  
+ **tracks** table stores the data of songs. Each track belongs to one album.  
+ **playlists** & **playlist_track** tables: playlists table store data about playlists. Each playlist contains a list of tracks. Each track may belong to multiple playlists. The relationship between the playlists table and tracks table is many-to-many. The playlist_track table is used to reflect this relationship.  

### Download SQLite Sample Database
You can download the [SQLite sample database](https://github.com/sawubona-gmbh/BINA-FS22-WORK/blob/main/LB03-DataModelingDataStorage/SQL/sqlite-sample-database-chinook.db) from this repository and explore the *xxx.db* file with an Online SQLite Browser (eg. [SQLite Viewer](https://inloop.github.io/sqlite-viewer/)), a local SQlite Browser installation (e.g. [DB Browser for SQlite ](https://sqlitebrowser.org/))  or a [Python script](https://towardsdatascience.com/python-sqlite-tutorial-the-ultimate-guide-fdcb8d7a4f30)

In case you want to have the database diagram for reference, you can download both black&white and color versions in PDF format.
