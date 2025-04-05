CLASS zcl_09_global_temp_tab_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_global_temp_tab_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

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
