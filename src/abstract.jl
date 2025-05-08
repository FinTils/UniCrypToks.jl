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
#                                       UnifiedAmount branch                                       #
#--------------------------------------------------------------------------------------------------#

"""
`abstract type UnifiedAmount <: AbstractFinance end`\n
Abstract type for all (unified-precision) token amount types.
"""
abstract type UnifiedAmount <: AbstractFinance end

"""
`abstract type toknAmount <: UnifiedAmount end`\n
Abstract type for all (unified-precision) currency amount types.
"""
abstract type toknAmount <: UnifiedAmount end

"""
`abstract type pairAmount <: UnifiedAmount end`\n
Abstract type for all (unified-precision) paired/tracked currency amount types.

A paired (or, fiat-tracked crypto) currency amount is a cryptocurrency amount paired with it's
corresponding fiat purchase price.
"""
abstract type pairAmount <: UnifiedAmount end

# export
export UnifiedAmount, toknAmount, pairAmount


#--------------------------------------------------------------------------------------------------#
#                                       UnifiedRatio branch                                        #
#--------------------------------------------------------------------------------------------------#

"""
`abstract type UnifiedRatio <: AbstractFinance end`\n
Abstract type for all (unified-precision) crypto-to-fiat ratio types.
"""
abstract type UnifiedRatio <: AbstractFinance end

# export
export UnifiedRatio


