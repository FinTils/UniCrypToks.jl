#--------------------------------------------------------------------------------------------------#
#                                          UniKrypToks.jl                                          #
#--------------------------------------------------------------------------------------------------#

# module
module UniKrypToks

# imports
using Reexport
@reexport using FixedPointDecimals
@reexport using Printf

# include - abstract supertypes
include("abstract.jl")

# include - constants
include("constant.jl")

# include - token amount
include("tokenAmt.jl")

# include - fiat amount
include("fiatAmt.jl")

# include - cryp amount
include("crypAmt.jl")

# module
end


