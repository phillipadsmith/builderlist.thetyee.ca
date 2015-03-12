requires "Modern::Perl", "";
requires "Mojolicious", "";
requires "Text::CSV_XS", "";
requires "Try::Tiny", "";
requires "DBIx::Class", "";
requires "DBIx::Class::TimeStamp", "";
# Need to load the schema w/ dbicdump
requires "DBIx::Class::Schema::Loader", "";
# Loader requires Config::General
requires "Config::General", "";
# Date handling & parsing
requires "DateTime", "";
requires "Time::ParseDate", "";
requires "DateTime::Format::Pg", "";
