# ProcKill - Fortran

&#39;***prockill.exe***&#39; is a command line utility to kill *Windows* processes by process name written in the programming language *Fortran*&#46;

## Index
1. [Usage](#usage)
2. [Motivation](#motivation)
3. [Code](#code)
4. [Files](#files)
5. [To Compile](#compile)
6. [License](#license)

## Usage <a href="usage"></a>

This is a wrapper program for the command:

```Cmd
taskkill /im <PROCESS_NAME>.exe /f
```

that accept multiple process names; E&#46;g&#46;

```Cmd
prockill notepad.exe cmd.exe
SUCCESS: The process "notepad.exe" with PID 12764 has been terminated.
SUCCESS: The process "cmd.exe" with PID 9900 has been terminated.
SUCCESS: The process "cmd.exe" with PID 4420 has been terminated.
```

replaces

```Cmd
taskkill /im notepad.exe /f
SUCCESS: The process "notepad.exe" with PID 12764 has been terminated.
```

```Cmd
taskkill /im cmd.exe /f
SUCCESS: The process "cmd.exe" with PID 9900 has been terminated.
SUCCESS: The process "cmd.exe" with PID 4420 has been terminated.
```

This can be used from the provided executable downloadable in the &#39;Files&#39; section or compiled from source.

## Motivation <a href="motivation"></a>

I&#39;m learning *Fortran* at the moment &#40;been putting it off for 20 years&#41; and this was just an idea off the top of my head&#46; I&#39;m loving this language&#46;

## Example Code &#40;Main&#41;

```Fortran
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
```

## Files <a href="files"></a>

- [Compiled Executable](./prockill.exe)
- [Source Files - for compiling](./prockill_src.7z)
- [Source Files - with compiled](./prockill_src_compile.7z)

## To Compile <a name="compile"></a>

Compile from source main **prockill.f95** and module **proc.f95** to **prockill.exe** executable&#46;

```Powershell
# compile files to .o and .mod files
$ gfortran -ffree-form -c .\prockill.f95 .\proc.f95
# compile and link main and module files to executable
$ gfortran .\prockill.o .\proc.o -o prockill
```

## [License](./LICENSE) <a name="License"></a>

>This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

>This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
