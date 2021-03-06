use strict;
use warnings;

use Test::More;
use Test::Exception;

BEGIN { use_ok('AliTV::Base') };
local *AliTV::Base::_initialize = sub {};

can_ok('AliTV::Base', qw(file));

# the setter should implement a check for existing files and die otherwise
can_ok('AliTV::Base', qw(_file_check));

my $obj = AliTV::Base->new();

# check if the default value is undef
ok(! defined $obj->file(), 'Default value is undef');

# check if the getter works correctly, therefore set the value without setter
my $inputfile = "data/existing_testfile";
$obj->{file} = $inputfile;
ok($obj->file() eq $inputfile, 'Getter file works without setter');

### Setter file
# create a new object
$obj = AliTV::Base->new();

# and use the setter to set the filename
$inputfile = "data/existing_testfile";
ok($obj->file($inputfile) eq $inputfile, 'Setter file is able to set the attribute');

# usage of non existing files should lead to an exception
$inputfile = "data/non_existing_testfile";
throws_ok { $obj->file($inputfile) } qr/The file .* does not exist!/, 'Exception when using non existing files';

### finally I want to set the file attribute via constructor if it is provided
$inputfile = "data/existing_testfile";
$obj = AliTV::Base->new(-file => $inputfile);
ok($obj->file() eq $inputfile, 'Setter file is able to set the attribute via constructor');

$inputfile = "data/non_existing_testfile";
throws_ok { $obj = AliTV::Base->new(-file => $inputfile); } qr/The file .* does not exist!/, 'Exception when using non existing files via constructor';

done_testing;
