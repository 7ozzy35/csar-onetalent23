*&---------------------------------------------------------------------*
*& Include zot_18_p_report_
*&---------------------------------------------------------------------*
TYPES : BEGIN OF ty_eban,
          banfn    TYPE eban-banfn,
          bnfpo    TYPE eban-bnfpo,
          bsart    TYPE eban-bsart,
          matnr    TYPE eban-matnr,
          menge    TYPE eban-menge,
          meins    TYPE eban-meins,
          color(4) TYPE c,
        END OF ty_eban.

DATA : gt_eban TYPE TABLE OF ty_eban.

TYPES : BEGIN OF ty_ekpo,
          ebeln    TYPE ekpo-ebeln,
          matkl    TYPE ekpo-matkl,
          matnr    TYPE ekpo-matnr,
          menge    TYPE ekpo-menge,
          meins    TYPE ekpo-meins,
          color(4) TYPE c,
        END OF ty_ekpo.

DATA : gt_ekpo TYPE TABLE OF ty_ekpo.

DATA : gv_banfn TYPE eban-banfn,
       gv_bnfpo TYPE eban-bnfpo,
       gv_ebeln TYPE ekpo-ebeln,
       gv_matkl TYPE ekpo-matkl,
       gv_flag  TYPE i.

DATA(ls_layout1) = VALUE slis_layout_alv(  info_fieldname = 'COLOR' ).

SELECTION-SCREEN BEGIN OF BLOCK blk1 WITH FRAME TITLE TEXT-000 NO INTERVALS.

  SELECT-OPTIONS : s_banfn FOR gv_banfn MODIF ID md1,
                   s_bnfpo FOR gv_bnfpo MODIF ID md1.

SELECTION-SCREEN END OF BLOCK blk1.


SELECTION-SCREEN BEGIN OF BLOCK blk2 WITH FRAME TITLE TEXT-001 NO INTERVALS.

  SELECT-OPTIONS : s_ebeln FOR gv_ebeln MODIF ID md2,
                   s_matkl FOR gv_matkl MODIF ID md2.

SELECTION-SCREEN END OF BLOCK blk2.


SELECTION-SCREEN BEGIN OF BLOCK blk3 WITH FRAME TITLE TEXT-002 NO INTERVALS.
  PARAMETERS : rb1 RADIOBUTTON GROUP grp1 USER-COMMAND fc1,
               rb2 RADIOBUTTON GROUP grp1.

SELECTION-SCREEN END OF BLOCK blk3.
