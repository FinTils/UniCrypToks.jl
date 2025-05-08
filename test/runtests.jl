using UniKrypToks
using Test
using InteractiveUtils
using Base.Docs: hasdoc


#--------------------------------------------------------------------------------------------------#
#                                   Tests for src/UniKrypToks.jl                                   #
#--------------------------------------------------------------------------------------------------#

@testset "Testing UniKrypToks.jl                                          " begin
    # Write your tests here.
end


#--------------------------------------------------------------------------------------------------#
#                                    Tests for src/abstract.jl                                     #
#--------------------------------------------------------------------------------------------------#

@testset "Testing abstract.jl                                             " begin
    # --- Generalized abstract type tests
    for pair in [(  :AbstractFinance        ,:Any                       ),
                 (    :UnifiedAmount        ,  :AbstractFinance         ),
                 (      :pairAmount         ,    :UnifiedAmount         ),
                 (      :toknAmount         ,    :UnifiedAmount         ),
                 (    :UnifiedRatio         ,  :AbstractFinance         ),
                ]
        𝑐, 𝑝 = pair
        @test isdefined(UniKrypToks, 𝑐)         # Is it defined in the module?
        @test isdefined(Main, 𝑐)                # Is is exported?
        @test hasdoc(UniKrypToks, 𝑐)            # Is it documented?
        @test eval(𝑐) isa DataType              # Is it a DataType?
        @test eval(𝑐) in subtypes(eval(𝑝))      # Is 𝑐 a direct subtype of 𝑝?
    end
end


