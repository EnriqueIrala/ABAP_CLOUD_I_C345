CLASS zcl_dictionary_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dictionary_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA: ls_structure TYPE zst_employee_log_c345.
*
*    ls_structure-adress-city = 'Mexico City'.
*
*    DATA: ls_structure2 TYPE zst_employeeii_log_c345.
*
*    ls_structure2-num = 24.
*
*    DATA: ls_deep_st TYPE zst_employee_deep_c345.
*
*    DATA(lt_adress) = VALUE ztt_address_c345( ( adressid = 1
*                                                street   = 'Street 1'
*                                                num      = 32
*                                                neighborhood = 'Neigborhood 1'
*                                                city     = 'City 1'
*                                                country  = 'Spain'
*                                                cp       = '12345' )
*                                              ( adressid = 2
*                                                street   = 'Street 2'
*                                                num      = 32
*                                                neighborhood = 'Neigborhood 2'
*                                                city     = 'City 2'
*                                                country  = 'Spain'
*                                                cp       = '12345' ) ).
*
*    ls_deep_st-adress = lt_adress.
*    ls_deep_st-employeeid = 1.
*    ls_deep_st-first_name = 'Enrique'.
*    ls_deep_st-last_name = 'Perez'.
*
*    out->write( ls_deep_st ).
*
*    data(lt_employee) = VALUE ztt_employee_deep_c345( ( employeeid = 1
*                                                      first_name = 'Enrique'
*                                                      last_name  = 'Perez'
*                                                      age     = '36'
*                                                      role  = '01'
*                                                      adress = lt_adress )
*                                                      ( employeeid = 2
*                                                      first_name = 'Enrique'
*                                                      last_name  = 'Perez'
*                                                      age     = '36'
*                                                      role  = '03'
*                                                      adress = lt_adress )  ).
*
*
*    out->write( lt_employee ).

    DATA: lt_employee TYPE STANDARD TABLE OF zemployee_c345.

    lt_employee = VALUE #( ( employeeid = 1
                             first_name = 'Enrique'
                             last_name  = 'Perez'
                             age        = '36'
                             role       = '01' )
                           ( employeeid = 2
                             first_name = 'Enrique'
                             last_name  = 'Perez'
                             age        = '36'
                             role       = '03' )  ).

    MODIFY zemployeeii_c345 FROM TABLE @lt_employee.

    IF sy-subrc = 0.

      SELECT * FROM zemployeeii_c345 INTO TABLE @DATA(lt_results).

      out->write( lt_results ).

    ENDIF.

















  ENDMETHOD.

ENDCLASS.
