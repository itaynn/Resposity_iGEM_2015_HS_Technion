function [ D ] = derive( M,C,V,U,A,B,N_max)
%DERIVATIVES Summary of this function goes here
%   Detailed explanation goes here

% Materials=[0, ... ahl
%     A_0, ... ahl out
%     0, ... l
%     0, ... la
%     0, ... la2
%     0, ...  aiia
%     tot_a, ... a1 
%     0,... a2  
%     0, ... RNA tet
%     0, ... TetR
%     tot_b, ... b1
%     0, ... b2
%     0, ... RNA ccdb
%     0,... ccdb
%     0, ... X
%     N_0, ... N+
%     0, ... N-
%     ];
% M(3)=M(2)*M(14);M(5)=M(4)*M(14);



% %%% version 1/4/15
% %1     {dA_{out}}{dt} V
% D(1)=-C(1)*M(2)*M(1) - C(2)*M(1)-(C(3)*M(4)*M(1)-C(4)*M(6));
% %2     {dLA_{out}}{dt}
% D(6)=C(3)*M(4) *M(1) - C(4)*M(6) -2*( C(5)*M(6)^2-C(6)*M(7));
% % 3    {dLA_{2,out}}{dt} V
% D(7)=C(5)*M(6)^2 - C(6)*M(7) -(C(7)*M(8)*M(7)-C(8)*M(9));
% %5     {da_1}{dt} V 
% D(9)=C(7)*M(8)*M(7)-C(8)*M(9);
% %4     {d(a_0+a_1)}{dt}=0 V
% D(8)=-D(9);
% %  6   {dTRLV_{out}}{dt} V
% D(10)=A*(M(8)*V(1)+M(9)*V(2))-C(9)*M(10)-(C(10)*M(11)*M(10)-C(11)*M(12));
% %8     {db_1}{dt} V
% D(12)=C(10)*M(11)*M(10) - C(11)*M(12);
% %7     {d(b_0 + b_1)}{dt} = 0 V
% D(11)=-D(12);
% %9     {d{ccdb_{out}}}{dt}= V
% D(13)=B * (M(11)*U(1) + M(12)*U(2)) - C(12)*M(13);
% %10    {dx_{out}}{dt} = c_{13} N(t)
% D(15)=C(13)*M(14);
% %11    {d{L_{in}}}{dt}=c_{14}-c_{15}*M(4)+{$\frac{c_4*M(6)}{N(t)}$}
% D(4)=C(14)-C(15)*M(4);
% %12 --   {L_{out} = N(t)*M(4) 
% D(5)=0;
% %13     {d{{aa}_{in}}}{dt} = C{16}-C{17}*M(2) V
% D(2)= C(16)-C(17)*M(2);
% %14  --   {aa_{out} = N(t)*M(2)
% D(3)=0;
% %15     {dN(t)}{dt}=N(t) (1-\frac{N(t)}{N_{max}})
% D(14)=M(14)*(1-M(14)/N_max);
%%% Version 17/9/15
D(1)=(-C(21)*(100000000*M(2)-(M(1)/((M(16))*C(22))))*(M(16)))...
    +(-(C(1)*M(6)*M(1))/(C(18)+(M(1)/M(16))))/M(16)...
    +(C(4)*M(4))...
    -(C(3)*M(3)*M(1))/M(16)...
    -(C(2)*M(1));
D(2)=(-C(21)*(M(2)-(M(1)/((M(16)+M(17))*C(22))))*(M(16)+M(17)))-C(19)*M(2);
D(3)=C(14)*M(16)*(M(7)+M(8))...
    -C(15)*M(3)...
    -(C(3)*M(3)*M(1))/M(16)...
    +C(4)*M(4);
D(4)=(C(3)*M(3)*M(1))/M(16)...
    +(-C(4)*M(4))...
    -2*(C(5)*M(4)*M(4))/M(16)...
    +2*(C(6)*M(5));
D(5)=C(5)*M(4)*M(4)/M(16)...
    -C(6)*M(5)...
    -(C(7)*M(7)*M(5))...
    +C(8)*M(8)*M(16);
D(6)=C(16)*M(16)*(M(7)+M(8))...
    -C(17)*M(6);
D(7)=-C(7)*M(7)*(M(5)/M(16))...
    +C(8)*M(8);
D(8)=C(7)*M(7)*M(5)/M(16)...
    -C(8)*M(8);
D(9)=V(1)*M(7)+V(2)*M(8);
D(10)=A*C(19)*M(9)*M(16)...
     -C(9)*M(10)...
     -C(10)*M(11)*M(10)...
     +C(11)*M(12)*M(16);
D(11)=-C(10)*M(11)*M(10)...
     +C(11)*M(12);
D(12)=C(10)*M(11)*M(10)...
     -C(11)*M(12);
D(13)=U(1)*M(11)+U(1)*M(12);
D(14)=B*C(20)*M(13)*M(16)...
     -C(16)*M(14);
D(15)=C(13)*M(16)*(M(8)+M(7));
D(16)=((log(2-C(25)))/C(23))*M(16)*(1-(M(16)+M(17))/N_max);
D(17)=((log(2))/C(24))*M(17)*(1-(M(16)+M(17))/N_max)...
     +((log(2)-log(2-C(25)))/C(23))*M(16);
% D(1)=(-C(21)*(M(2)-(M(1)))*C(22))...
%     +(-(C(1)*M(6)*M(1))/(C(18)+(M(1))))...
%     +(C(4)*M(4))...
%     -(C(3)*M(3)*M(1))...
%     -(C(2)*M(1));
% D(2)=(-C(21)*(M(2)-M(1))*C(22))*((M(16)+M(17))/(M(16)))-C(19)*M(2);
% D(3)=C(14)*(M(7)+M(8))...
%     -C(15)*M(3)...
%     -(C(3)*M(3)*M(1))...
%     +C(4)*M(4);
% D(4)=(C(3)*M(3)*M(1))...
%     +(-C(4)*M(4))...
%     -2*(C(5)*M(4)*M(4))...
%     +2*(C(6)*M(5));
% D(5)=C(5)*M(4)*M(4)...
%     -C(6)*M(5)...
%     -(C(7)*M(7)*M(5))...
%     +C(8)*M(8);
% D(6)=C(16)*(M(7)+M(8))...
%     -C(17)*M(6);
% D(7)=-C(7)*M(7)*(M(5))...
%     +C(8)*M(8);
% D(8)=C(7)*M(7)*M(5)...
%     -C(8)*M(8);
% D(9)=V(1)*M(7)+V(2)*M(8);
% D(10)=A*C(19)*M(9)...
%      -C(9)*M(10)...
%      -C(10)*M(11)*M(10)...
%      +C(11)*M(12);
% D(11)=-C(10)*M(11)*M(10)...
%      +C(11)*M(12);
% D(12)=C(10)*M(11)*M(10)...
%      -C(11)*M(12);
% D(13)=U(1)*M(11)+U(1)*M(12);
% D(14)=B*C(20)*M(13)...
%      -M(14);
% D(15)=C(13)*(M(8)+M(7));
% D(16)=((log(2-C(25)))/C(23))*M(16)*(1-(M(16)+M(17))/N_max);
% D(17)=((log(2))/C(24))*M(17)*(1-(M(16)+M(17))/N_max)...
%      +((log(2)-log(2-C(25)))/C(23))*M(16);
end

