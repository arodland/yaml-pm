BEGIN {
    push @INC, 't/testlib';
}
use YAML_Test;

my @files;
opendir DIR, "t/data/yaml";
while (my $file = readdir(DIR)) {
    next if $file =~ /^\.{1,2}$/;
    die "No comparison file t/data/dumper/$file found\n"
      unless -f "t/data/dumper/$file";
    push @files, $file;
}

print "1..", scalar @files, "\n";

for my $file (@files) {
    TestLoad($file);
}
