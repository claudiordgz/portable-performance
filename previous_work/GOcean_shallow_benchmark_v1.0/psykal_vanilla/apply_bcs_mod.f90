MODULE apply_bcs_mod
  USE kind_params_mod
  IMPLICIT none
  PRIVATE

  PUBLIC invoke_apply_bcs_uvtf
  PUBLIC invoke_apply_bcs_uvt
  PUBLIC invoke_apply_bcs_uv

CONTAINS

  !===================================================

  SUBROUTINE invoke_apply_bcs_uvtf(ufield, vfield, tfield, ffield)
    !> The dimensions of the model grid
    use topology_mod, only: M, N
    implicit none
    REAL(wp), INTENT(inout), DIMENSION(:,:) :: ufield, vfield, tfield, ffield

    !call invoke_apply_bcs_cu(ufield)
    ! Ultimately, this can be generated by PSyclone but in the
    ! absence of that we implement it manually here...
    ! First col = last col
    ufield(1,    1:N) = ufield(M+1,  1:N)
    ! Last row = first row
    ufield(1:M+1,N+1) = ufield(1:M+1,1)

    !call invoke_apply_bcs_ct(tfield)
    ! Last col = first col
    tfield(M+1,1:N) = tfield(1,  1:N)
    ! Last row = first row
    tfield(1:M+1,N+1) = tfield(1:M+1,1)

    !call invoke_apply_bcs_cv(vfield)
    vfield(1:M,1    ) = vfield(1:M,N+1)
    ! Last col = first col
    vfield(M+1,1:N+1) = vfield(1,  1:N+1)

    !call invoke_apply_bcs_cf(ffield)
    ! First col = last col
    ffield(1,    2:N+1) = ffield(M+1,  2:N+1)
    ! First row = last row
    ffield(1:M+1,1)     = ffield(1:M+1,N+1)

  END SUBROUTINE invoke_apply_bcs_uvtf

  !===================================================

  subroutine invoke_apply_bcs_uvt(ufield, vfield, tfield)
    !> The dimensions of the model grid
    use topology_mod, only: M, N
    implicit none
    real(wp), intent(inout), dimension(:,:) :: ufield, vfield, tfield

    !call invoke_apply_bcs_cu(ufield)
    ! Ultimately, this can be generated by PSyclone but in the
    ! absence of that we implement it manually here...
    ! First col = last col
    ufield(1,    1:N) = ufield(M+1,  1:N)
    ! Last row = first row
    ufield(1:M+1,N+1) = ufield(1:M+1,1)

    !call invoke_apply_bcs_cv(vfield)
    ! First row = last row
    vfield(1:M,1    ) = vfield(1:M,N+1)
    ! Last col = first col
    vfield(M+1,1:N+1) = vfield(1,  1:N+1)

    !call invoke_apply_bcs_ct(tfield)
    ! Last col = first col
    tfield(M+1,1:N) = tfield(1,  1:N)
    ! Last row = first row
    tfield(1:M+1,N+1) = tfield(1:M+1,1)

  end subroutine invoke_apply_bcs_uvt

  !===================================================

  subroutine invoke_apply_bcs_uv(ufield, vfield)
    !> The dimensions of the model grid
    use topology_mod, only: M, N
    implicit none
    real(wp), intent(inout), dimension(:,:) :: ufield, vfield

    !call invoke_apply_bcs_cu(ufield)
    ! Ultimately, this can be generated by PSyclone but in the
    ! absence of that we implement it manually here...
    ! First col = last col
    ufield(1,    1:N) = ufield(M+1,  1:N)
    ! Last row = first row
    ufield(1:M+1,N+1) = ufield(1:M+1,1)

    !call invoke_apply_bcs_cv(vfield)
    ! First row = last row
    vfield(1:M,1    ) = vfield(1:M,N+1)
    ! Last col = first col
    vfield(M+1,1:N+1) = vfield(1,  1:N+1)

  end subroutine invoke_apply_bcs_uv

  !===================================================

END MODULE apply_bcs_mod
