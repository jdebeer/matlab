function numtext = num2text(num)

%num2text receives an integer, with a maximum integer of 29, and displays
%the number's text equivalent

if (int32(num) == num) && (num <= 29) && (num >= 0)

    if num == 0
        numtext = sprintf('zero');
    elseif num == 1
        numtext = sprintf('one');
    elseif num == 2
        numtext = sprintf('two');
    elseif num == 3
        numtext = sprintf('three');
    elseif num == 4
        numtext = sprintf('four');
    elseif num == 5 
        numtext = sprintf('five');
    elseif num == 6
        numtext = sprintf('six');
    elseif num == 7
        numtext = sprintf('seven');
    elseif num == 8
        numtext = sprintf('eight');
    elseif num == 9
        numtext = sprintf('nine');
    elseif num == 10
        numtext = sprintf('ten');
    elseif num == 11
        numtext = sprintf('eleven');
    elseif num == 12
        numtext = sprintf('twelve');
    elseif num == 13
        numtext = sprintf('thirteen');
    elseif num == 14
        numtext = sprintf('forteen');
    elseif num == 15
        numtext = sprintf('fifteen');
    elseif num == 16
        numtext = sprintf('sixteen');
    elseif num == 17
        numtext = sprintf('seventeen');
    elseif num == 18
        numtext = sprintf('eighteen');
    elseif num == 19
        numtext = sprintf('nineteen');
    elseif num == 20
        numtext = sprintf('twenty');
    elseif num == 21
        numtext = sprintf('twenty-one');
    elseif num == 22
        numtext = sprintf('twenty-two');
    elseif num == 23
        numtext = sprintf('twenty-three');
    elseif num == 24
        numtext = sprintf('twenty-four');
    elseif num == 25
        numtext = sprintf('twenty-five');
    elseif num == 26
        numtext = sprintf('twenty-six');
    elseif num == 27
        numtext = sprintf('twenty-seven');
    elseif num == 28
        numtext = sprintf('twenty-eight');
    elseif num == 29
        numtext = sprintf('twenty-nine');
    end
    
else
    fprintf('The integer range of this function is 0 to 29\n')
end