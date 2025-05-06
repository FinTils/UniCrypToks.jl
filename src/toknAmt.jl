#--------------------------------------------------------------------------------------------------#
#                                            toknAmt.jl                                            #
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
#                                       toknAmount interface                                       #
#--------------------------------------------------------------------------------------------------#

# function to return a token's symbol as a ::Symbol
function symb(x::𝕋)::Symbol where {𝕋 <: toknAmount} end

# function to return a token's "bare" value as a ::FD
function bare(x::𝕋)::FD where {𝕋 <: toknAmount} end

# function to copy a token's instance
function copy(x::𝕋) where {𝕋 <: toknAmount}
    𝕋(symb(x), bare(x))
end

# imports
import Base: +, -, *, /, inv, abs, ==, isless

# {𝕋}-unaries
for unARY in [:-, :inv, :abs]
    @eval $unARY(x::𝕋) where {𝕋 <: toknAmount} = 𝕋(symb(x), $unARY(bare(x)))
end

# {𝕋, 𝕋}-binaries
for bnARY in [:+, :-]
    OPER = bnARY == :+ ? "add" : "subtract"
    @eval begin
        function $bnARY(x::𝕋, y::𝕋) where {𝕋 <: toknAmount}
            @assert(symb(x) == symb(y),
                    @sprintf("Can't %s different tokens!", $OPER))
            𝕋(symb(x), $bnARY(bare(x), bare(y)))
        end
    end
end

# {𝕋, Real}-binaries
for bnARY in [:*, :/]
    @eval $bnARY(x::𝕋, y::Real) where {𝕋 <: toknAmount} = 𝕋(symb(x), $bnARY(bare(x), y))
end
# fallback versions thereof
*(y::Real, x::𝕋) where {𝕋 <: toknAmount} = *(x, y)

# Bool {𝕋, 𝕋}-binaries
for bnARY in [Symbol("=="), :isless]
    @eval $bnARY(x::𝕋, y::𝕋) where {𝕋 <: toknAmount} = $bnARY(bare(x), bare(y))
end

# show
function show(io::IO, ::MIME"text/plain", x::𝕋) where {𝕋 <: toknAmount}
    iscompact = get(io, :compact, false)
    if iscompact
        print(@sprintf("%+.10f %s", BigFloat(bare(x)), symb(x)))
    else
        print(@sprintf("%+10.10f %6s", BigFloat(bare(x)), symb(x)))
    end
end


