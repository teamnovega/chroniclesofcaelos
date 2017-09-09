///getArrayTotal(array_var);
var array = argument0;

a_length = array_length_1d(array);

var i, total;
i = 0;
total = 0;
repeat(a_length)
    {
    total += array[i];
    i += 1;
    }

return total;
