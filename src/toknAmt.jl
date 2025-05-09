#--------------------------------------------------------------------------------------------------#
#                                            toknAmt.jl                                            #
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
#                        FD - Fixed (Point) Decimal with preset parameters                         #
#--------------------------------------------------------------------------------------------------#

FD(s::String) = FD(parse(BigFloat, s))

FD(q::Rational) = FD(BigFloat(q))

FD(i::Irrational) = FD(BigFloat(i))


#--------------------------------------------------------------------------------------------------#
#                                       toknAmount interface                                       #
#--------------------------------------------------------------------------------------------------#

# function to return a token's symbol as a ::Symbol
function symb(x::𝕋)::Symbol where {𝕋 <: toknAmount} end

# function to return a token's "bare" value as a ::FD
function bare(x::𝕋)::FD where {𝕋 <: toknAmount} end

# function to mkcp a token's instance
function mkcp(x::𝕋) where {𝕋 <: toknAmount}
    𝕋(symb(x), bare(x))
end

# export
export symb, bare, mkcp

# imports
import Base: +, -, *, /, inv, abs, ==, isless, zero, one

# {𝕋}-unaries
for unARY in [:-, :inv, :abs, :zero, :one]
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


