% ======================================================================  %
%Note:                                                                    %
%This is a subfunction from the Proposed OCR Algorithm and intentionally  % 
%made to recognize the Baybayin character 'E/I'. Otherwise, the algorithm %
%is assigned to find if the other components are part of the main body    % 
%or simply its accent                                                     %  
% ----------------------------------------------------------------------- %

%Mdl= SVM Model for Baybayin characters (56x56) MAT Filname: Baybayin_Character_Classifier_00379
%input= 56x56 main body binarized image
%input2= original binarized image

function [print1, P, Posterior]=seg2(Mdl,input,input2)

%List of Binary classifiers which will be use for
%reclassification of confusive Baybayin characters
Confuselist={'AVSMa_00225.mat','KaVSEI_00100.mat','smile.mat',...
             'HaVSSa_00050.mat','LaVSTa_00100.mat','PaVSYa_00550.mat'};

%Loading Baybayin diacritic classifiers         
load Subscript_Classifier_00000.mat Subscript_Classifier_00000;
load Superscript_Classifier_00000.mat Superscript_Classifier_00000;

Mdl_accent1=Superscript_Classifier_00000;
Mdl_accent2=Subscript_Classifier_00000;

Letter1=feature_vector_extractor(input);




s=regionprops(input2,'basic');
ss=struct2cell(s);
S=cell2mat(ss(1,:));

%Classification of default Baybayin characters
if length(S)<=2
    [print1,P,Posterior]=Baybayin_letter_revised_segueway(Mdl,input);
    return;
end

%Location segmentation
L=find(S==max(S));
S1=S(S<max(S));
SS1=max(S1(S1<max(S1)));
LL=find(S==SS1);


B=ss(:,L);
BB=ss(:,LL);

b=B{2};
b=b(2);

bb=BB{2};
bb=bb(2);

A=B{3};
A(1)=A(1)-1; A(2)=A(2)-1; A(3)=A(3)+1; A(4)=A(4)+1;

AA=BB{3};
AA(1)=AA(1)-1; AA(2)=AA(2)-1; AA(3)=AA(3)+1; AA(4)=AA(4)+1;

%Separation of main body from the accent
input=feature_vector_extractor(input);

Accent1=imcrop(input2, AA);

Accent1( ~any(Accent1,2), : ) = [];  %rows
Accent1( :, ~any(Accent1,1) ) = [];  %columns
[row, col]=size(Accent1);

[r, c]=size(Accent1);
rr=c/r;

%If an accent is a bar, a padding will be produced for it to become a
%square image
if rr>=5
    if col>row
    add=abs(col-row);
    pad=round(add/2);
    pad1=zeros(pad,col);
    Accent1=cat(1,pad1,Accent1,pad1);
elseif row>col
    add=abs(row-col);
    pad=round(add/2);
    pad1=zeros(row,pad);
    Accent1=cat(2,pad1,Accent1,pad1);
    end
end

%Classification of Baybayin characters
[~,~,~,Posterior]=predict(Mdl,input);
[P, Label1]=max(Posterior);

%If the accent symbol is placed above the main character
if b>bb
    
    Accent1=imresize(Accent1, [56 56]);
    Accent1(:,1:2)=0;
    Accent1(:,55:56)=0;
    Accent1(1:2,:)=0;
    Accent1(55:56,:)=0;
    Accent1=bwareaopen(Accent1, 13);
    Accent2=feature_vector_extractor(Accent1);
    [label,~]=predict(Mdl_accent1,Accent2);
    
    if label==-1
    
    if Label1==1
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Me/Mi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Me/Mi.\n\n');
    end
    
elseif Label1==2
    print1=sprintf('It''s a Baybayin Script.\n Character Be/Bi.\n\n');
    
elseif Label1==3
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Ke/Ki.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ke/Ki.\n\n');
    end
    
elseif Label1==4
    print1=sprintf('It''s a Baybayin Script.\n Character De/Di.\n\n');
    
elseif Label1==5
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Ke/Ki.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ke/Ki.\n\n');
    end
    
elseif Label1==6
    print1=sprintf('It''s a Baybayin Script.\n Character Ge/Gi.\n\n');

elseif Label1==7
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character He/Hi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Se/Si.\n\n');
    end
    
elseif Label1==8
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Le/Li.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Te/Ti.\n\n');
    end
    
elseif Label1==9
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Me/Mi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Me/Mi.\n\n');
    end
    
elseif Label1==10
    print1=sprintf('It''s a Baybayin Script.\n Character Ne/Ni.\n\n');

elseif Label1==11
    print1=sprintf('It''s a Baybayin Script.\n Character Nge/Ngi.\n\n');
    
elseif Label1==12
    print1=sprintf('It''s a Baybayin Script.\n Character O/U.\n\n');

elseif Label1==13
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Pe/Pi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ye/Yi.\n\n');
    end
    
elseif Label1==14
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character He/Hi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Se/Si.\n\n');
    end
    
elseif Label1==15
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Le/Li.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Te/Ti.\n\n');
    end
    
elseif Label1==16
    print1=sprintf('It''s a Baybayin Script.\n Character We/Wi.\n\n');

elseif Label1==17
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Pe/Pi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ye/Yi.\n\n');
    
    end
    
    end
    
    else
        
    if Label1==1
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Me/Mi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Me/Mi.\n\n');
    end
    
elseif Label1==2
    print1=sprintf('It''s a Baybayin Script.\n Character Be/Bi.\n\n');
    
elseif Label1==3
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Ke/Ki.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ke/Ki.\n\n');
    end
    
elseif Label1==4
    print1=sprintf('It''s a Baybayin Script.\n Character De/Di.\n\n');
    
elseif Label1==5
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Ke/Ki.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ke/Ki.\n\n');
    end
    
elseif Label1==6
    print1=sprintf('It''s a Baybayin Script.\n Character Ge/Gi.\n\n');
    
elseif Label1==7
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character He/Hi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Se/Si.\n\n');
    end
    
elseif Label1==8
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Le/Li.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Te/Ti.\n\n');
    end
    
elseif Label1==9
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Me/Mi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Me/Mi.\n\n');
    end
    
elseif Label1==10
    print1=sprintf('It''s a Baybayin Script.\n Character Ne/Ni.\n\n');

elseif Label1==11
    print1=sprintf('It''s a Baybayin Script.\n Character Nge/Ngi.\n\n');
    
elseif Label1==12
    print1=sprintf('It''s a Baybayin Script.\n Character O/U.\n\n');

elseif Label1==13
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Pe/Pi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ye/Yi.\n\n');
    end
    
elseif Label1==14
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character He/Hi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Se/Si.\n\n');
    end
    
elseif Label1==15
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Le/Li.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Te/Ti.\n\n');
    end
    
elseif Label1==16
    print1=sprintf('It''s a Baybayin Script.\n Character We/Wi.\n\n');

elseif Label1==17
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Pe/Pi.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ye/Yi.\n\n');
    end
    
    end
    
    end
    
%If the accent is placed below the main character
else
    Accent1=imresize(Accent1, [56 56]);
    Accent1(:,1:2)=0;
    Accent1(:,55:56)=0;
    Accent1(1:2,:)=0;
    Accent1(55:56,:)=0;
    Accent2=feature_vector_extractor(Accent1);
    [label,~]=predict(Mdl_accent2,Accent2);
    
%If the identified accent is a bar or a dot symbol
    if label==-1
           if Label1==1
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Mo/Mu.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Mo/Mu.\n\n');
    end
    
elseif Label1==2
    print1=sprintf('It''s a Baybayin Script.\n Character Bo/Bu.\n\n');
    
elseif Label1==3
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Ko/Ku.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ko/Ku.\n\n');
    end
    
elseif Label1==4
    print1=sprintf('It''s a Baybayin Script.\n Character Do/Du.\n\n');
    
elseif Label1==5
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Ko/Ku.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Ko/Ku.\n\n');
    end
    
elseif Label1==6
    print1=sprintf('It''s a Baybayin Script.\n Character Go/Gu.\n\n');
    

elseif Label1==7
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Ho/Hu.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character So/Su.\n\n');
    end
    
elseif Label1==8
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Lo/Lu.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character To/Tu.\n\n');
    end
    
elseif Label1==9
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Mo/Mu.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Mo/Mu.\n\n');
    end
    
elseif Label1==10
    print1=sprintf('It''s a Baybayin Script.\n Character No/Nu.\n\n');

elseif Label1==11
    print1=sprintf('It''s a Baybayin Script.\n Character Ngo/Ngu.\n\n');
    
elseif Label1==12
    print1=sprintf('It''s a Baybayin Script.\n Character O/U.\n\n');

elseif Label1==13
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Po/Pu.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Yo/Yu.\n\n');
    end
    
elseif Label1==14
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Ho/Hu.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character So/Su.\n\n');
    end
    
elseif Label1==15
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Lo/Lu.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character To/Tu.\n\n');
    end
    
elseif Label1==16
    print1=sprintf('It''s a Baybayin Script.\n Character Wo/Wu.\n\n');

elseif Label1==17
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character Po/Pu.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Yo/Yu.\n\n');
    end
    
           end
        
%If the identified accent is a cross or an X symbol            
    elseif label==1
        
           if Label1==1
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character M.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character M.\n\n');
    end
    
elseif Label1==2
    print1=sprintf('It''s a Baybayin Script.\n Character B.\n\n');
    
elseif Label1==3
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character K.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character K.\n\n');
    end
    
elseif Label1==4
    print1=sprintf('It''s a Baybayin Script.\n Character D.\n\n');
    
elseif Label1==5
    Check01=load(Confuselist{2});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character K.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character K.\n\n');
    end
    
elseif Label1==6
    print1=sprintf('It''s a Baybayin Script.\n Character G.\n\n');
    
elseif Label1==7
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character H.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character S.\n\n');
    end
    
elseif Label1==8
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character L.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character T.\n\n');
    end
    
elseif Label1==9
    Check01=load(Confuselist{1});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character M.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character M.\n\n');
    end
    
elseif Label1==10
    print1=sprintf('It''s a Baybayin Script.\n Character N.\n\n');

elseif Label1==11
    print1=sprintf('It''s a Baybayin Script.\n Character Ng.\n\n');
    
elseif Label1==12
    print1=sprintf('It''s a Baybayin Script.\n Character O/U.\n\n');

elseif Label1==13
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character P.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Y.\n\n');
    end
    
elseif Label1==14
    Check01=load(Confuselist{4});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character H.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character S.\n\n');
    end
    
elseif Label1==15
    Check01=load(Confuselist{5});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character L.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character T.\n\n');
    end
    
elseif Label1==16
    print1=sprintf('It''s a Baybayin Script.\n Character W.\n\n');

elseif Label1==17
    Check01=load(Confuselist{6});
    Check02=struct2cell(Check01);
    Check03=Check02{1};
    [lab,~]=predict(Check03,Letter1);
    if lab==1
    print1=sprintf('It''s a Baybayin Script.\n Character P.\n\n');
    elseif lab==-1 
    print1=sprintf('It''s a Baybayin Script.\n Character Y.\n\n');
    end
    
           end
           
    end
        
end 

end





