CLASS zcl_10_hierarchy_c345 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_hierarchy_c345 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TRY.

        SELECT FROM HIERARCHY( SOURCE zcds_22_log_c346
                               CHILD TO PARENT ASSOCIATION _Manager
                               START WHERE Employee = '5'
                               SIBLINGS ORDER BY Employee ASCENDING )

         FIELDS Employee,
                Manager,
                Name

          INTO TABLE @DATA(lt_results).


      CATCH cx_sy_open_sql_db INTO DATA(lx_error).
        out->write( lx_error->get_text( ) ).
        RETURN.

    ENDTRY.

    CHECK lt_results IS NOT INITIAL.
    out->write( lt_results ).

  ENDMETHOD.

ENDCLASS.
