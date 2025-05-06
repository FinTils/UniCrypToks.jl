#--------------------------------------------------------------------------------------------------#
#                                           tokenAmt.jl                                            #
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
#                        FD - Fixed (Point) Decimal with preset parameters                         #
#--------------------------------------------------------------------------------------------------#

FD(s::String) = FD(parse(BigFloat, s))

FD(q::Rational) = FD(BigFloat(q))

import Base: show

function show(io::IO, ::MIME"text/plain", x::FD)
    iscompact = get(io, :compact, false)
    if iscompact
        print(@sprintf("%+.10f", BigFloat(x)))
    else
        print(@sprintf("%+10.10f", BigFloat(x)))
    end
end


#--------------------------------------------------------------------------------------------------#
#                                        amt <: PlainAmount                                        #
#--------------------------------------------------------------------------------------------------#

"""
`struct amt <: PlainAmount`\n
Plain, uniform precision, uniform underlying data type, fixed point decimal "amt" amount.
"""
struct amt <: PlainAmount
    val::FD
end

# export
export amt

# Base functions to add methods
import Base: repr, show, +, -, *, /, inv, abs


