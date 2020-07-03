program main
use proc
implicit none
    integer :: argCount,argIndex
    character(len=4096) :: thisArg
    character(len=:), allocatable :: proc_name
    argCount = command_argument_count()
    if (argCount .eq. 0)then
        print *,'No process name passed.'
        call exit(1)
    end if
    do argIndex=1, argCount
        call get_command_argument(argIndex,thisArg)
        proc_name = trim(thisArg)
        call kill_proc(proc_name)
    end do
end program main