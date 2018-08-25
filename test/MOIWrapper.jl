using CPLEX, Base.Test, MathOptInterface, MathOptInterface.Test

const MOI  = MathOptInterface
const MOIT = MathOptInterface.Test
const MOIB = MathOptInterface.Bridges

@testset "Unit Tests" begin
    config = MOIT.TestConfig()
    solver = CPLEX.Optimizer()

    MOIT.unittest(solver, config, [
        "solve_affine_interval",     # not implemented
        "solve_qp_edge_cases",       # not implemented
        "solve_qcp_edge_cases",      # not implemented
        "solve_objbound_edge_cases", # TODO fix the non zero constant case
    ])    
    @testset "solve_affine_interval" begin
        MOIT.solve_affine_interval(
            MOIB.SplitInterval{Float64}(CPLEX.Optimizer()),
            config
        )
    end
    MOIT.modificationtest(solver, config, [
        "solve_func_scalaraffine_lessthan"
    ])
end

@testset "Linear tests" begin
    linconfig = MOIT.TestConfig()
    @testset "Default Solver"  begin
        solver = CPLEX.Optimizer()
        MOIT.contlineartest(solver, linconfig, ["linear10","linear11",
                "linear12", "linear8a","linear8b","linear8c"])
    end
    @testset "linear10" begin
        MOIT.linear10test(
            MOIB.SplitInterval{Float64}(CPLEX.Optimizer()),
            MOIT.TestConfig()
        )
    end
    @testset "No certificate" begin
        MOIT.linear12test(
            CPLEX.Optimizer(),
            MOIT.TestConfig(infeas_certificates=false)
        )
    end    
end

@testset "Integer Linear tests" begin
    intconfig = MOIT.TestConfig()
    solver = CPLEX.Optimizer()
    MOIT.intlineartest(solver, intconfig, ["int2", "int3"]) 
    # 3 is ranged, 2 has sos
    @testset "int3" begin
        MOIT.int3test(
            MOIB.SplitInterval{Float64}(CPLEX.Optimizer()),
            MOIT.TestConfig()
        )
    end
end