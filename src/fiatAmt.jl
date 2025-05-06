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
    function fiatAmt(sym::Symbol, val::FD)
        ## @assert()
        new(sym, val)
    end
end

# export
export fiatAmt

# concrete interface functions:
bare(x::fiatAmt) = x.val
symb(x::fiatAmt) = x.sym
isFiat(x::fiatAmt) = true


