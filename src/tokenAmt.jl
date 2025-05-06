#--------------------------------------------------------------------------------------------------#
#                                           tokenAmt.jl                                            #
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
#                        FD - Fixed (Point) Decimal with preset parameters                         #
#--------------------------------------------------------------------------------------------------#

FD(s::String) = FD(parse(BigFloat, s))

FD(q::Rational) = FD(BigFloat(q))

FD(i::Irrational) = FD(BigFloat(i))

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
    amt(val::FD) = new(val)
    amt(val::Real) = new(FD(val))
    amt(val::String) = new(FD(val))
    amt(val::Rational) = new(FD(val))
    amt(val::Irrational) = new(FD(val))
end

# export
export amt

function show(io::IO, ::MIME"text/plain", x::amt)
    print(@sprintf("%+.10f", BigFloat(x.val)))
end

# Base functions to add methods
import Base: +, -, *, /, inv, abs


