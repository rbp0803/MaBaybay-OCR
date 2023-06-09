%-----------------------------------------------------------------%
%Headless run to implement the Baybayin OCR System Package        %
%-----------------------------------------------------------------%

%% For Baybayin Block OCR

output=BaybayinOCR('16Example4.PNG','b');
%
%
%Other sample images
%output=BaybayinOCR('11Latin text.PNG','b');
%output=BaybayinOCR('12Latin text.PNG','b');
%output=BaybayinOCR('13Example1.PNG',3); 
%output=BaybayinOCR('14Example2.PNG',3); 
%output=BaybayinOCR('15Example3.PNG',3); 
%---------------------------------------------------------------------------%


%% For Baybayin Word OCR

%output=BaybayinOCR('6Baybayin Word - Pilipinas.PNG','w'); disp(output) %uncomment this line
%
%
%Other sample images
%output=BaybayinOCR('7Baybayin Word - Dito, Reto, Rito.PNG','w'); disp(output)
%output=BaybayinOCR('8Baybayin Word - Isang.PNG',2); disp(output)
%output=BaybayinOCR('9Baybayin Word - Daanan.PNG',2); disp(output)
%output=BaybayinOCR('10Baybayin Word - Pinagpala.PNG',2); disp(output)
%---------------------------------------------------------------------------%


%% For Baybayin Character OCR

%output=BaybayinOCR('1BaybayinCharac_A.PNG','c'); %uncomment this line
%
%
%Other sample images
%output=BaybayinOCR('2BaybayinCharac_KoKu.PNG','c');
%output=BaybayinOCR('3BaybayinCharac_GeGi.PNG',1); 
%output=BaybayinOCR('4LatinCharac_E.PNG',1); 
%output=BaybayinOCR('5LatinCharac_R.PNG',1); 
%-----------------------------------------------------------------%

