using Distributed

#rmprocs(procs())
#addprocs()

@everywhere include("models.jl")
@everywhere include("integrators.jl")
@everywhere include("run_da_ssa.jl")
@everywhere using .Models
@everywhere using .Integrators
@everywhere using .run_da_ssa

M = 30
D = 42
modes = 1:5
osc_vars = 1:D
model = "true"
model_err = "false"
integrator = Integrators.ks_integrate
outfreq = 4
Δt = 0.25
m = 20
cycles = 1000
window = outfreq*Δt
inflation = 1.01
record_length = 10000.0
obs_err_pct = 0.1
ens_err_pct = 0.01
transient = 500
cov = false
k = 1

info1, info2 = run_da_ssa.etkf_da_ssa_compare(model=model, model_err=model_err,
                                              M=M, D=D, modes=modes,
                                              osc_vars=osc_vars,
                                              integrator=integrator,
                                              outfreq=outfreq, Δt=Δt,
                                              m=m, cycles=cycles, window=window,
                                              inflation=inflation,
                                              record_length=record_length,
                                              obs_err_pct=obs_err_pct,
                                              ens_err_pct=ens_err_pct,
                                              transient=transient, cov=cov, k=k)
