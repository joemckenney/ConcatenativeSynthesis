function z = powerOfTwo(x)
    if(x ~= 0 && (bitand(x, (x - 1)) == 0))
        z = 1;
    else
        z = 0;
    end
end
