*&---------------------------------------------------------------------*
*& Report ZALV_GRID_YBC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZALV_GRID_YBC.

type-pools: slis. "para versiones anteriores a 7.40



tables: ztybc_clientes.

types: begin of ty_ztybc_clientes,
  sucursal type ztybc_clientes-sucursal,
  clavecliente type ztybc_clientes-clavecliente,
  nombre_cliente type ztybc_clientes-nombre_cliente,
  cuenta type ztybc_clientes-cuenta,
  moneda type ztybc_clientes-moneda,
end of ty_ztybc_clientes.

data: it_ztybc_clientes type STANDARD TABLE OF ty_ztybc_clientes,
      ls_ztybc_clientes type ty_ztybc_clientes.

data: lt_fieldcat type slis_t_fieldcat_alv,
      ls_fieldcat type slis_fieldcat_alv,
      v_repid like sy-repid.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-002.
SELECT-OPTIONS: so_sucur FOR ztybc_clientes-sucursal,
                so_clave FOR ztybc_clientes-clavecliente,
                so_nom FOR ztybc_clientes-nombre_cliente.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

**Field Catalog
CLEAR ls_fieldcat.
ls_fieldcat-col_pos = 1.
ls_fieldcat-fieldname = 'VBELN'.
ls_fieldcat-tabname = 'IT_VBAP'.
ls_fieldcat-seltext_m = 'SD NO.'.
ls_fieldcat-key = 'X'.
APPEND ls_fieldcat TO lt_fieldcat.

CLEAR ls_fieldcat.
ls_fieldcat-col_pos = 2.
ls_fieldcat-fieldname = 'POSNR'.
ls_fieldcat-tabname = 'IT_VBAP'.
ls_fieldcat-seltext_m = 'ITEM NO.'.
APPEND ls_fieldcat TO lt_fieldcat.

CLEAR ls_fieldcat.
ls_fieldcat-col_pos = 3.
ls_fieldcat-fieldname = 'MATNR'.
ls_fieldcat-tabname = 'IT_VBAP'.
ls_fieldcat-seltext_m = 'MATERIAL NO.'.
APPEND ls_fieldcat TO lt_fieldcat.

CLEAR ls_fieldcat.
ls_fieldcat-col_pos = 4.
ls_fieldcat-fieldname = 'MATKL'.
ls_fieldcat-tabname = 'IT_VBAP'.
ls_fieldcat-seltext_m = 'MATERIAL GROUP'.
APPEND ls_fieldcat TO lt_fieldcat.

CLEAR ls_fieldcat.
ls_fieldcat-col_pos = 5.
ls_fieldcat-fieldname = 'ARKTX'.
ls_fieldcat-tabname = 'IT_VBAP'.
ls_fieldcat-seltext_m = 'DESCRIPTION'.
APPEND ls_fieldcat TO lt_fieldcat.

CLEAR ls_fieldcat.
ls_fieldcat-col_pos = 6.
ls_fieldcat-fieldname = 'NETWR'.
ls_fieldcat-tabname = 'IT_VBAP'.
ls_fieldcat-seltext_m = 'AMOUNT'.
APPEND ls_fieldcat TO lt_fieldcat.

CLEAR ls_fieldcat.
ls_fieldcat-col_pos = 7.
ls_fieldcat-fieldname = 'WAERK'.
ls_fieldcat-tabname = 'IT_VBAP'.
ls_fieldcat-seltext_m = 'CURRENCY'.
APPEND ls_fieldcat TO lt_fieldcat.

CLEAR ls_fieldcat.
ls_fieldcat-col_pos = 8.
ls_fieldcat-fieldname = 'KLMENG'.
ls_fieldcat-tabname = 'IT_VBAP'.
ls_fieldcat-seltext_m = 'QUANTITY'.
APPEND ls_fieldcat TO lt_fieldcat.


"Displaying ALV Grid Report
v_repid = sy-repid. "Asignacion del nombre del programa para pasarlo al modulo de funciones


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
   I_CALLBACK_PROGRAM                = 'v_repid'
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT                         =
   IT_FIELDCAT                       = lt_fieldcat
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT                           =
*   IT_FILTER                         =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
*   I_SAVE                            = ' '
*   IS_VARIANT                        =
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT                          =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
*   O_PREVIOUS_SRAL_HANDLER           =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab                          = lt_fieldcat
 EXCEPTIONS
   PROGRAM_ERROR                     = 1
   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.


















*types: BEGIN OF ty_bseg,
*        bukrs_it type bseg-bukrs,
*        belnr_it type bseg-belnr,
*        gjahr_it type bseg-gjahr,
*        werks_it type bseg-werks,
*        wrbtr_it type bseg-wrbtr,
*       END OF ty_bseg.
*
*"Tabla con los datos:
*data: it_bseg type STANDARD TABLE OF ty_bseg,
*      it_bkpf TYPE STANDARD TABLE OF bkpf.
*
*"Tabla fieldcat (define campos de la tabla)
*DATA: it_fcat TYPE STANDARD TABLE OF slis_fieldcat_alv,
*      wa_fcat TYPE slis_fieldcat_alv.
*
*DATA: wa_layout TYPE slis_layout_alv,
*      vl_variant TYPE disvariant.
*
*REFRESH: it_fcat, it_bkpf, it_bseg.
*
*"Armar fieldcat (definir columnas del ALV)
*CLEAR: wa_fcat.
*wa_fcat-fieldname = 'BUKRS_IT'.
*wa_fcat-ref_tabname = 'BSEG'.
*wa_fcat-ref_fieldname = 'BUKRS'.
*wa_fcat-key = 'X'.
*APPEND wa_fcat TO it_fcat.
*
*CLEAR: wa_fcat.
*wa_fcat-fieldname = 'BELNR_IT'.
*wa_fcat-outputlen = 10.
*wa_fcat-seltext_s = 'Nº doc.'.
*wa_fcat-seltext_m = TEXT-002.
*wa_fcat-seltext_l = TEXT-002.
*wa_fcat-key = 'X'.
*wa_fcat-no_zero = 'X'.
*APPEND wa_fcat TO it_fcat.
*
*CLEAR: wa_fcat.
*wa_fcat-fieldname = 'GJAHR_IT'.
*wa_fcat-ref_tabname = 'BSEG'.
*wa_fcat-ref_fieldname = 'GJAHR'.
*APPEND wa_fcat TO it_fcat.
*
*CLEAR: wa_fcat.
*wa_fcat-fieldname = 'WERKS_IT'.
*wa_fcat-ref_tabname = 'BSEG'.
*wa_fcat-ref_fieldname = 'WERKS'.
*APPEND wa_fcat TO it_fcat.
*
*
*SELECT bukrs belnr gjahr werks wrbtr
*  FROM bseg
*  INTO TABLE it_bseg.
*
*SELECT * FROM bkpf
*  INTO TABLE it_bkpf.
*
**"Layout
**CLEAR wa_layout.
**wa_layout-colwidth_optimize = 'X'.
**wa_layout-zebra = 'X'.
**
**"Variante
**vl_variant-report = 'ZALV_GRID_YBC'.
*
*
*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
* EXPORTING
**   I_INTERFACE_CHECK                 = ' '
**   I_BYPASSING_BUFFER                = ' '
**   I_BUFFER_ACTIVE                   = ' '
**   I_CALLBACK_PROGRAM                = ' '
**   I_CALLBACK_PF_STATUS_SET          = ' '
**   I_CALLBACK_USER_COMMAND           = ' '
**   I_CALLBACK_TOP_OF_PAGE            = ' '
**   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
**   I_CALLBACK_HTML_END_OF_LIST       = ' '
**   I_STRUCTURE_NAME                  =
**   I_BACKGROUND_ID                   = ' '
**   I_GRID_TITLE                      =
**   I_GRID_SETTINGS                   =
**   IS_LAYOUT                         =
*   IT_FIELDCAT                       = it_fcat
**   IT_EXCLUDING                      =
**   IT_SPECIAL_GROUPS                 =
**   IT_SORT                           =
**   IT_FILTER                         =
**   IS_SEL_HIDE                       =
**   I_DEFAULT                         = 'X'
**   I_SAVE                            = ' '
**   IS_VARIANT                        =
**   IT_EVENTS                         =
**   IT_EVENT_EXIT                     =
**   IS_PRINT                          =
**   IS_REPREP_ID                      =
**   I_SCREEN_START_COLUMN             = 0
**   I_SCREEN_START_LINE               = 0
**   I_SCREEN_END_COLUMN               = 0
**   I_SCREEN_END_LINE                 = 0
**   I_HTML_HEIGHT_TOP                 = 0
**   I_HTML_HEIGHT_END                 = 0
**   IT_ALV_GRAPHICS                   =
**   IT_HYPERLINK                      =
**   IT_ADD_FIELDCAT                   =
**   IT_EXCEPT_QINFO                   =
**   IR_SALV_FULLSCREEN_ADAPTER        =
**   O_PREVIOUS_SRAL_HANDLER           =
** IMPORTING
**   E_EXIT_CAUSED_BY_CALLER           =
**   ES_EXIT_CAUSED_BY_USER            =
*  TABLES
*    t_outtab                          = it_bseg
** EXCEPTIONS
**   PROGRAM_ERROR                     = 1
**   OTHERS                            = 2
*          .
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.