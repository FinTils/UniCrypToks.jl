#--------------------------------------------------------------------------------------------------#
#                                             ratio.jl                                             #
#--------------------------------------------------------------------------------------------------#

"""
`toknRatio <: UniformRatio`\n
A unified-precision crypto token ratio.
"""
struct toknRatio{𝗡, 𝗗} <: UniformRatio where {𝗡 <: toknAmount, 𝗗 <: toknAmount}
    N::𝗡
    D::𝗗
    toknRatio(n::toknAmount, d::toknAmount) = new{typeof(n), typeof(d)}(n, d)
end

(num(r::toknRatio{𝗡, 𝗗})::𝗡) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = r.N

(den(r::toknRatio{𝗡, 𝗗})::𝗗) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = r.D

(rat(r::toknRatio{𝗡, 𝗗})::Rational{DEF.FixDecTy}) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} =
    Rational{DEF.FixDecTy}(bare(num(r)).i, bare(den(r)).i)

function simplify(r::toknRatio{𝗡, 𝗗}) where {𝗡 <: toknAmount, 𝗗 <: toknAmount}
    ratio = rat(r)
    toknRatio(one(num(r)) / DENO * ratio.num, one(den(r)) / DENO * ratio.den)
end

# export
export toknRatio, num, den, rat, simplify

# show
function Base.show(io::IO, r::toknRatio)
    print(num(r))
    print(" : ")
    print(den(r))
end


