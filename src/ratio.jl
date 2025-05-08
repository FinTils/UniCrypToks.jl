#--------------------------------------------------------------------------------------------------#
#                                             ratio.jl                                             #
#--------------------------------------------------------------------------------------------------#

# imports
import Base: +, -, *, /, inv, abs, ==, isless, zero, one

# {𝕋, 𝕋}-binaries
for bnARY in [:+, :-]
    OPER = bnARY == :+ ? "add" : "subtract"
    @eval begin
        function $bnARY(x::𝕋, y::𝕋) where {𝕋 <: UniformRatio}
            @assert(symb(x) == symb(y),
                    @sprintf("Can't %s different tokens!", $OPER))
            𝕋(symb(x), $bnARY(bare(x), bare(y)))
        end
    end
end

# {𝕋, Real}-binaries
for bnARY in [:*, :/]
    @eval $bnARY(x::𝕋, y::Real) where {𝕋 <: UniformRatio} = 𝕋(symb(x), $bnARY(bare(x), y))
end
# fallback versions thereof
*(y::Real, x::𝕋) where {𝕋 <: UniformRatio} = *(x, y)

# Bool {𝕋, 𝕋}-binaries
for bnARY in [Symbol("=="), :isless]
    @eval $bnARY(x::𝕋, y::𝕋) where {𝕋 <: UniformRatio} = $bnARY(bare(x), bare(y))
end


#--------------------------------------------------------------------------------------------------#
#                                            toknRatio                                             #
#--------------------------------------------------------------------------------------------------#

"""
`toknRatio <: UniformRatio`\n
A unified-precision crypto token ratio.
"""
struct toknRatio{𝗡, 𝗗} <: UniformRatio where {𝗡 <: toknAmount, 𝗗 <: toknAmount}
    N::𝗡
    D::𝗗
    toknRatio(n::toknAmount, d::toknAmount) = new{typeof(n), typeof(d)}(n, d)
    toknRatio{𝗡, 𝗗}(n::𝗡, d::𝗗) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = new{𝗡, 𝗗}(n, d)
end

# export
export toknRatio

# outer constructor for symb(), bare() arguments
function toknRatio(s::Symbol, b::NTuple{2,FD})
    sN, sD = [Symbol(i) for i in split(string(s), '╱')]
    aN, aD = b
    n = isFiat(sN) ? fiatAmt(sN, aN) : crypAmt(sN, aN)
    d = isFiat(sD) ? fiatAmt(sD, aD) : crypAmt(sD, aD)
    toknRatio(n, d)
end

# Interface functions
symb(r::toknRatio) = (symb(r.N), symb(r.D))

jsym(r::toknRatio) = Symbol(join([string(i) for i in symb(r)], "╱"))

bare(r::toknRatio) = (bare(r.N), bare(r.D))

ratl(r::toknRatio) = Rational([i.i for i in bare(r)]...)

mkcp(r::toknRatio) = toknRatio(symb(r), bare(r))

asfp(r::toknRatio) = BigFloat(ratl(r))

(num(r::toknRatio{𝗡, 𝗗})::𝗡) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = r.N

(den(r::toknRatio{𝗡, 𝗗})::𝗗) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = r.D

function simp(r::toknRatio{𝗡, 𝗗}) where {𝗡 <: toknAmount, 𝗗 <: toknAmount}
    ratio = ratl(r)
    toknRatio(one(num(r)) / DENO * ratio.num, one(den(r)) / DENO * ratio.den)
end

# export
export jsym, ratl, asfp, num, den, simp

# Base operations
-(r::toknRatio) = toknRatio(-num(r), den(r))

inv(r::toknRatio) = toknRatio(den(r), num(r))

abs(r::toknRatio) = signbit(asfp(r)) ? (signbit(float(bare(num(r)))) ? -r : inv(-inv(r))) : r

one(r::toknRatio) = toknRatio(num(r) / bare(num(r)), den(r) / bare(num(r)))

function one(::Type{toknRatio{𝗡, 𝗗}},
             s::NTuple{2,Symbol},
             d::Real = 1) where {𝗡 <: toknAmount, 𝗗 <: toknAmount}
    N = 𝗡(s[1],     one(FD))
    D = 𝗗(s[2], d * one(FD))
    toknRatio{𝗡, 𝗗}(N, D)
end

function one(::Type{toknRatio}, s::NTuple{2,Symbol}, d::Real = 1)
    𝗡 = isFiat(s[1]) ? fiatAmt : crypAmt
    𝗗 = isFiat(s[2]) ? fiatAmt : crypAmt
    one(toknRatio{𝗡, 𝗗}, s, d)
end


#--------------------------------------------------------------------------------------------------#
#                                       toknRatio operations                                       #
#--------------------------------------------------------------------------------------------------#

(/(x::𝗡, y::𝗗)::toknRatio{𝗡, 𝗗}) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = toknRatio{𝗡, 𝗗}(x, y)

(*(y::𝗗, r::toknRatio{𝗡, 𝗗})::𝗡) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} =
    𝗡(symb(num(r)), bare(y) * bare(num(r)) / bare(den(r)))

(*(r::toknRatio{𝗡, 𝗗}, y::𝗗)::𝗡) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = y * r

(/(y::𝗗, r::toknRatio{𝗗, 𝗡})::𝗡) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = y * inv(r)

# Ratio annihilation operations
function *(r::toknRatio{𝗡, 𝗗}, ζ::toknRatio{𝗗, 𝗡}) where {𝗡 <: toknAmount, 𝗗 <: toknAmount}
    @assert(symb(num(r)) == symb(den(ζ)) &&
            symb(num(ζ)) == symb(den(r)), "Can't simplify away operating monetary units!")
    ratl(r) * ratl(ζ)
end

/(r::toknRatio{𝗡, 𝗗}, ζ::toknRatio{𝗡, 𝗗}) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = r * inv(ζ)


