Assignment name  : second_word
Expected files   : second_word.c
Allowed functions: write
--------------------------------------------------------------------------------

Write a program that takes a string and displays its second word, followed by a newline.

A word is a section of a string delimited by spaces/tabs or by the start/end of the string.

If the number of parameters is not 1, or if there are no words, simply display a newline.

Examples:

$> ./second_word "pikachu is cool" | cat -e
is$

$> ./second_word "test this if you sigma" | cat -e
this$

$> ./second_word "fsilva-p is the best :D" | cat -e
is$

$> ./second_word "not even one word" | cat -e
even$

$> ./second_word "who needs second words when you have a first word" | cat -e
needs$

$> ./second_word "    just some spaces before words   " | cat -e
some$

$> ./second_word "42 is the answer to life" | cat -e
is$

$> ./second_word "   " | cat -e
$
