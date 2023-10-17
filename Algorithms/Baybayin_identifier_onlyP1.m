function [output1,WBB,A,output,Baybayin_counter,message1]=Baybayin_identifier_onlyP1(a)
% iniTime = clock;
% limit   = 180;  %transliteration limit time (in seconds)
tic; %ticBytes(gcp);
format compact
clf(); %close all;
%%%load LvsB_classifier_00125.mat LvsB_classifier_00125;
% load Baybayin_Character_Classifier_00379.mat Baybayin_Character_Classifier_00379;
%%[~,Tagalog_words , ~]=xlsread("Tagalog_words_74419+.csv"); % Installing the Tagalog Word 
                                                             %Database (Dictionary)      
                                                             
% filename='Tagalog_words_74419+.csv';
% fileID=fopen(filename);
% Tagalog_words= textscan(fileID,'%s'); Tagalog_words=Tagalog_words{1}; fclose(fileID);

%a='ex1.png';
%a='ex5.png';
%Start of preprocessing
A=imread(a);
% [~,v2]=c2bw_orig(A);        % rgb to binary image conversion
% size(v2);               % image size information
% v2=bwareaopen(v2,10);   % removing small or noise components

%=======Acquisition of Text Properties using the built-in ocr function=======%

% ================================================================= %
% Note:                                                             %
% The template is set this way for the reason that the ocr function %
% may still produce the text properties even if the languages used  %
% cannot be applied to the input characters. This is due to the     %
% novelty of Baybayin OCR and there are no available Baybayin       %
% OCR at the time of making this project                            %
% ------------------------------------------------------------------%

text1=ocr(A, 'Language','Tagalog','Language','Japanese','TextLayout','Block');

RW  = text1.Words;
if isempty(RW)
text1=ocr(A, 'Language','Tagalog','Language','Japanese','TextLayout','auto');
RW  = text1.Words;
if isempty(RW)
    error('Was not able to read the text. Sorry');
end
end 

%----------------------------------------------------------------------------%

%======================== Word Segmentation Process ========================%

output=zeros(1,length(RW)); %preallocating the number of words found
WBB = text1.WordBoundingBoxes;
[row, ~]=size(WBB);


Figg=figure('visible','off'); imshow(a); pause(0.1)

hold on        %first image output

pause(0.1)

Baybayin_counter=[];
    for j=1:row
        if output(j)==1
            rectangle('Position', WBB(j,:),'Edgecolor','b');    %Latin words are bounded by blue boxes
        else
            Baybayin_counter=cat(1,Baybayin_counter,j);
            rectangle('Position',WBB(j,:),'Edgecolor','r');     %Baybayin words are bounded by red boxes
        end
    end
%pause(0.0001);

%Figg1=getframe(Figg); output1=Figg1.cdata;
 ans1=size(A); rect=[85, 62.5, ans1(2), ans1(1)];
 Figg1=getframe(Figg,rect); output1=Figg1.cdata;


%------------------------------ Setting the output image/s ------------------------------%

%message=
message1=sprintf('Total Baybayin words detected: %d\n (bounded by red boxes) \n\n\n Proceeding to transliterations, please wait.',row); %first output caption
end
