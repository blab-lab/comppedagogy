%% Homework 4s answer key 

%% Logical operators: &, |, xor(a,b) 

% 1. & (logical and): When running an if statement, you might want more than one condition to hold.

a = 2; 
b = -1; 

% - print out 'hello world' if...
% --- both a and b are positive
% <---
if a > 0 && b > 0 
    fprintf('hello world\n')
end
% --- both a and b are integers
if round(a) == a && round(b) == b
    fprintf('hello world\n')
end
% --- both a and b are nonzero
if a ~= 0 && b ~= 0
    fprintf('hello world\n')
end
% --- neither a nor b are empty 
if ~isempty(a) && ~isempty(b)
    fprintf('hello world\n')
end
% --->


% 2. | (logical or): You may also want to act if any of a set of conditions is true. The operator | is an
% inclusive or: at least one condition has to be true. 

% - print out 'hello world' if...
% --- either a or b is positive
% <---
if a > 0 || b > 0
    fprintf('hello world\n')
end
% --- either a or b is an integer
if round(a) == a || round(b) == b
    fprintf('hello world\n')
end
% --- either a or b is nonzero
if a ~= 0 || b ~= 0
    fprintf('hello world\n')
end
% --- either a is empty or b is not empty
if isempty(a) || ~isempty(b)
    fprintf('hello world\n')
end
% --->

% 3. xor(x, y) (exclusive or): Exclusive or just means that ONLY one thing can be true, not both. For example,
% you might offer a child an exclusive or choice: you can have either a lollipop or an ice cream, but not 
% both. Or when choosing an included side with a meal: would you like the baked potato, or the salad? 

xor(a>0,b>0)

% - print out 'hello world' if...
% --- either a or b is positive, but not both
% <---
if xor(a>0, b>0)
    fprintf('hello world\n')
end
% --- either a is empty or b is not empty (but not both conditions) 
if xor(isempty(a), ~isempty(b))
    fprintf('hello world\n')
end
% --->
% ------ how would you assign a and b such that you would actually print something out? How about another way
% to not print anything out (other than a = 2 and b = -1)? 

% 4. You can also combine things. Easy example: 

a = 1; 
b = 1; 
c = 0; 

% What will the results be? 
% <---
a & b & c % false
a & b | c % true
a | b & c % true 
% --->

% Which expression is the third expression (above) equivalent to?
% <---
(a | b) & c 
a | (b & c) % *** this one
% --->

%% Short-circuiting 

% 1. You may see in some of our SMNG scripts doubled operators: && and ||. This means that you are
% "short-circuiting". Short-circuiting means that the first part of the statement will be evaluated, and if
% the outcome is already determined, then Matlab does not bother looking at the second (third, fourth, etc.)

a = 15; 
b = 5; 

% <---
if a < 0 && b > 0 % how would you translate this? 
    % if a is negative, then check if b is positive, and if b is positive, 
	fprintf('hello world!\n') % then print hello world!
end 
% --->

% a is NOT negative, so you don't even have to know if b is positive or not to figure out that your "and" 
% statement will be false. Thus, Matlab would never evaluate the b > 0 portion. Similarly:

if a > 0 || b < 0 
	fprintf('hello world!\n')
end

% a is positive, so it doesn't matter if b is positive or negative; at least one of the conditions is true. 

% Food for thought: is there a short-circuit version of xor? 
% <---
% *** No, because you will always have to evaluate both conditions (only one of two can be true, so if the
% first one is true you still have to make sure the second isn't; if the first is not true you still have to
% make sure the second is) 
% --->

% 2. One of the reasons we use short-circuiting is because it is more efficient---in some cases, the computer
% has to do less. However, we also use these forced operators in cases where evaluating the second (or third, 
% or fourth, etc.) part of the statement would result in an error. For example, when you call audioGUI, you 
% are typically calling it without any arguments. But sometimes you DO include arguments (like if you're doing
% signalIn vs. signalOut---you have to tell Matlab which one you want to do). Let's take a look at this code: 

open audioGUI 

% function [] = audioGUI(dataPath,trialnums,buffertype,figpos,bSaveCheck)
% if nargin < 1 || isempty(dataPath), dataPath = cd; end
% if nargin < 2, trialnums = []; end
% if nargin < 3 || isempty(buffertype), buffertype = 'signalIn'; end
% if nargin < 4, figpos = []; end
% if nargin < 5, bSaveCheck = 1; end
% end

% You know from your functions and arguments worksheet that audioGUI can take up to five input arguments. But 
% you can call it with empty arguments: 

audioGUI([],[45],'signalIn',[],0)

% or no arguments:

audioGUI

% So what these first lines of code are doing is to set the defaults. Let's look at the first one: 

if nargin < 1 || isempty(dataPath), dataPath = cd; end

% nargin is the number of arguments that the function received. What would a call to audioGUI look like with 0
% arguments? And with an empty argument in place of dataPath? 

% <---
audioGUI() 
% or
audioGUI

audioGUI([]) % plus any other misc args after
% ---> 

% Let's say we just called audioGUI with no arguments: 
audioGUI

% What would happen if we tried to evaluate both halves of this or-statement? (check if nargin < 1; check if 
% dataPath is empty)

% in this case, nargin = 0, and thus dataPath necessarily doesn't exist. If you tried to figure out if it was
% empty, it would error: 

isempty(dataPath)

% So you want Matlab to stop evaluating the or statement as soon as it figures out that nargin is 0. Would it
% be okay to write the statement as follows? Why or why not? 

if isempty(dataPath) || nargin < 1, dataPath = cd; end
% <---
% No because if you have 0 args, and you try to figure out if one of the args is empty, you'll hit a problem
% where a variable doesn't exist
% ---> 

%% Switch-case statements

% 1. If statements are in a class of statements called "jumps": they make the compiler jump around and not run
% every line of the code. The other type of jump is a switch-case statement, which works similarly: 

condWord = 'capper'; 
switch condWord
    case 'capper'
        max_events = 7;
    case 'gapper' 
        max_events = 8; 
    case 'sapper' 
        max_events = 9; 
    case 'zapper'
        max_events = 10; 
end
fprintf('You may have at most %d events\n',max_events); 

% The basic anatomy here is that you start the statement with the keyword "switch", followed by the variable
% that you want to switch process on, depending on what CASE it is. That is followed by multiple "case" lines,
% which indicate the possible cases. Here, condWord might be capper, gapper, sapper, or zapper. Then, just as
% you do for if statements, you terminate with an end. 

% 2. The main difference between switch-case and if statements is that switch-case statements operate over
% expected values of a variable, rather than logical statements. For example, you couldn't do: 

a = 5; 
switch a
    case a>0 
        fprintf('hi\n'); 
    case a<0 
        fprintf('bye\n'); 
end

% This simply won't evaluate. But this will: 

a = 4; 
switch a
    case 5 
        greeting = 'hello'; 
    case 6 
        greeting = 'salutations'; 
end
fprintf('Charlotte says %s!\n', greeting); 

% *** 
% Question: what would happen if a were 4? (Before you try to evaluate this, clear your "greeting" variable) 
% <---
% Nothing would print because greeting is just not defined, instead you would get an error
% ---> 

% 3. If you have multiple cases that would result in the same process, you can combine them (much like an "or"
% in an if/else): 

condWord = 'capper'; 
switch condWord
    case {'capper','gapper'}
        max_events = 7;     % doesn't include aspiration. is OST status but not a user event        
    case {'sapper','zapper'}
        max_events = 6; 
    case {'sea','C','Z','czar','gar','cod','god'}
        max_events = 5; 
end
fprintf('You may have at most %d events\n',max_events); 

% 4. Much like how in if/else statements, there is an "all other cases" option, switch case has the keyword
% "otherwise": 

a = 4; 
switch a
    case 5 
        greeting = 'hello'; 
    case 6 
        greeting = 'salutations'; 
    otherwise
        warning('Unexpected value') % This is a specific command that lets you know if something bad and unexpected happened! 
        greeting = 'go away'; 
end
fprintf('Charlotte says %s!\n', greeting); 

% ***
% Question: what are the advantages/disadvantages of using if/else vs. switch/case? 
% <---
% Switch case are nice when you have a relatively small set of predefined cases, and if/else are more
% convenient if you've got conditionals over "is this positive" (infinite cases) "is this negative" (also
% infinite) "is this empty". 
% ---> 

%% Practice translating switch/case to if/else and vice versa

% 1. Translate the following to an if/else statement: 
condWord = 'tapper'; 
switch condWord
    case {'capper','gapper'}
        max_events = 7;     % doesn't include aspiration. is OST status but not a user event        
    case {'sapper','zapper'}
        max_events = 6; 
    case {'sea','C','Z','czar','gar','cod','god'}
        max_events = 5; 
end
fprintf('You may have at most %d events\n',max_events); 

% <---
if strcmp(condWord, 'capper') || strcmp(condWord, 'gapper') 
    max_events = 7; 
elseif strcmp(condWord, 'sapper') || strcmp(condWord, 'zapper') 
    max_events = 6; 
elseif strcmp(condWord, 'sea') || strcmp(condWord, 'C') || strcmp(condWord, 'Z') || strcmp(condWord, 'czar') ...
        || strcmp(condWord, 'gar') || strcmp(condWord, 'cod') || strcmp(condWord, 'god')
    max_events = 5; 
else 
    max_events = NaN; % not strictly necessary but will prevent erroring in print statement
end
% ---> 

% 2. Translate the following to a switch/case statement: 
name = 'sarah'; 
if strcmp(name,'sarah')
    almaMater = 'UC Berkeley'; 
elseif strcmp(name,'robin')
    almaMater = 'Cornell University'; 
end
fprintf('%s earned her PhD at %s\n',name,almaMater); 

% <---
switch name
    case 'sarah'
        almaMater = 'UC Berkeley'; 
    case 'robin'
        almaMater = 'Cornell University'; 
    otherwise 
        almaMater = '???'; % same re: obligatoriness of otherwise 
end
% ---> 

% 3. Can you translate the following to a switch/case statement? Why/why not? 
name = 'ben'; 
if strcmp(name,'sarah')
    almaMater = 'UC Berkeley'; 
    possPro = 'her'; 
elseif strcmp(name,'robin')
    almaMater = 'Cornell University';
    possPro = 'her'; 
elseif strcmp(name,'ben')
    almaMater = 'USC'; 
    possPro = 'his'; 
elseif strcmp(name,'carrie')
    almaMater = 'MIT'; 
    possPro = 'her'; 
else 
    almaMater = 'unknown'; 
    possPro = 'their'; 
end
% <--- 
% Yes, simply change "else" to otherwise (translation already shown to be possible) 
% --->
fprintf('%s earned %s PhD at %s\n',name,possPro,almaMater); 