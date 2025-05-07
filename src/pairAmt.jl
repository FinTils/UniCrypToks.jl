#--------------------------------------------------------------------------------------------------#
#                                            pairAmt.jl                                            #
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
#                                       pairAmount interface                                       #
#--------------------------------------------------------------------------------------------------#

# function to return a pair's symbol as a ::NTuple{2,Symbol}
function symb(x::𝕋)::NTuple{2,Symbol} where {𝕋 <: pairAmount} end

# function to return a pair's "bare" values as a ::NTuple{2,FD}
function bare(x::𝕋)::NTuple{2,FD} where {𝕋 <: pairAmount} end

# function to copy a pair's instance
function copy(x::𝕋) where {𝕋 <: pairAmount}
    𝕋(symb(x), bare(x))
end

## # imports
## import Base: +, -, *, /, inv, abs, ==, isless
## 
## # {𝕋}-unaries
## for unARY in [:-, :inv, :abs]
##     @eval $unARY(x::𝕋) where {𝕋 <: pairAmount} = 𝕋(symb(x), $unARY(bare(x)))
## end
## 
## # {𝕋, 𝕋}-binaries
## for bnARY in [:+, :-]
##     OPER = bnARY == :+ ? "add" : "subtract"
##     @eval begin
##         function $bnARY(x::𝕋, y::𝕋) where {𝕋 <: pairAmount}
##             @assert(symb(x) == symb(y),
##                     @sprintf("Can't %s different tokens!", $OPER))
##             𝕋(symb(x), $bnARY(bare(x), bare(y)))
##         end
##     end
## end
## 
## # {𝕋, Real}-binaries
## for bnARY in [:*, :/]
##     @eval $bnARY(x::𝕋, y::Real) where {𝕋 <: pairAmount} = 𝕋(symb(x), $bnARY(bare(x), y))
## end
## # fallback versions thereof
## *(y::Real, x::𝕋) where {𝕋 <: pairAmount} = *(x, y)
## 
## # Bool {𝕋, 𝕋}-binaries
## for bnARY in [Symbol("=="), :isless]
##     @eval $bnARY(x::𝕋, y::𝕋) where {𝕋 <: pairAmount} = $bnARY(bare(x), bare(y))
## end
## 
## # show
## function show(io::IO, ::MIME"text/plain", x::𝕋) where {𝕋 <: pairAmount}
##     iscompact = get(io, :compact, false)
##     if iscompact
##         print(@sprintf("%+.10f %s", BigFloat(bare(x)), symb(x)))
##     else
##         print(@sprintf("%+10.10f %6s", BigFloat(bare(x)), symb(x)))
##     end
## end


