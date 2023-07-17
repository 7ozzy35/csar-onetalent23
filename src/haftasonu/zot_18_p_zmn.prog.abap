*&---------------------------------------------------------------------*
*& Report zot_18_p_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_18_p_zmn.

DATA:
  lt_table TYPE TABLE OF zot_18_t_zmn,
  ls_row   TYPE zot_18_t_zmn,
  lv_diff  TYPE i,
  lv_years TYPE i,
  lv_months TYPE i,
  lv_days TYPE i,
  lv_hours TYPE i,
  lv_minutes TYPE i,
  lv_seconds TYPE i.

PARAMETERS:
  p_index TYPE sy-tabix.

START-OF-SELECTION.
  " Tablodan verileri al
  SELECT * FROM zot_18_t_zmn INTO TABLE lt_table.

  " İndeksi kontrol et ve p_index parametresini tablodan çek
  IF p_index > lines( lt_table ) OR p_index < 1.
    WRITE: 'Geçersiz indeks.'.
    EXIT.
  ELSE.
    ls_row = lt_table[ p_index ].
  ENDIF.

  " Geri kalan kodu devam ettir...

  " İndeksi al
  READ TABLE lt_table INDEX p_index INTO ls_row.

  " Zaman farkını hesapla
  IF ls_row-bittarih >= ls_row-bastarih.
    lv_diff = ls_row-bittarih - ls_row-bastarih.
  ELSE.
    WRITE: 'Geçersiz zaman aralığı.'.
    EXIT.
  ENDIF.

  " Zaman farkını yıl, ay, gün, saat, dakika ve saniye olarak hesapla
  lv_years = lv_diff DIV 365.
  lv_diff = lv_diff MOD 365.

  lv_months = lv_diff DIV 30.
  lv_diff = lv_diff MOD 30.

  lv_days = lv_diff.

  lv_hours = lv_diff DIV 3600.
  lv_diff = lv_diff MOD 3600.

  lv_minutes = lv_diff DIV 60.
  lv_seconds = lv_diff MOD 60.

  " Zaman farkını yazdır
  WRITE: 'Zaman farkı:', lv_years, 'yıl', lv_months, 'ay', lv_days, 'gün',
         lv_hours, 'saat', lv_minutes, 'dakika', lv_seconds, 'saniye'.
