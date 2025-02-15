!--------------------------------------------------------------------------------------------------!
!   CP2K: A general program to perform molecular dynamics simulations                              !
!   Copyright 2000-2022 CP2K developers group <https://cp2k.org>                                   !
!                                                                                                  !
!   SPDX-License-Identifier: GPL-2.0-or-later                                                      !
!--------------------------------------------------------------------------------------------------!

! **************************************************************************************************
!> \brief Type to store data about a (1D or 3D) FFT, including FFTW plan
!> \par History
!>      IAB 09-Jan-2009 : initial version
!>                        (c) The Numerical Algorithms Group (NAG) Ltd, 2009 on behalf of the HECToR project
!>      IAB 09-Oct-2009 : Added additional fields needed when using OpenMP
!>                        (c) The Numerical Algorithms Group (NAG) Ltd, 2009 on behalf of the HECToR project
!> \author JGH
! **************************************************************************************************

MODULE fft_plan
   USE ISO_C_BINDING,                   ONLY: C_PTR

   IMPLICIT NONE
   PRIVATE

   PUBLIC :: fft_plan_type

   TYPE fft_plan_type

      INTEGER                             :: fft_type
      INTEGER                             :: fsign
      LOGICAL                             :: trans, fft_in_place, valid, separated_plans
      INTEGER                             :: n, m
      INTEGER, DIMENSION(3)               :: n_3d

!   Handle for the FFTW plan
      TYPE(C_PTR)                         :: fftw_plan

!   Plan for the remaining rows for 1D FFT when number of threads does not divide the number of rows exactly
!$    TYPE(C_PTR)                         :: alt_fftw_plan
!$    LOGICAL                             :: need_alt_plan
!$    INTEGER                             :: num_threads_needed, num_rows, alt_num_rows

!   Individual plans (used by hand-optimised 3D FFT)
      TYPE(C_PTR)                     :: fftw_plan_nx, fftw_plan_ny, fftw_plan_nz
!   Plans for the remaining rows (when the number of threads does not divide the number of rows exactly)
      TYPE(C_PTR)                     :: fftw_plan_nx_r, fftw_plan_ny_r, fftw_plan_nz_r

   END TYPE fft_plan_type

END MODULE fft_plan
