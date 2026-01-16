CREATE OR REPLACE VIEW vw_satis_detay AS
SELECT
    s.siparis_id,
    s.siparis_tarihi,
    s.kargo_firmasi,
    s.durum,

    m.musteri_id,
    m.musteri_ad,
    m.musteri_soyad,
    m.sehir,
    m.ulke,
    m.kayit_tarihi,

    u.urun_id,
    u.urun_adi,
    k.kategori_adi,

    sd.miktar,
    sd.birim_fiyat,
    sd.indirim,

    (sd.miktar * sd.birim_fiyat) * (1 - sd.indirim) AS net_tutar,
	(sd.miktar * u.alis_fiyati) AS maliyet


FROM siparisler s
JOIN musteriler m ON s.musteri_id = m.musteri_id
JOIN siparis_detay sd ON s.siparis_id = sd.siparis_id
JOIN urunler u ON sd.urun_id = u.urun_id
JOIN kategoriler k ON u.kategori_id = k.kategori_id;
