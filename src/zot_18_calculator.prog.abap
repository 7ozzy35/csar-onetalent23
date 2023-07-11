*&---------------------------------------------------------------------*
*& Report zot_18_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_18_calculator.

DATA: gv_res TYPE p decimals 3.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_num1 TYPE i,
              p_num2 TYPE i.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN SKIP 1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS : pr_topla RADIOBUTTON GROUP grp1,
               pr_cikar RADIOBUTTON GROUP grp1,
               pr_carp  RADIOBUTTON GROUP grp1,
               pr_bolme RADIOBUTTON GROUP grp1.

SELECTION-SCREEN END OF BLOCK b2.
  START-OF-SELECTION.


  CLEAR gv_res.
  IF pr_topla = 'X'.
    gv_res = p_num1 + p_num2 .
    WRITE: 'toplama sonucu',gv_res.
    CLEAR gv_res.

  ELSEIF pr_cikar = 'X'.
    gv_res = p_num1 - p_num2 .
    WRITE: 'cikarma sonucu',gv_res.
    CLEAR gv_res.

  ELSEIF pr_carp = 'X'.
    gv_res = p_num1 * p_num2 .
    WRITE: 'carpma sonucu',gv_res.
    CLEAR gv_res.

  ELSEIF pr_bolme = 'X'.
    IF p_num2 EQ 0  or p_num1 EQ 0 . .
      MESSAGE 'lutfen 0 harici sayi giriniz' TYPE 'I'.

    ELSE.
      gv_res = p_num1 / p_num2 .
      MESSAGE |'bolme sonucu'{ gv_res } | TYPE 'I'.
    ENDIF.
 ENDIF.
