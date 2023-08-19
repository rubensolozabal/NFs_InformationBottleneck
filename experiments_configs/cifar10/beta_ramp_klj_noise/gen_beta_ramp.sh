beta_values=(1
            31.6)

alpha_values=(0.0
            0.01
            )

noise=(0.001
            0.1
            1
            )

for b in ${beta_values[@]}; do
    for a in ${alpha_values[@]}; do
        for c in ${noise[@]}; do
            cat << EOF > beta_${b}_alpha_${a}_noise_${c}.ini
[checkpoints]
base_name = beta_${b}_alpha_${a}_noise_${c}
interval_checkpoint = 1000
interval_figure = 1000
live_updates = False

[training]
beta_IB = ${b}
ib_klj = True
alpha_klj = ${a}

[data]
noise_amplitde = ${c}
dequantize_uniform = True

EOF
done
done
done

