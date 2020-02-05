<?php

function distance(string $strandA, string $strandB) : int
{
    $arrayA = str_split($strandA);
    $arrayB = str_split($strandB);
    if (count($arrayA) != count($arrayB)) {
        throw new InvalidArgumentException('DNA strands must be of equal length.');
    }
    $dist = 0;
    foreach ($arrayA as $key=>$value) {
        if ($arrayB[$key] != $value){
            $dist += 1;
        }
    }
    return $dist;
}
