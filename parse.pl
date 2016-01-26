#!d:/perl/bin/perl -w

use Switch;

print "starting...\n";


my @files = <./in/*.csv>;
for(my $i=0; $i<@files; $i++) {
   print $files[$i]."\n";
}


open OUT, ">", "./code.sql" or die "Can't open $name on write!\n";

print OUT <<EOF;
DROP TABLE IF EXISTS `diapazon`;
CREATE TABLE `diapazon` (
        `start` BIGINT(12),
        `end` BIGINT(12),
        `name` VARCHAR(80),
        `area` VARCHAR(20)
) ENGINE = MYISAM;

SET AUTOCOMMIT=0;

-- INSERT INTO diapazon VALUES (79999800000,79999999999,'Москва и Моск обл ','moscow');
EOF


for ($i=0; $i<@files; $i++) {
  open (UN, "<", $files[$i]) || print "cant open";

  print "parse $files[$i]\n";

  while (<UN>)
  { # 301     ;       2202000 ;       2202099 ;       100     ;       ООО "Мобилон Телекоммуникации"  ;       г. Улан-Удэ|Республика Бурятия
    my @data = split "\t;\t";
    chomp(@data);
    my $area = '';
    my $kode1 = '7'.$data[0].$data[1];
    my $kode2 = '7'.$data[0].$data[2];
    switch($data[5]) {
        case qr/Татар/ {$area = 'tatar'}
        case qr/Удмурт/ {$area = 'udmurt'}
        case qr/Башкир/ {$area = 'bashir-repub'}
        case qr/Перм/ {$area = 'perm-area'}
        case qr/Саратов/ {$area = 'saratov-area'}
        case qr/Свердло/ {$area = 'sverd-area'}
        case qr/Екатер/ {$area = 'sverd-area'}
        case qr/Тюмен/ {$area = 'tumen-area'}
        case qr/Челяб/ {$area = 'chelyab-area'}
        case qr/Курган/ {$area = 'kurgan-area'}
        case qr/Мордов/ {$area = 'mordov'}
        case qr/Пенз/ {$area = 'penza'}
        case qr/Марий/ {$area = 'mariyel'}
        case qr/Тамбов/ {$area = 'tambov'}
        case qr/Нижний/ {$area = 'nizhniy'}
        case qr/Ульянов/ {$area = 'ulyanov'}
        case qr/Киров/ {$area = 'kirov'}
        case qr/Омск/ {$area = 'omsk'}
        case qr/Ханты/ {$area = 'hantiman'}
        case qr/Чуваш/ {$area = 'chuvash'}
        case qr/Иванов/ {$area = 'ivanov'}
        case qr/Псков/ {$area = 'pskov'}
        case qr/Смоленск/ {$area = 'smolensk'}
        case qr/Новосибирск/ {$area = 'novosib'}
        case qr/Волгоград/ {$area = 'volgograd'}
        case qr/Бурят/ {$area = 'buriat'}
        case qr/Краснодар/ {$area = 'krasnodar'}
        case qr/Коми/ {$area = 'komi'}
        case qr/Калмык/ {$area = 'kalmik'}
        case qr/Костром/ {$area = 'kostrom'}
        case qr/Ростов/ {$area = 'rostov'}
#        case qr// {$area = ''}
#        case qr// {$area = ''}
    }

    print OUT '(\''.$kode1.'\',\''.$kode2.'\',\''.$data[5].'\',\''.$area.'\'),'."\n"
  }
 close UN;
}


print OUT <<EOF;

COMMIT;
EOF


close OUT;
