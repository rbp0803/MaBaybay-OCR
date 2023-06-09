% ---------------------------------------------------------------------------------------%
% Baybayin OCR Package - OCR Type Selection                                              %                           
% by Rodney Pino, Renier Mendoza, and Rachelle Sambayan                                  %
% Programmed by Rodney Pino at University of the Philippines - Diliman                   %
% Programming dates: June 2023                                                           % 
% ---------------------------------------------------------------------------------------%

%a=input text image
%OCRtype = select among three OCR type options. 
%Let OCRtype = 'c'  or OCRtype = 1 for Baybayin character OCR, OCRtype ='w' or OCRtype = 2 for Baybayin word OCR, and OCRtype = 'b' or OCRtype = 3 for Baybayin block OCR.')
function output1=BaybayinOCR(a,OCRtype)

if (OCRtype=='c')|| (OCRtype==1) % Baybayin Character Reader
 load Baybayin_Character_Classifier_00379.mat Baybayin_Character_Classifier_00379;
 load Latin_Character_Classifier_00330.mat Latin_Character_Classifier_00330;    
 
 output1=Proposed_Baybayin_OCR(Baybayin_Character_Classifier_00379, Latin_Character_Classifier_00330, a);
 
elseif OCRtype=='w' || (OCRtype==2) %Baybayin Word Reader
    
 load Baybayin_Character_Classifier_00379.mat Baybayin_Character_Classifier_00379;
 output1=Baybayin_word_reader0(Baybayin_Character_Classifier_00379, a);
 
elseif OCRtype=='b' || (OCRtype==3) %Baybayin Block Text Image Reader

 output1=Baybayin_identifier(a);
 
else
    
 error('Oops. Please input the correct OCR type you would like to use. Type ''c''  or 1 for Baybayin character OCR, ''w'' or 2 for Baybayin word OCR, and ''b'' or 3 for Baybayin block OCR.');
    
end