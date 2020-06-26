# es6-minifier
Embeds Terser (current standard es6 minification tool in the NPM ecosystem) in
a crystal shard via a cross-platform pkg-powered binary that embeds Terser
in a lightweight portable nodejs environment. No nodejs required.

## Usage

Just install
the shard and you can minify your ES6+ Javascript as follows:

```crystal
require "es6-minifier"

Es6Minifier.minify!("const  something = 3;") # => "const something=3;"

Es6Minifier.minify!(["file1.js", "file2.js"])
# file1.js and file2.js are overwritten with a minified version of their contents
```

If a parsing or IO error occurs, `Es6Minifier.minify!` will throw an error.

Right now there are no configurable options however this could be easily
added by passing JSON options to `minify.js` and adding a bit of code
on the crystal side. Pull requests welcome!

Currently supports linux, macos, and alpine. Could easily support FreeBSD
and Windows with a several line change.

## Installation

Just add the following to yoour `shard.yml`:
```
dependencies:
  es6-minifier:
    github: sam0x17/es6-minifier
```
