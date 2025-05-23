#--------------------------------------------------------------------------------------------------#
#                                          UniKrypToks.jl                                          #
#--------------------------------------------------------------------------------------------------#

# module
module UniKrypToks

# imports
using Reexport
@reexport using FixedPointDecimals
@reexport using Printf
@reexport using Currencies

# include - abstract supertypes
include("abstract.jl")

# include - constants
include("constant.jl")

# include - token amount
include("toknAmt.jl")

# include - ratio
include("ratio.jl")

# include - pair/tracked amount
include("pairAmt.jl")

# include - fiat amount
include("fiatAmt.jl")

# include - cryp amount
include("crypAmt.jl")

# module
end


