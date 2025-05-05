#--------------------------------------------------------------------------------------------------#
#                                          UniKrypToks.jl                                          #
#--------------------------------------------------------------------------------------------------#

# module
module UniKrypToks

# imports
using Reexport
@reexport using FixedPointDecimal
@reexport using Printf

# include - abstract supertypes
include("abstract.jl")

# include - constants
include("constant.jl")

# include - token amount
include("tokenAmt.jl")

# module
end


