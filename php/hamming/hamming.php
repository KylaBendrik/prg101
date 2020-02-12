<?php

function distance(string $strandA, string $strandB) : int
{
    $arrayA = str_split($strandA);
    $arrayB = str_split($strandB);
    if (count($arrayA) != count($arrayB)) {
        throw new InvalidArgumentException('DNA strands must be of equal length.');
    }
    print_r(array_diff_assoc($arrayA, $arrayB));
    $diff = array_diff_assoc($arrayA, $arrayB);

    return count($diff);
}
