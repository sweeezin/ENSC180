function newString = stringfunction(inputStr)

    inputStr = inputStr(isletter(inputStr));

    for i = 2:2:length(inputStr)
        inputStr(i) = upper(inputStr(i));
    end

    newString = inputStr;
end