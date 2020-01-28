FROM perl:5-slim

RUN useradd genex && cpanm Regexp::Genex

USER genex

ENTRYPOINT ["perl", "-MRegexp::Genex=:all", "-e", "foreach my $arg (@ARGV) { print join(\",\n\", strings(qr/$arg/)); }; print \"\n\""]
