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
 ├─ UnifiedAmount
 │   ├─ pairAmount
 │   └─ toknAmount
 │       ├─ crypAmt
 │       └─ fiatAmt
 └─ UnifiedRatio
     └─ toknRatio
```

Financial calculations with fiat and crypto currency amounts:

```julia
julia> const _sat = crypAmt(:BTC, 1e-8)     # user-defined "satoshi" — the smallest BTC amount
crypAmt(:BTC, FixedDecimal{Int128,10}(0.0000000100))

julia> acc = 2_326_484_sat
crypAmt(:BTC, FixedDecimal{Int128,10}(0.0232648400))

julia> dep = 123418_sat
crypAmt(:BTC, FixedDecimal{Int128,10}(0.0012341800))

julia> fee = 909_sat
crypAmt(:BTC, FixedDecimal{Int128,10}(0.0000090900))

julia> acc += dep - fee
crypAmt(:BTC, FixedDecimal{Int128,10}(0.0244899300))
```

Financial calculations with exchange rates:

```julia
julia> x, y = fiatAmt(:USD, 1891.81), crypAmt(:ETH, 1);

julia> r = x/y
toknRatio{fiatAmt, crypAmt}(fiatAmt(:USD, FixedDecimal{Int128,10}(1891.8100000000)), crypAmt(:ETH, FixedD
ecimal{Int128,10}(1.0000000000)))

julia> ratl(r)
189181//100

julia> asfp(r)
1891.810000000000000000000000000000000000000000000000000000000000000000000000001

julia> crypAmt(:ETH,0.023486863) * r
fiatAmt(:USD, FixedDecimal{Int128,10}(44.4326822920))
```


## Naming

The package "Crypto" part is spelled with "K", as in `Kr - Krypton` — the element, owing to the
greek origins of all things crypto.


## Author

C. Naaktgeboren

`NaaktgeborenC <dot!> PhD {at!} gmail [dot!] com`


## License

This project is [licensed](https://github.com/FinTils/UniKrypToks.jl/blob/main/LICENSE)
under the MIT license.


