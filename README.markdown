## Puppet Lists Functions

This module is an attempt to port useful erlang stdlib functions to the Puppet 4 language.

## Why?

Puppet has a very limited standard library compared to many other languages. Erlang is a functional language with declarative aspirations, immutable variables, and similar data structures if you squint a bit. The standard library has been incrementally improved over about 25 years. Rather than invent a new stdlib, I'd rather put the time into re-implementing the parts of the erlang stdlib that make sense. This module is the first piece of that project.

### Setup Requirements

You need Puppet 4. The functions are all implemented in either ruby using the puppet 4 function API, or in puppet itself using native functions.

## Usage

No configuration / setup is needed, beyond installing the module. Just make sure to use the full namespace (e.g. `lists::dropwhile`, not `dropwhile`). If you use this from another puppet module (other than your control repo), make sure to declare the dependency in metadata.json or the `lists` module namespace won't be available to you.

## Limitations

These functions currently only work with arrays, not hashes, because puppet arrays are most similar to erlang lists. Consequently, using these requires atypical use of puppet data structures. In erlang, it's common to see data structures like: (using puppet notation)

```puppet
['ok', [['key', 'value'], ['key2','value2']]]
```

By convention, many Erlang functions return results a lists with the first word set either to "ok" or to "error", and the second list element being the actual data payload. This allows for matching more easily:

```puppet
$returnvalue = somefunction($foo)
case $returnvalue {
  ['ok', Array]: { notice("success, got data ${returnvalue[1]} }
  ['error', Array]: { notice("ruh-roh. Failed with error ${returnvalue[1] } }
}
```


## Reference

The following functions have been implemented:

* all
* any
* append
* concat
* delete
* droplast
* dropwhile
* duplicate
* filter
* filtermap
* flatten
* flattenlength
* keydelete
* keyfind
* keymap
* keymember
* keymerge
* keysort
* last
* max
* min
* partition
* reverse

The only existing documentation on how to use them is to read the tests in the `tests` folder. If you're adventurous, read the erlang stdlib docs for lists at http://erlang.org/doc/man/lists.html.

## Development

These functions are tested inside the puppet language, using [puppet-assert](http://forge.puppetlabs.com/danieldreier/assert). Run tests by doing a puppet apply of the relevant file in the `tests` folder.

Contributions would very much be welcome. My goals include:
* implement the remaining erlang lists functions
* implement the functions that don't accept lambdas in puppet
* improve at least some of these functions to accept hashes
* add code comments and use puppet strings to generate docs
* figure out how to run our tests in CI
