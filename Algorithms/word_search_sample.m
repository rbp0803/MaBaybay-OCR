%========================================================================%
%Note:                                                                   %
%This is a subfunction from the Baybayin Word Reader System              % 
%(Baybayin_word_reader.m) that determines the legitimacy of the generated%
%Latin word through searching its availability in the database or        %  
%dictionary.                                                             %
%------------------------------------------------------------------------%

%Tag_words = Tagalog word database or dictionary
%BB - the generated string (word)
function V5=word_search_sample(Tag_words,BB)


%B=strfind(Tag_words,BB);
%C=find(~cellfun(@isempty,B));
if isempty(BB)
    C=[];
else
C=find(contains(Tag_words,BB)); 
end
%C=find(BC);
%D=isempty(BC);

%alternative
%C=find(~cellfun('isempty',B));


D=isempty(C);

if D==1
    
    V5=[];
    return;
    
else
    
    V=strcmp(Tag_words(C(:)),BB);
    VV=find(V,1);
    V4=C(VV);
    if isempty(V4)
        V5=[];
        return;
    end
    
    V5=Tag_words{V4};
    
end

end
    