package Data::RuledValidator::Plugin::Japanese;

use warnings;
use strict;

my @match_functions;

BEGIN{
  use Data::FormValidator::Constraints::Japanese ();
  @match_functions = map /^_match_(.+)$/ ? $1 : (), keys %Data::FormValidator::Constraints::Japanese::;
}

no strict 'refs';

Data::RuledValidator->add_condition_operator
  (
   map {
     my $func = \&{$Data::FormValidator::Constraints::Japanese::{"_match_" . $_}};
     $_ =>
       sub{
         my($self, $v) = @_;
         return $func->($v) ? 1 : ()
       };
   } @match_functions
  );

my $length_func = \&Data::FormValidator::Constraints::Japanese::_check_jp_length;

Data::RuledValidator->add_operator
  (
   length_jp => 
   sub {
     my($key, $c, $op) = @_;
     my($start, $end) = split(/,/, $c);
     return
       sub {
         my($self, $v) = @_;
         return $length_func->($v->[0], defined $end ? ($start, $end) : $start) + 0;
       };
     }
  );

1;

=head1 NAME

Data::RuledValidator::Plugin::Japanese - Data::RuledValidator plugin for Japanese

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

In rule file;

   HIRAGANA                   is hiragana
   KATAKANA                   is katakana
   HIRAGANA_with_white_space  is hiragana
   KATAKANA_with_white_space  is katakana
   HIRAGANA_with_white_space2 is hiragana
   KATAKANA_with_white_space2 is katakana
   JP_ZIP                     is jp_zip
   JP_MOBILE_EMAIL            is jp_mobile_email
   JP_MOBILE_EMAIL_DOCOMO     is jp_mobile_email
   JP_MOBILE_EMAIL_AU         is jp_mobile_email
   JP_MOBILE_EMAIL_SOFTBANK   is jp_mobile_email
   JP_MOBILE_EMAIL_WILLCOM    is jp_mobile_email
   JP_MOBILE_EMAIL_VODAFONE   is jp_mobile_email
   JP_MOBILE_EMAIL_DOCOMO     is jp_imode_email
   JP_MOBILE_EMAIL_AU         is jp_ezweb_email
   JP_MOBILE_EMAIL_SOFTBANK   is jp_vodafone_email
   JP_MOBILE_EMAIL_VODAFONE   is jp_vodafone_email
   JAPANESE_WORDS             length_jp 0, 10

=head1 PROVIDED CONDITIONS

This plugin provide the following Conditions.

 hiragana
 katakana
 jp_zip
 jp_mobile_email
 jp_imode_email
 jp_ezweb_email

=head1 PROVIDED OPERATORS

This plugin provide the following Operators.

 length_jp

=head1 AUTHOR

Ktat, C<< <ktat at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-data-ruledvalidator-plugin-japanese at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Data-RuledValidator-Plugin-Japanese>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Data::RuledValidator::Plugin::Japanese

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Data-RuledValidator-Plugin-Japanese>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Data-RuledValidator-Plugin-Japanese>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Data-RuledValidator-Plugin-Japanese>

=item * Search CPAN

L<http://search.cpan.org/dist/Data-RuledValidator-Plugin-Japanese>

=back

=head1 SEE ALSO

=over 4

=item * Data::FormValidator::Constraints::Japanese

This plugin just uses functions of Data::FormValidator::Constraints::Japanese.
Thanks!

=back

=head1 COPYRIGHT & LICENSE

Copyright 2007 Ktat, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Data::RuledValidator::Plugin::Japanese
