#--------------------------------------------------------------------------------------------------#
#                                             ratio.jl                                             #
#--------------------------------------------------------------------------------------------------#

"""
`toknRatio <: UniformRatio`\n
A unified-precision crypto token ratio.
"""
struct toknRatio <: UniformRatio
    N::Symbol
    D::Symbol
    r::Rational{DEF.FixDecTy}
end

# export
export toknRatio

