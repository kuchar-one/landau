$pdf_mode = 4;
$postscript_mode = $dvi_mode = 0;
$out_dir = 'build';
$ENV{'OSFONTDIR'} = 'fonts//' . ($ENV{'OSFONTDIR'} ? ":$ENV{'OSFONTDIR'}" : "");
