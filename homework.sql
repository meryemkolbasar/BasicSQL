-- 1.Adim --
CREATE TABLE musteri(
	  musteri_no int ,
      isim  varchar(50)NOT NULL CHECK(isim <> ''),
      yas int CHECK(yas > 18),
      cinsiyet char(1),
      gelir real,
      meslek varchar(20),
      sehir varchar(20),
	  constraint musteri_pk PRIMARY KEY(musteri_no)
);
	
	SELECT * FROM musteri;
	
-- 2/3.Adim	--

INSERT INTO musteri VALUES (100,'ALİ', 35, 'E', 2500, 'MÜHENDİS',  'İSTANBUL');
INSERT INTO musteri VALUES(101,'BURAK', 25, 'E', 3500, 'MİMAR',   'İZMİR');
INSERT INTO musteri VALUES(102,'CEYHUN', 45, 'E', 2000, 'MÜHENDİS',  'ANKARA');
INSERT INTO musteri VALUES(103,'DEMET', 30, 'K', 3000, 'ÖĞRETMEN',  'ANKARA');
INSERT INTO musteri VALUES(104,'FERHAT', 40, 'E', 2500, 'MİMAR',   'İZMİR');
INSERT INTO musteri VALUES(105,'GALİP', 55, 'E', 4000, 'ÖĞRETMEN',  'İSTANBUL');
INSERT INTO musteri VALUES(106,'KÖKSAL', 25, 'E', 2000, 'AVUKAT',   'İZMİR');
INSERT INTO musteri VALUES(107,'LEYLA', 60, 'K', 2500, 'MİMAR',   'İSTANBUL');
INSERT INTO musteri VALUES(108,'MELEK', 30, 'K', 2500, 'ÖĞRETMEN',  'İSTANBUL');
INSERT INTO musteri VALUES(109,'JALE',  40, 'K', 6000, 'İŞLETMECİ', 'ANKARA');
INSERT INTO musteri VALUES(110,'TEKİN', 45, 'E', 2000, 'AVUKAT',   'ANKARA');
INSERT INTO musteri VALUES(111,'SAMET', 20, 'E', 3000, 'MİMAR',   'İSTANBUL');
INSERT INTO musteri VALUES(112,'ŞULE',  20, 'K', 4500, 'ÖĞRETMEN',  'İSTANBUL');
INSERT INTO musteri VALUES(113,'VELİ',  40, 'E', 2500, 'ÖĞRETMEN',  'İZMİR');
INSERT INTO musteri VALUES(114,'ZEYNEP', 50, 'K', 3500, 'TESİSATÇI', 'İZMİR');
INSERT INTO musteri VALUES(115,'ARDA',  55, 'E', 2000, 'KUAFÖR',   'İZMİR');
INSERT INTO musteri VALUES(116,'MELİS', 30, 'K', 3000, 'KUAFÖR',   'ANKARA');

-- 4.Adim --

	SELECT * FROM musteri;
	
-- 5.Adim --

	SELECT isim,meslek FROM musteri;
	
-- 6.Adim --

CREATE TABLE sehirler(

	alan_kodu int Primary Key,
	isim varchar(30) NOT NULL,
	nufus real
);


-- 7.Adim --

CREATE TABLE tedarikciler3 (
	tedarikci_id int Primary Key,
	tedarikci_ismi varchar(20),
	iletisim_ismi varchar(20) Unique
);


CREATE TABLE urunler (
	tedarikci_id int,
	urun_id int,
	CONSTRAINT id_pk Foreign Key(tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);

SELECT * FROM urunler;













