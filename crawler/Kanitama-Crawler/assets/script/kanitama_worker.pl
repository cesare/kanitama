#! /usr/bin/perl
use strict;
use warnings;

use lib '/fout/perlbrew/perls/perl-5.12.2/lib/site_perl/5.12.2';

use DBI;
use Parse::DMIDecode;

use Data::Dump qw/dump/;
use Data::Dumper;

#TODO さしあたり愚直に書くので後で良い感じにモジュール化する

my $bioses = {
    'bios-release-date' => '',
    'bios-vendor'       => '',
    'bios-version'      => '',
};

my $processors = {
    'processor-family'       => '',
    'processor-version'      => '',
    'processor-signature'    => '',
    'processor-manufacturer' => '',
    'processor-max-speed'    => '',
    'processor-id'           => '',
    'processor-core-count'   => '',
    'processor-core-enabled' => '',
};

my $baseboards = {
    'baseboard-product_name'   => '',
    'baseboard-serial-number'  => '',
    'baseboard-version'        => '',
    'baseboard-description'    => '',
    'system-uuid'              => '',
    'memory-maximum-capacity'  => '',
    'memory-number-of-devices' => '',
};

#my $memories = [];

my $dbh = DBI->connect('DBI:mysql:kanitama', 'kanitama', 'kanitama');
my $sth = $dbh->prepare("select * from hosts");
$sth->execute;

my $decoder = Parse::DMIDecode->new;

#TODO ひとまずホスト毎に愚直に処理
my $rows = $sth->fetchall_arrayref(+{});
#@$rows = @$rows[0];
for my $row (@$rows) {
    my $host = $row->{name};
    my $ip   = $row->{ipaddress};
    $bioses->{'host_id'} = $row->{id};
    $processors->{'host_id'} = $row->{id};
    $baseboards->{'host_id'} = $row->{id};

    #dump $host;
    $decoder->parse(qx(ssh $ip "sudo /usr/sbin/dmidecode"));   
    for my $handle ($decoder->get_handles) {
        my $memory = +{};
        for my $keyword ($handle->keywords) {
            $bioses->{$keyword}     = $handle->keyword($keyword) if exists $bioses->{$keyword};
            $processors->{$keyword} = $handle->keyword($keyword) if exists $processors->{$keyword};
            $baseboards->{$keyword} = $handle->keyword($keyword) if exists $baseboards->{$keyword};

#            $memory->{'memory-current-speed'} = $handle->keyword('memory-current-speed');
#            $memory->{'memory-enabled-size'}  = $handle->keyword('memory-enabled-size');
#            $memory->{'memory-type'}          = $handle->keyword('memory-type');
#            push @$memories, $memory;
#            $memories->{$keyword} = $handle->keyword($keyword) if exists $bioses->{$keyword};
#            if (ref($handle->keyword($keyword)) eq 'ARRAY') {
#                for my $value ($handle->keyword($keyword)) {
#                    dump $keyword;
#                    dump $value;
#                }
#            }
#            else {
#                dump $keyword;
#                dump $handle->keyword($keyword);
#            }
        }
    }
#dump $memories;
#   for my $keyword ($handle->keywords) {               
#       my $value = $handle->keyword($keyword);         
#       printf("Keyword \"%s\" => \"%s\"\n",            
#               $keyword,                               
#               (ref($value) eq 'ARRAY' ?               
#                   join(', ',@{$value}) : ($value||''))
#           );                                          
#   }                                                   

    my $bios_update_sql = "insert into bioses (
        host_id, bios_release_date, bios_vendor, bios_version, created_at, updated_at) 
        values (?, ?, ?, ?, now(), now()) on duplicate key update 
        bios_release_date = values(bios_release_date),
        bios_vendor = values(bios_vendor),
        bios_version = values(bios_version),
        updated_at = now()
        ";
    $sth = $dbh->prepare($bios_update_sql);
    $sth->execute(
        $bioses->{'host_id'},
        $bioses->{'bios-release-date'},
        $bioses->{'bios-vendor'},
        $bioses->{'bios-version'},
        );

    my $processors_update_sql = "insert into processors (
       host_id,
       processor_family, processor_version, 
       processor_signature, processor_manufacturer, 
       processor_max_speed, processor_id, 
       processor_core_count, processor_core_enabled,
       created_at, updated_at)
       values (?,?,?,?,?,?,?,?,?,now(),now()) on duplicate key update 
       processor_family = values(processor_family),
       processor_version = values(processor_version), 
       processor_signature = values(processor_signature),
       processor_manufacturer = values(processor_signature),
       processor_max_speed = values(processor_max_speed),
       processor_id = values(processor_id),
       processor_core_count = values(processor_core_count),
       processor_core_enabled = values(processor_core_enabled),
       updated_at = now()
       ";
    $sth = $dbh->prepare($processors_update_sql);
    $sth->execute(
        $processors->{'host_id'},
        $processors->{'processor-family'},
        $processors->{'processor-version'},
        $processors->{'processor-signature'},
        $processors->{'processor-manufacturer'},
        $processors->{'processor-max-speed'},
        $processors->{'processor-id'},
        $processors->{'processor-core-count'},
        $processors->{'processor-core-enabled'},
        );

    my $baseboards_update_sql = "insert into baseboards (
       host_id,
       baseboard_product_name, baseboard_serial_number,
       baseboard_version, baseboard_description,
       system_uuid, memory_maximum_capacity, memory_number_of_devices,
       created_at, updated_at)
       values (?,?,?,?,?,?,?,?,now(),now()) on duplicate key update
       baseboard_product_name = values(baseboard_product_name),
       baseboard_serial_number = values(baseboard_serial_number),
       baseboard_version = values(baseboard_version),
       updated_at = now()
       ";
    $sth = $dbh->prepare($baseboards_update_sql);
    $sth->execute(
        $baseboards->{'host_id'},
        $baseboards->{'baseboard-product-name'},
        $baseboards->{'baseboard-serial-number'},
        $baseboards->{'baseboard-version'},
        $baseboards->{'baseboard-description'},
        $baseboards->{'system-uuid'},
        $baseboards->{'memory-maximum-capacity'},
        $baseboards->{'memory-number-of-devices'},
    );
}

#dump $bioses;
#dump $processors;
#dump $baseboards;
# run
