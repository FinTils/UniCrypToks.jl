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
    toknRatio(n::toknAmount, d::toknAmount) = new(n, d)
end

(num(r::toknRatio{𝗡, 𝗗})::𝗡) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = r.N

(den(r::toknRatio{𝗡, 𝗗})::𝗗) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} = r.D

(rat(r::toknRatio{𝗡, 𝗗})::Rational{DEF.FixDecTy}) where {𝗡 <: toknAmount, 𝗗 <: toknAmount} =
    Rational{DEF.FixDecTy}(num(r).i, den(r).i)

function simplify(r::toknRatio{𝗡, 𝗗}) where {𝗡 <: toknAmount, 𝗗 <: toknAmount}
    ratio = rat(r)
    toknRatio(one(num(r)) * ratio.num, one(den(r)) * ratio.den)
end

# export
export toknRatio, num, den, rat, simplify

# show
function show(io::IO, ::MIME"text/plain", r::toknRatio)
    print(@sprintf("%s : %s", num(r), den(r)))
end


