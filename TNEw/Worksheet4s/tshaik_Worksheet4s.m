Homework 1) 
if a > 0 & b > 0
    fprintf('hello world/n')
end

if round(a)==a & round(b)==b
    fprintf('hello world/n') 
end

if a ~=0 & b ~=0 
    fprintf('hello world/n') 
end
if ~isempty(a) & ~isempty(b) 
    fprintf('hello world/n')
end 
2) if a > 0 | b > 0 
    fprintf('hello world/n') 
end
 
if round(a)==a | round(b)==b 
    fprintf('hello world/n') 
end
if a~=0 | b~=0 
    fprintf('hello world/n') 
end
    
if isempty(a) | ~isempty(b)
   fprintf('hello world/n') 
end
    3) if xor(a>0, b>0)
fprintf('hello world/n')
    end
    if xor(isempty(a),~isempty(b))
fprintf('hello world/n')
    end
 4. a | (b & c)
 

 % Short - circuiting 
 % translating if a < 0 && b > 0 % how would you translate this? 
	fprintf('hello world!\n') end 
% if a is negative you can move on to evalutating b and if 
% if b is positive print " hello world" 

5. % I don't think there is a short circuit 

2) 
6. % It would not be okay to write if isempty(dataPath) || nargin < 1, 
%dataPath = cd; end, because you cant evalaute if isempty( dataPath) before
%evaluating margin < 1 

7. % if a = 4 nothing would print becaue none of the cases
% have 4. If one of the cases was 4 then it would print whatever the
% greeting was equal to. For example if case 4 has greeting equal to bye,
% it woudld print, "Charlotte says bye" 
8. % With if/else you can only have one output and it will go in the 
% sequence of the script. With swith/case you can run various command
% depending the differen cases.
9. % practicing translating switch/cse to if/else statment
a. 
condWord = 'tapper'; 
if (condword, 'capper')|| strcmp(condword, 'gapper')
    max_events = 7;    
elseif (condWord, 'zapper')|| strcmp(condword, 'zapper')
    max_events = 6; 
elseif strcmp (condWord,'sea')|| strcmp(condWord,'C') || strcmp(condWord
    ,'Z') || strcump(condWord,'czar') ||strcump(condWord,'gar')|| strcmp
    (condWord.'cod')|| strcmp(condWord, 'god') 
        max_events = 5; 
else 
    max_events = NaN;
end 
fprintf('You may have at most %d events\n',max_events); 

b. name = sarah
switch name 
    case 'sarah' 
         almaMater = 'UC Berkeley';
    case 'robin'
        almaMater = Cornell University' 
end 
fprintf('%s earned her PhD at %s\n',name,almaMater);

c. Yes, because each else if can be a case and for the unknown you can 
have a new case for that when you translate into switch/case 