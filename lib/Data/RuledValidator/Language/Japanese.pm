package Data::RuledValidator::Language::Japanese;

use strict;
use Data::RuledValidator;

my @operator = (
                is        => 'は',
                length_jp => 'の長さは',
               );

my @condition = (
                 hiragana => 'ひらがな',
                 hiragana => '平仮名',
                 katakana => 'カタカナ',
                 katakana => 'かたかな',
                 katakana => '片仮名',
                 jp_zip   => '郵便番号',
                 jp_phone_number   => '電話番号',
                 jp_mobile_email   => '携帯メール',
                 jp_imode_email    => 'DoCoMoメール',
                 jp_ezweb_email    => 'AUメール',
                 jp_softbank_email => 'Softbankメール',
                 jp_vodafone_email => 'Vodafoneメール',
		 number            => '数字',
		 alpha             => '英語',
		 alphanum          => '英数字',
		 word              => '単語',
		 words             => '単文',
		 not_null          => '必須',
                );

for my $i (0 .. $#operator){
  next if $i % 2;
  my($name, $jp_name) = @operator[$i, $i + 1];
  Data::RuledValidator->__operator
      (
       $jp_name => Data::RuledValidator->__operator($name)
      );
}

for my $i (0 .. $#condition){
  next if $i % 2;
  my($name, $jp_name) = @condition[$i, $i + 1];
  Data::RuledValidator->__condition
      (
       $jp_name => Data::RuledValidator->__condition($name)
      );
}

1;

=encoding utf-8

=head1 NAME

Data::RuledValidator::Language::Japanese - Data::RuledValidator usign rule written in Japanese

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

In rule file;

   HIRAGANA                   は ひらがな
   KATAKANA                   は カタカナ
   # thease(_with_with_space) faile
   HIRAGANA_with_white_space  は ひらがな
   KATAKANA_with_white_space  は カタカナ
   HIRAGANA_with_white_space2 は ひらがな
   KATAKANA_with_white_space2 は カタカナ

   JP_ZIP                     は 郵便番号
   JP_MOBILE_EMAIL            は 携帯メール
   JP_MOBILE_EMAIL_DOCOMO     は 携帯メール
   JP_MOBILE_EMAIL_AU         は 携帯メール
   JP_MOBILE_EMAIL_SOFTBANK   は 携帯メール
   JP_MOBILE_EMAIL_WILLCOM    は 携帯メール
   JP_MOBILE_EMAIL_VODAFONE   は 携帯メール
   JP_MOBILE_EMAIL_DOCOMO     は DoCoMoメール
   JP_MOBILE_EMAIL_AU         は AUメール
   JP_MOBILE_EMAIL_SOFTBANK   は Softbankメール
   JP_MOBILE_EMAIL_VODAFONE   は Vodafoneメール
   JP_PHONE_NUMBER            は 電話番号
   JAPANESE_WORDS             の長さは 0, 10

=head1 PROVIDED CONDITIONS

This plugin provides the following Conditions.

=over 4

=item 数字

 number は 数字

For number

=item 英語

 alphabet は 英語

For alphabet

=item 英数字

 alphanum は 英数字

For alphanum

=item 単語

 word は 単語

For word

=item 単文

 words は 単文

For words

=item ひらがな,平仮名

 family_name_kana は ひらがな

For hiragana.

=item かたかな,片仮名,カタカナ

 family_name_kana は かたかな

For katakana

=item 電話番号

 zipcode は 電話番号

For Japanese phone number.

=item 郵便番号

 zipcode is 郵便場号

For Japanese zip code.
###-####.

=item 携帯メール

 mobile_mail is jp_mobile

For Japanese mobile mail address.
It allow many kinds of mobile email address.

If you want to check specified kinds of mail address,
use the following;

=back

=over 8

=item * DoCoMoメール

=item * AUメール

=item * Vodafoneメール

=item * Softbankメール

=back

=head1 PROVIDED OPERATORS

This plugin provides the following Operator.

=over 4

=item は

 hiragana は 平仮名

This is same as normal operator C<is>.

=item の長さは #, #

 jp_words の長さは 0, 10

If the length of jp_words is from 0 to 10, it is valid.
The first number is min length, and the second number is max length.

You can write only one value.

 jp_words の長さは 5

This means length of jp_words lesser than 6.

=back

=head1 AUTHOR

Ktat, C<< <ktat at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-data-ruledvalidator-plugin-japanese at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Data-RuledValidator-Language-Japanese>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Data::RuledValidator::Plugin::Japanese

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Data-RuledValidator-Language-Japanese>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Data-RuledValidator-Language-Japanese>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Data-RuledValidator-Language-Japanese>

=item * Search CPAN

L<http://search.cpan.org/dist/Data-RuledValidator-Language-Japanese>

=back

=head1 SEE ALSO

=over 4

=item * L<Data/RuledVadalitor>

=item * L<Data/RuledVadliator/Plugin/Japanese>

=back

Thanks!

=head1 COPYRIGHT & LICENSE

Copyright 2007 Ktat, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Data::RuledValidator::Language::Japanese


