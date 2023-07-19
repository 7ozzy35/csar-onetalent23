*&---------------------------------------------------------------------*
*& Report zot_18_p_spor
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_18_p_spor.

TYPES: BEGIN OF gty_team,
         index     TYPE char2,
         team_name TYPE char30,
         country   TYPE char30,
         group_id  TYPE int1,
       END OF gty_team.

DATA: gt_team TYPE TABLE OF gty_team.
DATA: gs_team TYPE gty_team.

gt_team =
    VALUE #( BASE gt_team ( index = 1 team_name = 'Liverpool'       group_id = 1    country = 'EN')
                          ( index = 2 team_name = 'Bayern Münih'    group_id = 1    country = 'ALM')
                          ( index = 3 team_name = 'İnter'           group_id = 1    country = 'ITA')
                          ( index = 4 team_name = 'PSG'             group_id = 1    country = 'FRA' )

                          ( index = 5 team_name = 'Mnachester City'  group_id = 2   country = 'EN')
                          ( index = 6 team_name = 'PSV'              group_id = 2   country = 'HOL')
                          ( index = 7 team_name = 'Porto'            group_id = 2   country = 'POR')
                          ( index = 8 team_name = 'Real Madrid'      group_id = 2   country = 'ISP' )

                          ( index = 9  team_name = 'Dortmund'       group_id = 3    country = 'ALM')
                          ( index = 10 team_name = 'Galatasaray'    group_id = 3    country = 'TR')
                          ( index = 11 team_name = 'Marsilya'       group_id = 3    country = 'FRA')
                          ( index = 12 team_name = 'Ajax'           group_id = 3    country = 'HOL' )

                          ( index = 13 team_name = 'AEK'              group_id = 4   country = 'YUN')
                          ( index = 14 team_name = 'Roma'             group_id = 4   country = 'ITA')
                          ( index = 15 team_name = 'Steau Bükreş'     group_id = 4   country = 'ROM')
                          ( index = 16 team_name = 'Atletico Madrid'  group_id = 4   country = 'ISP' ) ).



"cl_demo_output=>write( gt_team ).
"cl_demo_output=>display(  ).
