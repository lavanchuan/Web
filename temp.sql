drop database if EXISTS book;

CREATE DATABASE book;

use book;

-- Admin

create table tb_adminAccount(
    email   varchar(256) PRIMARY KEY,
    password    varchar(256)    
);

insert into tb_adminAccount value ("admin@gmail.com", "admin");

create table tb_adminInfo(
    email   varchar(256) PRIMARY KEY,
    fullName    varchar(256),
    birthday    date,
    address     varchar(256),
    phone       varchar(10),
    CONSTRAINT foreign key (email) REFERENCES tb_adminAccount(email)
);

-- 

insert into tb_adminInfo values ("admin@gmail.com", "Thai Dang Khoi", 
"2002/04/23", "Da Nang", "0947700783");



-- / Admin



-- Book category
create table tb_bookCategory(

    bookCategoryId      int auto_increment primary key,
    bookCategoryName    varchar(256)
);

insert into tb_bookCategory(bookCategoryName) values
("Tieu thuyet"),
("Truyen ngan"),
("ngon tinh"),
("tam ly"),
("ren luyen nhan cach"),
("Quan tri-lanh dao"),
("phan tich kinh te"),
("chinh tri"),
("nghe thuat-giai tri");
-- /Book category

-- Author
create table tb_author(
    authorId        int auto_increment primary key,
    authorName      varchar(256),
    authorAddress   varchar(256),
    birthday        date
);

insert into tb_author(authorName, authorAddress, birthday) values
("Paulo Coelho", "Rio de Janeiro", "1947/08/24"),
("Nhiều tác giả","...","1928/12/12"),
("Thư Nghi","Viet nam","1985/12/12"),
("Cao Minh","Trung quoc","1974/12/12"),
("Dale Carnegie","Hoa Kỳ","1888/11/24"),
("T Harv Eker","toronto","1954/6/10"),
("Michael Goodwin","Hoa Kỳ","1939/4/28"),
("Đặng Thuỳ Trâm","Việt Nam","1942/11/26"),
("Huyền Thoại Marvel - Stan Lee","Hoa Kỳ","1968/8/29");
-- /Author


-- Book
create table tb_book(

    bookId      int auto_increment primary key,
    bookName    varchar(256),
    authorId    int,
    bookCategoryId  int,
    nxb         date,
    description varchar(256),
    CONSTRAINT FOREIGN KEY (authorId) REFERENCES tb_author(authorId),
    CONSTRAINT FOREIGN KEY (bookCategoryId) REFERENCES tb_bookCategory(bookCategoryId)
);

insert into tb_book(bookName, authorId, bookCategoryId, nxb, description) values
("Nhà giả kim", 1, 1, "2020/12/12", "NXB Hội Nhà Văn"),
("có một ngày,bố mẹ sẽ già đi",2,2,"2020/12/12","	NXB Thế Giới"),
("TỪNG CÓ MỘT NGƯỜI, YÊU TÔI NHƯ SINH MỆNH",3,3,"2020/12/12","NXB Văn Học"),
("Thiên Tài Bên Trái, Kẻ Điên Bên Phải",4,4,"2021/12/12","NXB Thế Giới"),
("Đắc Nhân Tâm",5,5,"2021/12/12","NXB Tổng Hợp TPHCM"),
("Bí Mật Tư Duy Triệu Phú",6,6,"2000/12/12","NXB Tổng Hợp TPHCM"),
("Economix - Các Nền Kinh Tế Vận Hành",7,7,"2002/12/12","NXB Dân Trí"),
("Nhật Ký Đặng Thùy Trâm",8,8,"2018/12/12","NXB Hội Nhà Văn"),
("Huyền Thoại Marvel - Stan Lee",9,9,"2018/12/12","NXB Văn Học"),
("Huyền Thoại Marvel - Stan Lee",1,1,"2018/12/12","NXB Văn Học");
-- /Book