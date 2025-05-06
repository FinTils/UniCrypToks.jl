#--------------------------------------------------------------------------------------------------#
#                                           abstract.jl                                            #
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
#                             Top-Level AbstractFinance abstract type                              #
#--------------------------------------------------------------------------------------------------#

"""
`abstract type AbstractFinance <: Any end`\n
Top-Level AbstractFinance abstract type, under which every custom AbstractFinance type must be
hooked into.
"""
abstract type AbstractFinance <: Any end

# export
export AbstractFinance


#--------------------------------------------------------------------------------------------------#
#                                    AbstractTokenAmount branch                                    #
#--------------------------------------------------------------------------------------------------#

"""
`abstract type AbstractTokenAmount <: AbstractFinance end`\n
Abstract type for all token amount types.
"""
abstract type AbstractTokenAmount <: AbstractFinance end

"""
`abstract type PlainAmount <: AbstractTokenAmount end`\n
Abstract type for all plain (uniform-precision) amount types.
"""
abstract type PlainAmount <: AbstractTokenAmount end

"""
`abstract type CurrAmount <: AbstractTokenAmount end`\n
Abstract type for all (uniform-precision) currency amount types.
"""
abstract type CurrAmount <: AbstractTokenAmount end

# export
export AbstractTokenAmount, PlainAmount, CurrAmount


