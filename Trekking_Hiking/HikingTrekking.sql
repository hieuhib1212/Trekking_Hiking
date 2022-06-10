USE master
GO
--DROP DATABASE HikingTrekking
GO
CREATE DATABASE HikingTrekking
GO
USE "HikingTrekking"
GO
CREATE TABLE Welcome(
   [Image] VARCHAR(200) NOT NULL,
   [Description] NVARCHAR(MAX) NOT NULL
)
GO 
INSERT INTO Welcome([Image],[Description]) VALUES(N'welcome.jpg',N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.')
GO
CREATE TABLE Trekking_Links(
   ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
   Title NVARCHAR(50) NOT NULL,
   Link_Url NVARCHAR(200) NOT NULL,
   Content NVARCHAR(MAX) NOT NULL
)
GO
INSERT INTO Trekking_Links(Title, Link_Url, Content) VALUES(N'Adventure travel', N'https://www.lonelyplanet.com/articles/category/adventure-travel', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad mini')
INSERT INTO Trekking_Links(Title, Link_Url, Content) VALUES(N'The Wildland Trekking Com', N'https://www.tripadvisor.dk/Attraction_Review-g143028-d2018905-Reviews-Wildland_Trekking-Grand_Canyon_National_Park_Arizona.html', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad mini')
INSERT INTO Trekking_Links(Title, Link_Url, Content) VALUES(N'World''s Best Hikes: Epic', N'https://www.lonelyplanet.com/articles/category/adventure-travel', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad mini')
INSERT INTO Trekking_Links(Title, Link_Url, Content) VALUES(N'The 10 best treks in the', N'https://www.lonelyplanet.com/articles/category/adventure-travel', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad mini')
INSERT INTO Trekking_Links(Title, Link_Url, Content) VALUES(N'Adventure travel', N'https://www.lonelyplanet.com/articles/category/adventure-travel', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad mini')
INSERT INTO Trekking_Links(Title, Link_Url, Content) VALUES(N'World''s Best Hikes: Epic', N'https://www.lonelyplanet.com/articles/category/adventure-travel', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad mini')
INSERT INTO Trekking_Links(Title, Link_Url, Content) VALUES(N'The Wildland Trekking Com', N'https://www.lonelyplanet.com/articles/category/adventure-travel', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad mini')
INSERT INTO Trekking_Links(Title, Link_Url, Content) VALUES(N'The 10 best treks in the', N'https://www.lonelyplanet.com/articles/category/adventure-travel', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad mini')
GO
CREATE TABLE Diary(
   ID int IDENTITY(1,1) PRIMARY KEY,
   Title NVARCHAR(50) NOT NULL,
   Image_Url NVARCHAR(50),
   Content NVARCHAR(MAX) NOT NULL
)
GO
INSERT INTO Diary(Title, Image_Url, Content) VALUES(N'Day 1',N'1.jpg',N'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.')
INSERT INTO Diary(Title, Image_Url, Content) VALUES(N'Day 2',N'2.jpg',N'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.')
INSERT INTO Diary(Title, Image_Url, Content) VALUES(N'Day 3',N'3.jpg',N'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.')
INSERT INTO Diary(Title, Image_Url, Content) VALUES(N'Day 4',N'4.jpg',N'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.')
INSERT INTO Diary(Title, Image_Url, Content) VALUES(N'Day 5',N'5.jpg',N'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.')
INSERT INTO Diary(Title, Image_Url, Content) VALUES(N'Day 6',N'6.jpg',N'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.')
INSERT INTO Diary(Title, Image_Url, Content) VALUES(N'Day 7',N'7.jpg',N'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.')
INSERT INTO Diary(Title, Image_Url, Content) VALUES(N'Day 8',N'8.jpg',N'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.')
INSERT INTO Diary(Title, Image_Url, Content) VALUES(N'Day 9',N'9.jpg',N'Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.')
GO 
CREATE TABLE Pages(
   Page_ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
   Page_Name NVARCHAR(50) NOT NULL,
   Page_Image NVARCHAR(200) NOT NULL,
   Page_Des NVARCHAR(MAX) NOT NULL,
   Page_Link NVARCHAR(50) NOT NULL
)
GO
INSERT INTO Pages(Page_Name, Page_Image, Page_Des, Page_Link) 
VALUES(N'Our Diary', N'2.jpg', N'Typi non habent claritatem insitam liber.', N'DiaryController')
INSERT INTO Pages(Page_Name, Page_Image, Page_Des, Page_Link) 
VALUES(N'PhotoAlbum', N'3.jpg', N'Typi non habent claritatem insitam liber.', N'AlbumController')
INSERT INTO Pages(Page_Name, Page_Image, Page_Des, Page_Link) 
VALUES(N'Trekking Links', N'4.jpg', N'Typi non habent claritatem insitam liber.', N'LinksController')
GO
CREATE TABLE Shares(
   title NVARCHAR(50),
   icon NVARCHAR(50),
   link NVARCHAR(MAX)
)
GO
INSERT INTO Shares VALUES(N'Share on FaceBook', N'face.png', N'facebook')
INSERT INTO Shares VALUES(N'Share on Twitter', N'twitter.png', N'facebook')
INSERT INTO Shares VALUES(N'Share on Google+', N'google.png', N'facebook')
GO
CREATE TABLE Images(
   id INT IDENTITY(1,1) PRIMARY KEY,
   image_url NVARCHAR(MAX) 
)
GO
INSERT INTO Images (image_url) VALUES(N'1.jpg')
INSERT INTO Images (image_url) VALUES(N'2.jpg')
INSERT INTO Images (image_url) VALUES(N'3.jpg')
INSERT INTO Images (image_url) VALUES(N'4.jpg')
INSERT INTO Images (image_url) VALUES(N'5.jpg')
INSERT INTO Images (image_url) VALUES(N'6.jpg')
INSERT INTO Images (image_url) VALUES(N'7.jpg')
INSERT INTO Images (image_url) VALUES(N'8.jpg')
INSERT INTO Images (image_url) VALUES(N'9.jpg')
INSERT INTO Images (image_url) VALUES(N'10.jpg')
INSERT INTO Images (image_url) VALUES(N'welcome.jpg')
INSERT INTO Images (image_url) VALUES(N'1.jpg')
INSERT INTO Images (image_url) VALUES(N'2.jpg')
INSERT INTO Images (image_url) VALUES(N'3.jpg')
GO 
CREATE TABLE [View] (number INT)
GO
INSERT INTO [View] VALUES(14)