CREATE TABLE musteriler (
    musteri_id SERIAL PRIMARY KEY,
    musteri_ad VARCHAR(100) NOT NULL,
    musteri_soyad VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    sehir VARCHAR(100),
    ulke VARCHAR(100),
    kayit_tarihi DATE NOT NULL
);

CREATE TABLE kategoriler (
    kategori_id SERIAL PRIMARY KEY,
    kategori_adi VARCHAR(100) NOT NULL
);

CREATE TABLE urunler (
    urun_id SERIAL PRIMARY KEY,
    kategori_id INT NOT NULL,
    urun_adi VARCHAR(100) NOT NULL,
    alis_fiyati DECIMAL(10,2) NOT NULL,
    satis_fiyati DECIMAL(10,2) NOT NULL,
    stok INT NOT NULL,
    CONSTRAINT fk_urun_kategori
        FOREIGN KEY (kategori_id) REFERENCES kategoriler(kategori_id)
);

CREATE TABLE siparisler (
    siparis_id SERIAL PRIMARY KEY,
    musteri_id INT NOT NULL,
    siparis_tarihi DATE NOT NULL,
    kargo_firmasi VARCHAR(100) NOT NULL,
    durum VARCHAR(50),
    CONSTRAINT fk_siparis_musteri
        FOREIGN KEY (musteri_id) REFERENCES musteriler(musteri_id)
);

CREATE TABLE siparis_detay (
    detay_id SERIAL PRIMARY KEY,
    siparis_id INT NOT NULL,
    urun_id INT NOT NULL,
    miktar INT NOT NULL,
    birim_fiyat DECIMAL(10,2) NOT NULL,
    indirim DECIMAL(10,2) DEFAULT 0,
    CONSTRAINT fk_siparis_detay_siparis
        FOREIGN KEY (siparis_id) REFERENCES siparisler(siparis_id),
    CONSTRAINT fk_siparis_detay_urun
        FOREIGN KEY (urun_id) REFERENCES urunler(urun_id)
);
