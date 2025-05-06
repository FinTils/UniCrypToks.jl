#--------------------------------------------------------------------------------------------------#
#                                            crypAmt.jl                                            #
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
#                                      crypAmt <: toknAmount                                       #
#--------------------------------------------------------------------------------------------------#

"""
`struct crypAmt <: toknAmount`\n
A crypto `toknAmount`, i.e., a crypto currency amount of uniform representation.
"""
struct crypAmt <: toknAmount
    sym::Symbol
    val::FD
    function crypAmt(sym::Symbol, val::FD)
        ## @assert()
        new(sym, val)
    end
end

# export
export crypAmt

# concrete interface functions:
bare(x::crypAmt) = x.val
symb(x::crypAmt) = x.sym
isFiat(x::crypAmt) = false

