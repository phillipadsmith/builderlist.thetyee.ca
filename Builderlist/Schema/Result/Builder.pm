use utf8;
package Builderlist::Schema::Result::Builder;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Builderlist::Schema::Result::Builder

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<builders>

=cut

__PACKAGE__->table("builders");

=head1 ACCESSORS

=head2 subscriber_id

  data_type: 'integer'
  is_nullable: 0

=head2 first_name

  data_type: 'text'
  is_nullable: 0

=head2 last_name

  data_type: 'text'
  is_nullable: 0

=head2 builder_is_anonymous

  data_type: 'integer'
  is_nullable: 0

=head2 builder_sub_date

  data_type: 'timestamp'
  is_nullable: 1
  timezone: 'America/Vancouver'

=cut

__PACKAGE__->add_columns(
  "subscriber_id",
  { data_type => "integer", is_nullable => 0 },
  "first_name",
  { data_type => "text", is_nullable => 0 },
  "last_name",
  { data_type => "text", is_nullable => 0 },
  "builder_is_anonymous",
  { data_type => "integer", is_nullable => 0 },
  "builder_sub_date",
  {
    data_type   => "timestamp",
    is_nullable => 1,
    timezone    => "America/Vancouver",
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</subscriber_id>

=back

=cut

__PACKAGE__->set_primary_key("subscriber_id");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-03-12 15:27:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZUBcO0oiaZhkweewFr5J+w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->table("builderlist.builders");
1;
