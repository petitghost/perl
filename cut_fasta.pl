#!/usr/bin/perl                                                                                                    
use v5.10;
use Bio::SeqIO;
 
my $in = Bio::SeqIO->new(-file => $ARGV[0] , -format => 'fasta');
 
while (my $seq = $in->next_seq()) {
    say($seq->id());
    #say($seq->desc());
    #say($seq->seq());

    my $out = Bio::SeqIO->new(-file => ">".$seq->id().".fasta", -format => 'fasta');
    $out->write_seq($seq);
    $out->close();
}
 
$in->close();
