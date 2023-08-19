beta_values=(
            1
            31.6)

alpha_values=(0.0
            0.01
)


noise_ratio=(0.05
            0.1
            0.2)

noise_amplitude=(
            0.2
            1
            )

for b in ${beta_values[@]}; do
    for a in ${alpha_values[@]}; do
        for c in ${noise_ratio[@]}; do
            for d in ${noise_amplitude[@]}; do
                cat << EOF > beta_${b}_alpha_${a}_noiseratio_${c}_noise_amplitde_${d}.ini
[checkpoints]
base_name = klj_beta_${b}_alpha_${a}_noiseratio_${c}_noise_amplitde_${d}
interval_checkpoint = 1000
interval_figure = 1000
live_updates = False

[training]
beta_IB = ${b}
ib_klj = True
alpha_klj = ${a}


[data]
noise_amplitde = ${d}
dequantize_uniform = True
ratio_samples_noise = ${c}

EOF
done
done
done
done
