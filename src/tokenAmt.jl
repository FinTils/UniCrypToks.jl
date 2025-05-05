#--------------------------------------------------------------------------------------------------#
#                                           tokenAmt.jl                                            #
#--------------------------------------------------------------------------------------------------#

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


