module proc
contains
    subroutine kill_proc(proc_name)
        implicit none
        character(len=:), allocatable :: proc_name
        call execute_command_line('taskkill /im '//proc_name//' /f')
    end subroutine kill_proc
end module proc