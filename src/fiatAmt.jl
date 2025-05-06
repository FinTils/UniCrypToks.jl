#--------------------------------------------------------------------------------------------------#
#                                            fiatAmt.jl                                            #
#--------------------------------------------------------------------------------------------------#

isFiat(x::Symbol) = x in Currencies.allsymbols()
isCryp(x::Symbol) = !isFiat(x)


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
        @assert(isFiat(sym), @sprintf("%s is not a fiat currency!", sym))
        SYM = string(sym)
        if length(SYM) > 6
            eid = collect(eachindex(SYM))
            SYM = SIM[eid[1]:eid[6]]
        end
        new(Symbol(SYM), val)
    end
end

# outer constructors
fiatAmt(sym::Symbol, val::Real) = fiatAmt(sym, FD(val))

# export
export fiatAmt

# concrete interface functions:
bare(x::fiatAmt) = x.val
symb(x::fiatAmt) = x.sym
isFiat(x::fiatAmt) = true


