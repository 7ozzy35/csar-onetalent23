*&---------------------------------------------------------------------*
*& Report zot_18_p_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_18_p_zmn.


DATA: lt_table TYPE TABLE OF zot_18_t_zmn, " Tablonuzun veri tipine göre uygun olanı kullanın
      ls_row1 TYPE zot_18_t_zmn, " Tablonuzun veri tipine göre uygun olanı kullanın
      ls_row2 TYPE zot_18_t_zmn, " Tablonuzun veri tipine göre uygun olanı kullanın
      lv_diff TYPE i,
      lv_years TYPE i,
      lv_months TYPE i,
      lv_days TYPE i,
      lv_hours TYPE i,
      lv_minutes TYPE i,
      lv_seconds TYPE i.

PARAMETERS: p_index1 TYPE sy-tabix DEFAULT 0,
            p_index2 TYPE sy-tabix DEFAULT 0.

START-OF-SELECTION.
  " Tablodan verileri alın
  SELECT * FROM zot_18_t_zmn INTO TABLE lt_table.

  " İlk indeksi kontrol edin
  IF p_index1 < 1 OR p_index1 > lines( lt_table ).
    WRITE: 'Geçersiz indeks 1.'.
    EXIT.
  ENDIF.

  " İkinci indeksi kontrol edin
  IF p_index2 < 1 OR p_index2 > lines( lt_table ).
    WRITE: 'Geçersiz indeks 2.'.
    EXIT.
  ENDIF.

  " İlk indeksi alın
  READ TABLE lt_table INDEX p_index1 INTO ls_row1.

  " İkinci indeksi alın
  READ TABLE lt_table INDEX p_index2 INTO ls_row2.

  " Zaman farkını hesaplayın
  lv_diff = ls_row2-bittarih - ls_row1-bastarih.

  " Zaman farkını yıl, ay, gün, saat, dakika ve saniye olarak hesaplayın
  lv_years = lv_diff DIV 365.
  lv_diff = lv_diff MOD 365.

  lv_months = lv_diff DIV 30.
  lv_diff = lv_diff MOD 30.

  lv_days = lv_diff.

  lv_hours = ( ls_row2-bitsaat - ls_row1-bassaat ) DIV 3600.
  lv_minutes = ( ( ls_row2-bitsaat - ls_row1-bassaat ) MOD 3600 ) DIV 60.
  lv_seconds = ( ls_row2-bitsaat - ls_row1-bassaat ) MOD 60.

  " Zaman farkını yazdırın
  WRITE: 'Zaman farkı:' , lv_years, 'yıl', lv_months, 'ay', lv_days, 'gün',
         lv_hours, 'saat', lv_minutes, 'dakika', lv_seconds, 'saniye' ,'fark vardır'.
