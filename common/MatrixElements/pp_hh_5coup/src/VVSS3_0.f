C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     (-P(1,2)*P(2,1)*(P(-1,3)*P(-1,3))+2*(P(-1,2)*P(-1,3))*P(2,1)*P(1,
C     3)+2*(P(-1,1)*P(-1,3))*P(1,2)*P(2,3)-2*(P(-1,1)*P(-1,2))*P(1,3)*P
C     (2,3))/(2*(P(-1,1)*P(-1,3))*(P(-1,2)*P(-1,3))/(P(-1,1)*P(-1,2))-(
C     P(-1,3)*P(-1,3))) -P(-1,1)*P(-1,2)*Metric(1,2)
C     
      SUBROUTINE VVSS3_0(V1, V2, S3, S4, COUP,VERTEX)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 V2(*)
      COMPLEX*16 TMP2
      COMPLEX*16 S3(*)
      COMPLEX*16 COUP,FFBOX2
      COMPLEX*16 TMP1
      REAL*8 P1(0:3)
      COMPLEX*16 TMP0
      REAL*8 P2(0:3)
      COMPLEX*16 TMP7
      REAL*8 P3(0:3)
      REAL*8 P3b(0:3)
      COMPLEX*16 TMP6
      COMPLEX*16 S4(*)
      COMPLEX*16 TMP5
      COMPLEX*16 TMP4
      COMPLEX*16 VERTEX
      COMPLEX*16 FCT1
      COMPLEX*16 FCT0
      COMPLEX*16 V1(*)
      COMPLEX*16 TMP3
      COMPLEX*16 TMP8
      include '../coupl.inc'
      P1(0) = DBLE(V1(1))
      P1(1) = DBLE(V1(2))
      P1(2) = DIMAG(V1(2))
      P1(3) = DIMAG(V1(1))
      P2(0) = DBLE(V2(1))
      P2(1) = DBLE(V2(2))
      P2(2) = DIMAG(V2(2))
      P2(3) = DIMAG(V2(1))

      P3(0) = DBLE(S3(1))
      P3(1) = DBLE(S3(2))
      P3(2) = DIMAG(S3(2))
      P3(3) = DIMAG(S3(1))
      P3b(0) = -DBLE(S3(1))
      P3b(1) = -DBLE(S3(2))
      P3b(2) = -DIMAG(S3(2))
      P3b(3) = -DIMAG(S3(1))
      TMP8 = (V2(3)*P3(0)-V2(4)*P3(1)-V2(5)*P3(2)-V2(6)*P3(3))
      TMP5 = (P2(0)*P3(0)-P2(1)*P3(1)-P2(2)*P3(2)-P2(3)*P3(3))
      TMP4 = (P1(0)*P3(0)-P1(1)*P3(1)-P1(2)*P3(2)-P1(3)*P3(3))
      TMP7 = (V1(3)*P3(0)-V1(4)*P3(1)-V1(5)*P3(2)-V1(6)*P3(3))
      TMP6 = (P3(0)*P3(0)-P3(1)*P3(1)-P3(2)*P3(2)-P3(3)*P3(3))
      TMP1 = (V1(3)*P2(0)-V1(4)*P2(1)-V1(5)*P2(2)-V1(6)*P2(3))
      TMP0 = (V2(3)*P1(0)-V2(4)*P1(1)-V2(5)*P1(2)-V2(6)*P1(3))
      TMP3 = (P1(0)*P2(0)-P1(1)*P2(1)-P1(2)*P2(2)-P1(3)*P2(3))
      TMP2 = (V2(3)*V1(3)-V2(4)*V1(4)-V2(5)*V1(5)-V2(6)*V1(6))
      FCT0 = 1D0/(TMP3)
      FCT1 = 1D0/((+2D0*(FCT0*TMP4*TMP5)-TMP6))
   
      call GGHHFFG(p1,p2,p3b,ffbox2)

      VERTEX = COUP*S3(3)*S4(3)*(+2D0*(FCT1*(TMP0*1D0/2D0*(-2D0 * CI
     $ *(TMP5*TMP7)+CI*(TMP1*TMP6))+TMP8*(-CI*(TMP1*TMP4)+CI*(TMP3
     $ *TMP7))))+CI*(TMP2*TMP3))*FFBOX2

      END

      subroutine GGHHFFG(p1,p2,p3,gbox)
c****************************************************************************
c From the paper: Plehn, Spira & Zerwas, hep-ph/9603205
c scalar integrals (INISCAL subroutine) are directly copied
c from the 'hpair' program, see: http://people.web.psi.ch/spira/hpair/
c****************************************************************************
      implicit none

c Momenta of particles in event
c      include '../genps.inc'
   
      REAL*8 P1(0:3),P2(0:3),p3(0:3)
      double precision ff,sumdot,s,r,u,t,mq,mq2,ss,tt,uu,m1,m2
      double precision rho1,rho2,tauQ,tt1,uu1,tt2,uu2,epm
      double complex c03,d04,cq2,ca5
      double complex c0ab,c0ac,c0ad,c0bc,c0bd,c0cd
      double complex d0abc,d0bac,d0acb
      double complex gbox
      double precision Q1S,Q2S,q1,q2
      external sumdot,c03,d04
      INCLUDE '../coupl.inc'
      
      s=(p1(0)+p2(0))**2-
     & (p1(1)+p2(1))**2-(p1(2)+p2(2))**2-(p1(3)+p2(3))**2
      t=(p1(0)-p3(0))**2-
     & (p1(1)-p3(1))**2-(p1(2)-p3(2))**2-(p1(3)-p3(3))**2
      u=(p2(0)-p3(0))**2-
     & (p2(1)-p3(1))**2-(p2(2)-p3(2))**2-(p2(3)-p3(3))**2
      Q1s=p3(0)**2-p3(1)**2-p3(2)**2-p3(3)**2
      Q2s=(p1(0)+p2(0)-p3(0))**2-(p1(1)+p2(1)-p3(1))**2-(p1(2)+p2(2)
     & -p3(2))**2-(p1(3)+p2(3)-p3(3))**2     
      Q1=dsqrt(q1S)
      Q2=dsqrt(q2S)
      mQ2=MDL_MT**2
      ss=s/mQ2
      tt=t/mQ2
      uu=u/mQ2
      rho1=Q1S/mQ2
      rho2=Q2S/mQ2
      tauQ=4d0/ss
      tt1=tt-rho1
      uu1=uu-rho1
      tt2=tt-rho2
      uu2=uu-rho2
      
      call INISCAL(MDL_MT,S,T,U,Q1,Q2,
     &     C0AB,C0AC,C0AD,C0BC,C0BD,C0CD,D0ABC,D0BAC,D0ACB)

      C0AB = C0AB/MQ2
      C0AC = C0AC/MQ2
      C0AD = C0AD/MQ2
      C0BC = C0BC/MQ2
      C0BD = C0BD/MQ2
      C0CD = C0CD/MQ2

      D0ABC = D0ABC/MQ2**2
      D0BAC = D0BAC/MQ2**2
      D0ACB = D0ACB/MQ2**2


      Gbox= 1/(ss*(tt*uu-rho1*rho2))*(
     &     (tt**2+rho1*rho2-8*tt)*mq2*
     &     (ss*c0ab+tt1*c0ac+tt2*c0bd-ss*tt*mq2*d0bac)
     &     +(uu**2+rho1*rho2-8*uu)*mq2*
     &     (ss*c0ab+uu1*c0bc+uu2*c0ad-ss*uu*mq2*d0abc)
     &     -(tt**2+uu**2-2*rho1*rho2)*(tt+uu-8)*mq2*c0cd
     &     -2*(tt+uu-8)*(tt*uu-rho1*rho2)*mq2**2*(d0abc+d0bac+d0acb))

      return
      end

