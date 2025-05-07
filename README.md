![UniKrypToks](https://github.com/FinTils/UniKrypToks.jl/blob/main/docs/src/assets/logo-036.png?raw=true)

# UniKrypToks

Unified-precision crypto tokens.

Currently, there's no release version for `UniKrypToks`.


## Description

Unified-precision crypto tokens, `UniKrypToks`, is a package to store, represent, and manipulate
crypto token *amounts* with a unified precision, i.e., a common precision instead of the token's
own precision. This can be useful when reporting token amounts to a 3rd party that enforces a
prescribed precision (decimal places after the period), such as some government Tax agencies.

The default precision value is 10 decimal digits after the period. This is required, for
instance, by the Brazilian Tax Revenue Agency.


## Examples

Start by loading the package, as usual. The new types implemented by the package are all
subtypes of `AbstractFinance`:

```julia
julia> using UniKrypToks, TypeTree

julia> print(tt(AbstractFinance)...)
AbstractFinance
 └─ AbstractTokenAmount
     └─ toknAmount
         ├─ crypAmt
         └─ fiatAmt
```

Financial calculations with fiat and crypto currency amounts:

```julia
julia> sat(a::Integer) = a//1_0000_0000     # user-defined function for "satoshis"
sat (generic function with 1 method)

julia> txn = crypAmt(:BTC, 0.01772)
+0.0177200000    BTC

julia> fee = crypAmt(:BTC, sat(241))
+0.0000024100    BTC

julia> cre = txn - fee
+0.0177175900    BTC

julia> rate = fiatAmt(:USD, 96_000)
+96000.0000000000    USD

julia> FEE = bare(fee) * rate
+0.2313600000    USD
```


## Spelling

The package "Crypto" part is spelled with "K", as in `Kr - Krypton` — the element, owing to the
greek origins of all things crypto.


## Author

C. Naaktgeboren

`NaaktgeborenC <dot!> PhD {at!} gmail [dot!] com`


## License

This project is [licensed](https://github.com/FinTils/UniKrypToks.jl/blob/main/LICENSE)
under the MIT license.


