function processoption(selection)
    implicit none !Prevents Fortran from treating variables starting with letters i, j, k, l, m or n as integers, but all other variables as real arguments.
    integer, intent(in)::selection
    integer::processoption, status
    real::x,y
    if(selection == -1) then !If the exit parameter was passed (-1), close the program.
        print *, 'Exiting - Press any key to close the program.'
        processoption = -1
        return
    elseif(selection < -1 .OR. selection > 4) then
        print *, 'Invalid selection. Please enter a valid choice or -1 to exit!'
        return
    endif
    do
        print *, 'Enter x:'
        read (*, *, iostat=status) x
        !Checks whether stdin value entered for x is a valid integer or not.
        if(status /= 0) then
            write(*, *) 'Invalid input. Please enter a valid number for x.' !Prints error message to stdout.
            continue
        else
            exit
        endif
    enddo
    do
        print *, 'Enter y:'
        read (*, *, iostat=status) y
        !Checks whether stdin value entered for y is a valid integer or not.
        if(status /= 0) then
            write(*, *) 'Invalid input. Please enter a valid number for y.' !Prints error message to stdout.
            continue
        else
            exit
        endif
    enddo
    if(selection == 0) then!'Add' was selected.
        print *, x+y
    elseif(selection == 1) then!'Subtract' was selected.
        print *, x-y
    elseif(selection == 2) then!'Multiply' was selected.
        print *, x*y
    elseif(selection == 3) then!'Divide' was selected.
        print *, x/y
    elseif(selection == 4) then!'Power' was selected.
        print *, x**y
    else !Something went wrong, return with error (1).
        processoption = -1
        return
    endif
    processoption = 0 !Default subroutine return value is success (0).
    return
end function

program simplecalc
    implicit none
    integer::selection, status, processoption !Declare selection, status and processoption as integers.
    do

        print *, 'Choose an option (-1 = EXIT, 0 = Add, 1 = Subtract, 2 = Multiply, 3 = Divide, 4 = Power):'
        read (*, *, iostat=status) selection
        !Checks iostat return value for I/O errors (in this case, verify whether a valid integer was entered or not).
        !iostat return values are:
        !end-of record (-2)
        !end-of-file (-1)
        !success (0)
        !runtime-error (iostat return value > 0, see
        !https://software.intel.com/en-us/node/678472#EAAA16FF-06DF-4E0E-9058-EA6F9EF8D059
        !for all error codes)
        if(status /= 0) then
            write(*, *) 'Invalid input. Please enter only integer values for making your selection.' !Prints the error message to stdout.
            continue
        else
            if(processoption(selection) == -1) then !Checks the return value of the function processoption, passing the integer selection as parameter.
                read * !Prevent program from closing prematurely by waiting on a user key.
            endif
        endif
    enddo
end program simplecalc