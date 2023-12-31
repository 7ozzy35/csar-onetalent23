*&---------------------------------------------------------------------*
*& Include zot_18_p_report_top
*&---------------------------------------------------------------------*
TABLES: eban,
        ekko,
        ekpo.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_banfn FOR eban-banfn NO INTERVALS,
                  s_bnfpo FOR eban-bnfpo NO INTERVALS.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS: s_ebeln   FOR ekko-ebeln NO INTERVALS,
                  s_matkl   FOR ekpo-matkl NO INTERVALS.

SELECTION-SCREEN END OF BLOCK b1.

PARAMETERS: r_rad1 RADIOBUTTON GROUP g1,
            r_rad2 RADIOBUTTON GROUP g1.

DATA: go_custom TYPE REF TO cl_gui_custom_container,
      go_grid   TYPE REF TO cl_gui_alv_grid,
      gt_eban   TYPE TABLE OF eban,
      gs_eban   TYPE eban,
      gt_ekpo   TYPE TABLE OF ekpo,
      gs_ekpo   TYPE zot_08_s_ekpo,
      gt_fcat   TYPE lvc_t_fcat,
      gs_fcat   TYPE lvc_s_fcat,
      gs_layout TYPE lvc_s_layo,
      gv_title  TYPE char50,
      go_splitter TYPE REF TO cl_gui_splitter_container,
      go_sub1     TYPE REF TO cl_gui_container,
      go_sub2     TYPE REF TO cl_gui_container,
      go_document TYPE REF TO cl_dd_document.

CLASS: cl_event_receiver DEFINITION DEFERRED.

DATA: go_event_receiver TYPE REF TO cl_event_receiver.

FIELD-SYMBOLS: <gfs_eban> TYPE eban,
               <gfs_ekpo> TYPE ekpo.
