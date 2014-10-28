module sender_module
    use iso_c_binding, only: c_ptr, c_int, c_null_ptr, c_double, C_CHAR, C_NULL_CHAR
    implicit none

    logical, save :: debug = .false.
    type(c_ptr), save :: default_zmq_context = c_null_ptr

    interface
        !type(c_ptr) function dzmq_connect() bind(c,NAME="dzmq_connect")
        !    import :: c_ptr
        !end function dzmq_connect

        subroutine dzmq_hello(ptr, string) bind (c,NAME="dzmq_hello")
            import :: c_ptr, c_char
            type(c_ptr), intent(in), value :: ptr
            character(kind=c_char) :: string(*)
        endsubroutine

        !subroutine dzmq_close(ptr) bind(c,NAME="dzmq_close")
        !    import :: c_ptr
        !    type(c_ptr), intent(in), value :: ptr
        !end subroutine dzmq_close

        !
        !subroutine print_c(string) bind(C, name="print_C")
        !    use iso_c_binding, only: c_char
        !    character(kind=c_char) :: string(*)
        !end subroutine print_c

    end interface

contains

    subroutine dsend(s)
        CHARACTER (LEN=*),  intent(in) :: s

        call dzmq_hello(default_zmq_context, s)
        
    end subroutine dsend
end module sender_module