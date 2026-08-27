#!/usr/bin/env perl

use strict;
use warnings;

use utf8;
binmode(STDOUT, ':encoding(UTF-8)');

my $input_file = 'app.log';
my $output_file = 'filtered_errors.log';

open(my $in_fh, '<:encoding(UTF-8)', $input_file)
    or die "Не удалось открыть файл '$input_file': $!";

open(my $out_fh, '>:encoding(UTF-8)', $output_file)
    or die "Не удалось открыть файл '$output_file': $!";

my $total_lines = 0;
my $matched_lines = 0;

print("Начало обработки файла $input_file\n");

while (my $line = <$in_fh>) {
    $total_lines++;

    chomp($line);
    
    if ($line =~ /(ERROR|WARNING)/i) {
        $matched_lines++;

        $line =~ s/^\s+|\s+$//g;

        $line =~ s/\t+/ /g;
       
       print($out_fh sprintf("[Line %05d] %s\n", $total_lines, $line)); 
    }
}

close($in_fh);
close($out_fh);

print("Обработка завершена\n");
print "Всего прочитано строк: $total_lines\n";
print "Найдено и записано:   $matched_lines\n";