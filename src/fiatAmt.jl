#--------------------------------------------------------------------------------------------------#
#                                            fiatAmt.jl                                            #
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
#                                      fiatAmt <: toknAmount                                       #
#--------------------------------------------------------------------------------------------------#

"""
`struct fiatAmt <: toknAmount`\n
A fiat `toknAmount`, i.e., a fiat currency amount of uniform representation.
"""
struct fiatAmt <: toknAmount
    sym::Symbol
    val::FD
end

# export
export fiatAmt

# concrete interface functions:
bare(x::fiatAmt) = x.val
symb(x::fiatAmt) = x.sym
isFiat(x::crypAmt) = true


