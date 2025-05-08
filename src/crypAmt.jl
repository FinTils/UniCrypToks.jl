#--------------------------------------------------------------------------------------------------#
#                                            crypAmt.jl                                            #
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
#                                      crypAmt <: toknAmount                                       #
#--------------------------------------------------------------------------------------------------#

"""
`struct crypAmt <: toknAmount`\n
A cryp `toknAmount`, i.e., a crypto currency amount of unified representation.
"""
struct crypAmt <: toknAmount
    sym::Symbol
    val::FD
    function crypAmt(sym::Symbol, val::FD)
        @assert(isCryp(sym), @sprintf("%s is not a crypto currency!", sym))
        SYM = string(sym)
        if length(SYM) > 6
            eid = collect(eachindex(SYM))
            SYM = SYM[eid[1]:eid[6]]
        end
        new(Symbol(SYM), val)
    end
end

# outer constructors
crypAmt(sym::Symbol, val::Real) = crypAmt(sym, FD(val))

# export
export crypAmt

# concrete interface functions:
bare(x::crypAmt) = x.val
symb(x::crypAmt) = x.sym


