*&---------------------------------------------------------------------*
*& Include zot_18_report_sel
*&---------------------------------------------------------------------*

tables: ekko,ekpo,likp.

SELECTION-SCREEN BEGIN OF BLOCK b1 with frame TITLE text-001.
    select-OPTIONS: s_matnr for ekpo-matnr,
                    s_matkl for ekpo-matkl.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 with frame TITLE text-001.
    PARAMETERS: p_alv type char1 RADIOBUTTON GROUP gr1,
                p_salv type char1 RADIOBUTTON GROUP gr1,
                p_grid type char1 RADIOBUTTON GROUP gr1.
SELECTION-SCREEN END OF BLOCK b2.
