#--------------------------------------------------------------------------------------------------#
#                                           constant.jl                                            #
#--------------------------------------------------------------------------------------------------#

"""
`const DEF`\n
Constant definitions for the package.
"""
const DEF = (decimals = 10,
             FixDecTy = Int128,)

# Resulting FixedDecimal type
const FD = FixedDecimal{DEF.FixDecTy, DEF.decimals}

# Resulting denominator
const DENO = DEF.FixDecTy(10)^DEF.decimals

# export
export DEF, FD


