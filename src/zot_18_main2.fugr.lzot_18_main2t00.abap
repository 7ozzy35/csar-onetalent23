*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_18_T_P_AILE.................................*
DATA:  BEGIN OF STATUS_ZOT_18_T_P_AILE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_18_T_P_AILE               .
CONTROLS: TCTRL_ZOT_18_T_P_AILE
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZOT_18_T_P_ATUR.................................*
DATA:  BEGIN OF STATUS_ZOT_18_T_P_ATUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_18_T_P_ATUR               .
*.........table declarations:.................................*
TABLES: *ZOT_18_T_P_AILE               .
TABLES: *ZOT_18_T_P_ATUR               .
TABLES: ZOT_18_T_P_AILE                .
TABLES: ZOT_18_T_P_ATUR                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
