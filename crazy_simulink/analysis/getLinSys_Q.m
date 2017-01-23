function [Amat,Bmat] = getLinSys_Q(qw,qx,qy,qz,wx,wy,wz,T,m,Ixx,Iyy,Izz,Axx,Ayy,Azz)
%GETLINSYS_Q
%    [AMAT,BMAT] = GETLINSYS_Q(QW,QX,QY,QZ,WX,WY,WZ,T,M,IXX,IYY,IZZ,AXX,AYY,AZZ)

%    This function was generated by the Symbolic Math Toolbox version 7.0.
%    23-Jan-2017 16:40:29

t2 = 1.0./m;
t3 = T.*qx.*t2.*2.0;
t4 = T.*qw.*t2.*2.0;
t5 = T.*qz.*t2.*2.0;
t6 = T.*qy.*t2.*2.0;
t7 = wy.*(1.0./2.0);
t8 = wx.*(1.0./2.0);
t9 = qz.*(1.0./2.0);
t10 = qw.*(1.0./2.0);
t11 = wz.*(1.0./2.0);
t12 = qx.*(1.0./2.0);
t13 = 1.0./Ixx;
t14 = 1.0./Iyy;
t15 = Iyy.*wy;
t16 = 1.0./Izz;
t17 = Ixx.*wx;
Amat = reshape([0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,-Axx.*t2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,-Ayy.*t2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,-Azz.*t2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t6,-t3,t4,0.0,t8,t7,t11,0.0,0.0,0.0,0.0,0.0,0.0,t5,-t4,-t3,wx.*(-1.0./2.0),0.0,t11,-t7,0.0,0.0,0.0,0.0,0.0,0.0,t4,t5,-t6,wy.*(-1.0./2.0),wz.*(-1.0./2.0),0.0,t8,0.0,0.0,0.0,0.0,0.0,0.0,t3,t6,t5,wz.*(-1.0./2.0),t7,-t8,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,qx.*(-1.0./2.0),t10,-t9,qy.*(1.0./2.0),0.0,-t14.*(Ixx.*wz-Izz.*wz),-t16.*(t15-Ixx.*wy),0.0,0.0,0.0,0.0,0.0,0.0,qy.*(-1.0./2.0),t9,t10,-t12,t13.*(Iyy.*wz-Izz.*wz),0.0,t16.*(t17-Iyy.*wx),0.0,0.0,0.0,0.0,0.0,0.0,qz.*(-1.0./2.0),qy.*(-1.0./2.0),t12,t10,t13.*(t15-Izz.*wy),-t14.*(t17-Izz.*wx),0.0],[13,13]);
if nargout > 1
    Bmat = reshape([0.0,0.0,0.0,t2.*(qw.*qy.*2.0+qx.*qz.*2.0),-t2.*(qw.*qx.*2.0-qy.*qz.*2.0),t2.*(qw.^2-qx.^2-qy.^2+qz.^2),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t13,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t14,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t16],[13,4]);
end
