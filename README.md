![UniKrypToks](https://github.com/FinTils/UniKrypToks.jl/blob/main/docs/src/assets/logo-036.png?raw=true)

# UniKrypToks

Unified-precision crypto tokens.

Currently, there's no release version for `UniKrypToks`.


## Description

Unified-precision crypto tokens, `UniKrypToks`, is a package to store, represent, and manipulate
crypto token *amounts* with a unified precision, i.e., a common precision instead of the
token's own precision. This can be useful when reporting token amounts to a 3rd party that
enforces a prescribed precision (decimal places after the period), such as some government Tax
agencies.

The default precision can vary from session to session, and the default value is 10 decimal
digits after the period. This is required, for instance, by the Brazilian Tax Revenue Agency.


## Spelling

The package "Crypto" part is spelled with "K", as in `Kr - Krypton` — the element, owing to the
greek origins of all things crypto.


## Author

C. Naaktgeboren

`NaaktgeborenC <dot!> PhD {at!} gmail [dot!] com`


## License

This project is [licensed](https://github.com/FinTils/UniKrypToks.jl/blob/main/LICENSE)
under the MIT license.


