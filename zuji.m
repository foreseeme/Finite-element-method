
    %单元刚度矩阵叠加成总体刚度矩阵%
%     K(2*MEE(i,1)-1:2*MEE(i,1),2*MEE(i,1)-1:2*MEE(i,1))=K(2*MEE(i,1)-1:2*MEE(i,1),2*MEE(i,1)-1:2*MEE(i,1))+Ke(1:2,1:2);
%     K(2*MEE(i,1)-1:2*MEE(i,1),2*MEE(i,2)-1:2*MEE(i,2))=K(2*MEE(i,1)-1:2*MEE(i,1),2*MEE(i,2)-1:2*MEE(i,2))+Ke(1:2,3:4);
%     K()=K()+Ke(1:2,5:6);
%     K()=K()+Ke(1:2,7:8);
%     K()=K()+Ke(1:2,1:2);
%     K()=K()+Ke(1:2,1:2);
    for p=1:4
        for q=1:4
           K(2*MEE(i,p)-1:2*MEE(i,p),2*MEE(i,q)-1:2*MEE(i,q))=K(2*MEE(i,p)-1:2*MEE(i,p),2*MEE(i,q)-1:2*MEE(i,q))+Ke(2*p-1:2*p,2*q-1:2*q); 
        end
    end
end











    