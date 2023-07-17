*&---------------------------------------------------------------------*
*& Report zot_18_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_18_p_internal_tables.

TYPES: BEGIN OF lty_material,
         matnr TYPE matnr,
         maktx TYPE maktx,
         matkl TYPE matkl,
         menge TYPE menge_d,
         meins TYPE meins,
       END OF lty_material.

DATA: lt_material1 TYPE TABLE OF zot_00_t_materıa,
      lt_material TYPE SORTED TABLE OF zot_00_t_materıa WITH UNIQUE KEY matnr,
      lt_mater TYPE TABLE OF lty_material,
      ls_mater TYPE lty_material,
      lt_topmaterial TYPE TABLE OF zot_00_t_materıa.

SELECT * FROM zot_00_t_materıa INTO TABLE lt_material1.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MALZEME GRUBU C OLAN 5 TANE DEĞER EKLEME"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lt_mater = VALUE #( ( matnr = '11' maktx = 'şişe' matkl = 'C' menge = 10 meins = 'PC' )
                    ( matnr = '12' maktx = 'bardak' matkl = 'C' menge = 7 meins = 'PC' )
                    ( matnr = '13' maktx = 'tabak' matkl = 'C' menge = 8 meins = 'PC' )
                    ( matnr = '14' maktx = 'çatal' matkl = 'C' menge = 10 meins = 'PC' )
                    ( matnr = '15' maktx = 'kaşık' matkl = 'C' menge = 21 meins = 'PC' ) ).

APPEND LINES OF lt_mater TO lt_material1.

LOOP AT lt_material1 INTO ls_mater.
  WRITE: / ls_mater-maktx, ls_mater-matkl, ls_mater-matnr, ls_mater-meins, ls_mater-menge.
ENDLOOP.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"menge alanına 10 ekle"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
LOOP AT lt_material1 INTO ls_mater.
  IF ls_mater-meins IS NOT INITIAL.
    MODIFY lt_material1 FROM ls_mater TRANSPORTING menge WHERE meins = ls_mater-meins.
    ls_mater-menge = ls_mater-menge + 10.
    MODIFY lt_material1 FROM ls_mater TRANSPORTING menge.
  ENDIF.
ENDLOOP.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"toplamı itaba ekleme"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
APPEND LINES OF lt_material1 TO lt_topmaterial.
APPEND LINES OF lt_material TO lt_topmaterial.

LOOP AT lt_topmaterial INTO ls_mater.
  COLLECT ls_mater INTO lt_mater.
ENDLOOP.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*Mengesi 10'dan küçük değerleri birleştirilmiş tablodan siliyoruz.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
DELETE lt_material1 WHERE menge < 10.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*Menge alanı 10'dan fazla olanları küçükten büyüğe sortlama.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*SORT lt_topmaterial BY menge.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*Collect sonrası menge büyükten küçüğe sortlama.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
SORT lt_mater BY menge DESCENDING.

WRITE: / 'lt_topmaterial:'.
WRITE: / 'lt_mater:'.
