#--------------------------------------------------------------------------------------------------#
#                                             ratio.jl                                             #
#--------------------------------------------------------------------------------------------------#

"""
`toknRatio <: UniformRatio`\n
A unified-precision crypto token ratio.
"""
struct toknRatio{ℕ, 𝔻} <: UniformRatio where {ℕ <: toknAmount, 𝔻 <: toknAmount}
    N::ℕ
    D::𝔻
    function toknRatio(n::toknAmount, d::toknAmount)
    end
end

# export
export toknRatio

