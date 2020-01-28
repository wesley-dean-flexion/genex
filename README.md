# genex

While searching for ways to make the Slackbot more flexible, I came across an
article by Austin Pray that mentioned how to use a
Perl module called 'Regexp-Genex' that would statically compile a list of
strings that would match a given regular expression.  

The Dockerfile in this repository is built on top of perl:5-slim, loads the
Regexp-Genex module (via `cpanm`), and sets and entrypoint so that one use
`docker run` along with any regular expressions to statically compile.

The genex program will then dump out the list of strings separated by a comma,
each on their own line.

## Usage

To pull the image: `docker pull wesley-dean-flexion/genex`

To run the image: `docker run --rm -it wesley-dean-flexion/genex pattern(s)`

## Examples

```
# docker run --rm -it wesleydeanflexion/genex 'fo{1,3}'
fooo,
foo,
fo

# docker run --rm -it wesleydeanflexion/genex '(Wes|Wesley) likes (Docker|Perl)'
Wes likes Docker,
Wes likes Perl,
Wesley likes Docker,
Wesley likes Perl
```

## Alias

It may be convenient to add an alias:

```
alias genex="docker run --rm -it wesleydeanflexion/genex"
```

Once that's set, one may run `genex` as if it was a command:

```
# genex 'Ready for (Slack|slack)(Bot|bot)!'
Ready for SlackBot!,
Ready for Slackbot!,
Ready for slackBot!,
Ready for slackbot!
```

## References

Austin Pray's website:
<https://austinpray.com/>

Austin's article:
<https://austinpray.com/hacks/2015/04/16/using-regex-with-slackbot-responses.html>

Perl module:
<https://metacpan.org/pod/release/BOWMANBS/Regexp-Genex-0.07/lib/Regexp/Genex.pm>
