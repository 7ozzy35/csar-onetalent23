REPORT zot_18_p_spor.

TYPES: BEGIN OF gty_team,
         index     TYPE char2,
         team_name TYPE char30,
         country   TYPE char30,
         torba_id  TYPE int1,
       END OF gty_team.

DATA: gt_team TYPE TABLE OF gty_team.
DATA: gt_group1 TYPE TABLE OF gty_team,
      gt_group2 TYPE TABLE OF gty_team,
      gt_group3 TYPE TABLE OF gty_team,
      gt_group4 TYPE TABLE OF gty_team.

DATA: gs_team TYPE gty_team.

gt_team = VALUE #( ( index = '1'  team_name = 'Liverpool'       torba_id = ' 1'  country = 'EN' )
                   ( index = '2'  team_name = 'Bayern Münih'    torba_id = ' 1'  country = 'ALM' )
                   ( index = '3'  team_name = 'İnter'           torba_id = ' 1'  country = 'ITA' )
                   ( index = '4'  team_name = 'PSG'             torba_id = ' 1'  country = 'FRA' )
                   ( index = '5'  team_name = 'Manchester City' torba_id = ' 2'  country = 'EN' )
                   ( index = '6'  team_name = 'PSV'             torba_id = ' 2'  country = 'HOL' )
                   ( index = '7'  team_name = 'Porto'           torba_id = ' 2'  country = 'POR' )
                   ( index = '8'  team_name = 'Real Madrid'     torba_id = ' 2'  country = 'ISP' )
                   ( index = '9'  team_name = 'Dortmund'        torba_id = ' 3'  country = 'ALM' )
                   ( index = '10' team_name = 'Galatasaray'     torba_id = ' 3'  country = 'TR'  )
                   ( index = '11' team_name = 'Marseille'       torba_id = ' 3'  country = 'FRA' )
                   ( index = '12' team_name = 'Ajax'            torba_id = ' 3'  country = 'HOL' )
                   ( index = '13' team_name = 'AEK'             torba_id = ' 4'  country = 'YUN' )
                   ( index = '14' team_name = 'Roma'            torba_id = ' 4'  country = 'ITA' )
                   ( index = '15' team_name = 'Steau Bükreş'    torba_id = ' 4'  country = 'ROM' )
                   ( index = '16' team_name = 'Atletico Madrid' torba_id = ' 4'  country = 'ISP' ) ).

DATA: lv_exists TYPE abap_bool.

LOOP AT gt_team INTO gs_team.
  IF gs_team-torba_id = 1 AND lines( gt_group1 ) = 0.
    lv_exists = abap_false.
    LOOP AT gt_group1 INTO DATA(ls_group1) WHERE country = gs_team-country.
      lv_exists = abap_true.
      EXIT.
    ENDLOOP.
    IF lv_exists = abap_false.
      APPEND gs_team TO gt_group1.
    ENDIF.

  ELSEIF gs_team-torba_id = 2 AND lines( gt_group2 ) = 0.
    lv_exists = abap_false.
    LOOP AT gt_group2 INTO DATA(ls_group2) WHERE country = gs_team-country.
      lv_exists = abap_true.
      EXIT.
    ENDLOOP.
    IF lv_exists = abap_false.
      APPEND gs_team TO gt_group2.
    ENDIF.

  ELSEIF gs_team-torba_id = 3 AND lines( gt_group3 ) = 0.
    lv_exists = abap_false.
    LOOP AT gt_group3 INTO DATA(ls_group3) WHERE country = gs_team-country.
      lv_exists = abap_true.
      EXIT.
    ENDLOOP.
    IF lv_exists = abap_false.
      APPEND gs_team TO gt_group3.
    ENDIF.

  ELSEIF gs_team-torba_id = 4 AND lines( gt_group4 ) = 0.
    lv_exists = abap_false.
    LOOP AT gt_group4 INTO DATA(ls_group4) WHERE country = gs_team-country.
      lv_exists = abap_true.
      EXIT.
    ENDLOOP.
    IF lv_exists = abap_false.
      APPEND gs_team TO gt_group4.
    ENDIF.
  ENDIF.
ENDLOOP.


cl_demo_output=>write( 'Group 1' ).
cl_demo_output=>write( gt_group1 ).
cl_demo_output=>display( ).

cl_demo_output=>write( 'Group 2' ).
cl_demo_output=>write( gt_group2 ).
cl_demo_output=>display( ).

cl_demo_output=>write( 'Group 3' ).
cl_demo_output=>write( gt_group3 ).
cl_demo_output=>display( ).

cl_demo_output=>write( 'Group 4' ).
cl_demo_output=>write( gt_group4 ).
cl_demo_output=>display( ).
