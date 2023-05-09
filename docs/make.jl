push!(LOAD_PATH,"../src/")
#=cd("../")
include(joinpath(pwd(), "package_activate.jl"))
genx_path = joinpath(pwd(), "src")
push!(LOAD_PATH, genx_path)=#
import DataStructures: OrderedDict
using GenX
using Documenter
DocMeta.setdocmeta!(GenX, :DocTestSetup, :(using GenX); recursive=true)
println(pwd())
genx_docpath = joinpath(pwd(), "docs/src")
push!(LOAD_PATH, genx_docpath)
pages = OrderedDict(
    "Welcome Page" => [
        "GenX: Introduction" => "index.md",
        "Running GenX Cases" => "how_to_run_genx.md",
        "Multi-Stage Capacity Expansion Planning with GenX" => "multi_stage_genx.md",
        "Limitation of GenX" => "limitations_genx.md",
        "Third Party Extensions" => "third_party_genx.md"
    ],
    "Model Concept and Overview" => [
        "Model Introduction" => "model_introduction.md",
        "Notation" => "model_notation.md",
        "Objective Function" => "objective_function.md",
        "Power Balance" => "power_balance.md"
    ],
    "Model Function Reference" => [
        "Core" => "core.md",
        "Resources" => [
            "Curtailable Variable Renewable" => "curtailable_variable_renewable.md",
            "Flexible Demand" => "flexible_demand.md",
            "Hydro" => [
                "Hydro Reservoir" => "hydro_res.md",
                "Long Duration Hydro" => "hydro_inter_period_linkage.md"
            ],
            "Must Run" => "must_run.md",
            "Storage" => [
                "Storage" => "storage.md",
                "Investment Charge" => "investment_charge.md",
                "Investment Energy" => "investment_energy.md",
                "Long Duration Storage" => "long_duration_storage.md",
                "Storage All" => "storage_all.md",
                "Storage Asymmetric" => "storage_asymmetric.md",
                "Storage Symmetric" => "storage_symmetric.md"
            ],
            "Thermal" => [
                "Thermal" => "thermal.md",
                "Thermal Commit" => "thermal_commit.md",
                "Thermal No Commit" => "thermal_no_commit.md"
            ]
        ],
        "Multi_stage" => [
            "Overview" => "multi_stage_model_overview.md",
            "Load inputs for multi-stage modeling" => [
                "Configure multi-stage inputs" => "configure_multi_stage_inputs.md",
                #"Load inputs" => "load_inputs_multi_stage.md",
                "Load generators data" => "load_generators_data_multi_stage.md",
                "Load network data" => "load_network_data_multi_stage.md",
            ],
            "Model multi stage" => [
                "Investment multi stage" => "investment_multi_stage.md",
                "Dual Dynamic Programming Algorithm" => "dual_dynamic_programming.md"
                ],
        ],
        "Policies" => "policies.md"
    ],
    "Methods" => "methods.md",
    "Solver Configurations" => "solver_configuration.md",
    "Solving the Model" => "solve_model.md",
    "Additional Features" => "additional_features.md",
    "Third Party Extensions" => "additional_third_party_extensions.md",
    "Model Inputs/Outputs Documentation" => "data_documentation.md",
    "GenX Inputs Functions" => "load_inputs.md",
    "GenX Outputs Functions" =>"write_outputs.md",
    #"Unit Testing (Under Development)" => "unit_testing.md"
)
makedocs(;
    modules=[GenX],
    authors="Jesse Jenkins, Nestor Sepulveda, Dharik Mallapragada, Aaron Schwartz, Neha Patankar, Qingyu Xu, Jack Morris, Sambuddha Chakrabarti",
    #repo="https://github.com/sambuddhac/GenX.jl/blob/{commit}{path}#{line}",
    sitename="GenX",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://genxproject.github.io/GenX/stable",
        assets=String[],
    ),
    pages=[p for p in pages]
)

deploydocs(;
    repo="github.com/GenXProject/GenX.git",
    target = "build",
    branch = "gh-pages",
    devbranch = "main",
    devurl = "dev",
    push_preview=true,
    versions = ["stable" => "v^", "v#.#"],
    forcepush = false,
)
