#--------------------------------------------------------------------------------------------------#
#                                         abstract.test.jl                                         #
#--------------------------------------------------------------------------------------------------#

@testset "abstract.test.jl                                                " begin
    # --- Down-walking abstract type tests
    𝑝 = Any
    for 𝑠 in [:AbstractFinance, :AbstractTokenAmount, :PlainAmount]
        @test isdefined(FinTilsBase, 𝑠)         # Is it defined in the module?
        @test isdefined(Main, 𝑠)                # Is is exported?
        @test hasdoc(FinTilsBase, 𝑠)            # Is it documented?
        @test eval(𝑠) isa DataType              # Is it a DataType
        @test eval(𝑠) in subtypes(eval(𝑝))
        𝑝 = 𝑠
    end
end


