!  CoreModule.f90 
!
!  FUNCTIONS:
!  CoreModule - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: CoreModule
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program CoreModule

    USE, INTRINSIC :: iso_c_binding
    USE sender_module
    
    IMPLICIT NONE
    
    !REAL :: a,b,c
    !
    !a=1.34
    !b=3.2
    !c=mean(a,b)
    !
    !print *,'Mean value computed by C is',c

    call dsend("hello from fortran")
    

    end program CoreModule

