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
`abstract type UniformAmount <: AbstractFinance end`\n
Abstract type for all token amount types.
"""
abstract type UniformAmount <: AbstractFinance end

"""
`abstract type toknAmount <: UniformAmount end`\n
Abstract type for all (uniform-precision) currency amount types.
"""
abstract type toknAmount <: UniformAmount end

"""
`abstract type pairAmount <: UniformAmount end`\n
Abstract type for all (uniform-precision) paired/tracked currency amount types.

A paired (or, fiat-tracked crypto) currency amount is a cryptocurrency amount paired with it's
corresponding fiat purchase price.
"""
abstract type pairAmount <: UniformAmount end

# export
export UniformAmount, toknAmount, pairAmount


