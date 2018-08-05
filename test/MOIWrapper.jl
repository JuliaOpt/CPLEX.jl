using CPLEX, Base.Test, MathOptInterface, MathOptInterface.Test

const MOI  = MathOptInterface
const MOIT = MathOptInterface.Test

@testset "Unit Tests" begin
    config = MOIT.TestConfig()
    solver = CplexOptimizer()

    MOIT.unittest(solver, config, [
        "solve_affine_interval", # not implemented
        "solve_qp_edge_cases",   # not implemented
        "solve_qcp_edge_cases",  # not implemented
    ])

    MOIT.modificationtest(solver, config, [
        "solve_func_scalaraffine_lessthan"
    ])
end

@testset "Linear tests" begin
    linconfig = MOIT.TestConfig()
    @testset "Default Solver"  begin
        solver = CplexOptimizer()
        MOIT.contlineartest(solver, linconfig, ["linear10","linear11",
                "linear12", "linear8a","linear8b","linear8c"])
    end
end

@testset "Integer Linear tests" begin
    intconfig = MOIT.TestConfig()
    solver = CplexOptimizer()
    MOIT.intlineartest(solver, intconfig, ["int2", "int3"]) 
    # 3 is ranged, 2 has sos
end