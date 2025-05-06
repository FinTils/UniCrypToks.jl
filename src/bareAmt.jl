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

bare(x::amt)::FD = x.val

copy(x::amt)::amt = amt(bare(x))

# export
export bare, copy

function show(io::IO, ::MIME"text/plain", x::amt)
    print(@sprintf("%+.10f", BigFloat(x.val)))
end

# Base functions to add methods
import Base: +, -, *, /, inv, abs

+(x::amt, y::amt) = amt(bare(x) + bare(y))

-(x:amt) = amt(-bare(x))

-(x::amt, y::amt) = amt(bare(x) - bare(y))

*(x::amt, a::Real) = amt(bare(x) * a)
*(a::Real, x::amt) = x * a

/(x::amt, a::Real) = amt(bare(x) / a)

inv(x::amt) = amt(inv(bare(x)))

abs(x::amt) = amt(abs(bare(x)))


#--------------------------------------------------------------------------------------------------#
#                                      fiatAmt <: CurrAmount                                       #
#--------------------------------------------------------------------------------------------------#

"""
``\n
"""
struct fiatAmt <: CurrAmount
    sym::Symbol
    qty::amt
end

export fiatAmt


#--------------------------------------------------------------------------------------------------#
#                                      crypAmt <: CurrAmount                                       #
#--------------------------------------------------------------------------------------------------#

"""
``\n
"""
struct crypAmt <: CurrAmount
    sym::Symbol
    qty::amt
end

export crypAmt


