REPORT Z_FIBONACCI.

PARAMETERS:
  p_max_no TYPE i LENGTH 5 OBLIGATORY, " 1'den 10000'e kadar olan sayıyı alır
  p_iterat TYPE i LENGTH 1 OBLIGATORY. " 1'den 9'a kadar olan kırılım sayısını alır

DATA:
  lt_fibonacci TYPE TABLE OF i,   " Fibonacci sayılarını saklamak için tablo
  lv_number    TYPE i,            " Kullanıcının girdiği maksimum sayı
  lv_iterations TYPE i,           " Kullanıcının girdiği kırılım sayısı
  lv_fibonacci TYPE i,            " Fibonacci sayısı hesaplamak için geçici değişken
  lv_prev1     TYPE i VALUE 1,    " Fibonacci hesaplaması için bir önceki değeri tutar
  lv_prev2     TYPE i VALUE 0.    " Fibonacci hesaplaması için iki önceki değeri tutar

START-OF-SELECTION.

  " Kullanıcının girdiği değerleri alıyoruz
  lv_number = p_max_no.
  lv_iterations = p_iterat.

  " Kısıtlamaları kontrol ediyoruz
  IF lv_number < 1 OR lv_number > 10000.
    MESSAGE 'Maksimum sayı 1 ila 10000 arasında olmalıdır.' TYPE 'E'.
    EXIT.
  ENDIF.

  IF lv_iterations < 1 OR lv_iterations > 9.
    MESSAGE 'Kırılım sayısı 1 ila 9 arasında olmalıdır.' TYPE 'E'.
    EXIT.
  ENDIF.

  " Fibonacci sayılarını hesaplayarak tabloya ekliyoruz
  DO lv_iterations TIMES.
    lv_fibonacci = lv_prev1 + lv_prev2.
    APPEND lv_fibonacci TO lt_fibonacci.
    lv_prev2 = lv_prev1.
    lv_prev1 = lv_fibonacci.
  ENDDO.

  " Tablodaki Fibonacci sayılarını ekrana yazdırıyoruz
  LOOP AT lt_fibonacci INTO lv_fibonacci.
    WRITE lv_fibonacci.
  ENDLOOP.
