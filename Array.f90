module kubu_array

implicit none
private

public :: tensor

type :: tensor

    real, allocatable :: data(:)

contains

    procedure :: resize
    procedure :: fill
    procedure :: sum
    procedure :: mean
    procedure :: save
    procedure :: load

    final :: destroy

end type

interface tensor
    module procedure create_tensor
end interface

contains

function create_tensor(n,val) result(t)

    integer, intent(in) :: n
    real, intent(in), optional :: val

    type(tensor) :: t

    allocate(t%data(n))

    if (present(val)) then
        t%data = val
    else
        t%data = 0.0
    end if

end function

subroutine resize(self,n)

    class(tensor), intent(inout) :: self
    integer, intent(in) :: n

    real, allocatable :: tmp(:)

    allocate(tmp(n))
    tmp = 0.0

    if (allocated(self%data)) then

        tmp(1:min(n,size(self%data))) = &
            self%data(1:min(n,size(self%data)))

        call move_alloc(tmp,self%data)

    else
        call move_alloc(tmp,self%data)
    end if

end subroutine

subroutine fill(self,val)

    class(tensor), intent(inout) :: self
    real, intent(in) :: val

    self%data = val

end subroutine

real function sum(self)

    class(tensor), intent(in) :: self

    sum = builtin_sum(self%data)

end function

real function mean(self)

    class(tensor), intent(in) :: self

    mean = builtin_sum(self%data)/size(self%data)

end function

subroutine save(self,file)

    class(tensor), intent(in) :: self
    character(*), intent(in) :: file

    open(10,file=file,status='replace')
    write(10,*) size(self%data)
    write(10,*) self%data
    close(10)

end subroutine

subroutine load(self,file)

    class(tensor), intent(inout) :: self
    character(*), intent(in) :: file

    integer :: n

    open(10,file=file)

    read(10,*) n

    allocate(self%data(n))

    read(10,*) self%data

    close(10)

end subroutine

subroutine destroy(self)

    type(tensor) :: self

    if (allocated(self%data)) then
        deallocate(self%data)
    end if

end subroutine

real function builtin_sum(x)
    real, intent(in) :: x(:)
    builtin_sum = sum(x)
end function

end module
