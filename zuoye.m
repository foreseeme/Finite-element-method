clear
l=zeros(4);
l(1)=50*sqrt(5);%cm
l(2)=50*sqrt(2);
l(3)=50;l(4)=50;
E=2*10^7;A=5;J=25;
P=10000;%N
keba1=E*A/l(1)*[1 -1;-1 1];
keba2=E*A/l(2)*[1 -1;-1 1];
lamda1=[2*sqrt(5)/5 -sqrt(5)/5 0 0;0 0 2*sqrt(5)/5 -sqrt(5)/5];
lamda2=[-sqrt(2)/2 -sqrt(2)/2 0 0;0 0 -sqrt(2)/2 -sqrt(2)/2];
ke1=lamda1'*keba1*lamda1;
ke2=lamda2'*keba2*lamda2;
k11=E*A/l(3);k22=12*E*J/(l(3))^3;k32=6*E*J/(l(3))^2;k33=4*E*J/l(3);
keba3=zeros(6,6);
keba3(1,1)=k11;keba3(2,2)=k22;keba3(3,2)=k32;keba3(2,3)=k32;keba3(3,3)=k33;
keba3(4,1)=-k11;keba3(1,4)=-k11;keba3(4,4)=k11;keba3(5,2)=-k22;keba3(2,5)=-k22;
keba3(5,3)=-k32;keba3(3,5)=-k32;keba3(5,5)=k22;keba3(6,2)=k32;keba3(2,6)=k32;
keba3(6,3)=k33/2;keba3(3,6)=k33/2;keba3(6,5)=-k32;keba3(5,6)=-k32;keba3(6,6)=k33;
keba4=keba3;
lamda=[-1 0 0 -1];
lamda3=zeros(6,6);
lamda3(1,1)=lamda(1);lamda3(1,2)=lamda(2);lamda3(2,1)=lamda(3);lamda3(2,2)=lamda(4);
lamda3(4,4)=lamda(1);lamda3(4,5)=lamda(2);lamda3(5,4)=lamda(3);lamda3(5,5)=lamda(4);
lamda3(3,3)=1;lamda3(6,6)=1;
lamda4=lamda3;
ke3=lamda3'*keba3*lamda3;
ke4=lamda4'*keba4*lamda4;
K=zeros(13,13);
for i=1:4
   for j=1:4
      K(i,j)=ke1(i,j)+K(i,j);      
   end
end
for i=3:8
   for j=3:8
      K(i,j)=ke3(i-2,j-2)+K(i,j);      
   end
end
for i=6:7
   for j=6:7
      K(i,j)=ke2(i-5,j-5)+K(i,j);      
   end
end
for i=9:10
   for j=9:10
      K(i,j)=ke2(i-6,j-6)+K(i,j);      
   end
end
for i=6:8
   for j=6:8
      K(i,j)=ke4(i-5,j-5)+K(i,j);      
   end
end
for i=11:13
   for j=11:13
      K(i,j)=ke4(i-7,j-7)+K(i,j);      
   end
end

%置大数法
for i=1:2
   K(i,i)=10^30;   
end
for i=9:13
   K(i,i)=10^30;   
end
P=[0 0 0 -P 0 0 0 0 0 0 0 0 0];
u=K\P';%各节点位移
%下求内力
u1=[0;0;u(3);u(4)];
u2=[u(6);u(7);0;0];
u3=[u(3);u(4);u(5);u(6);u(7);u(8)];
u4=[u(6);u(7);u(8);u(11);u(12);u(13)];
Se1=keba1*lamda1*u1;
Se2=keba2*lamda2*u2;
Se3=keba3*lamda3*u3;
Se4=keba4*lamda4*u4;
N1=Se1(2,1)%拉正压负
N2=Se2(2,1)
N3=Se3(4,1)
Q3=Se3(5,1)
N4=Se3(4,1)
Q4=Se4(5,1)
%弯矩
syms x
M3=Se3(2,1)*x-Se3(3,1)
M4=Se4(2,1)*x-Se4(3,1)






