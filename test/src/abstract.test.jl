#--------------------------------------------------------------------------------------------------#
#                                         abstract.test.jl                                         #
#--------------------------------------------------------------------------------------------------#

@testset "abstract.test.jl                                                " begin
    # --- Generalized abstract type tests
    for 𝑝, 𝑠 in [(:Any                      ,  :AbstractFinance        ),
                 (  :AbstractFinance        ,    :AbstractTokenAmount  ),
                 (    :AbstractTokenAmount  ,      :bareAmount         ),
                 (    :AbstractTokenAmount  ,      :toknAmount         ),
                ]
        @test isdefined(FinTilsBase, 𝑠)         # Is it defined in the module?
        @test isdefined(Main, 𝑠)                # Is is exported?
        @test hasdoc(FinTilsBase, 𝑠)            # Is it documented?
        @test eval(𝑠) isa DataType              # Is it a DataType?
        @test eval(𝑠) in subtypes(eval(𝑝))      # Is 𝑠 a direct subtype of 𝑝?
    end
end


