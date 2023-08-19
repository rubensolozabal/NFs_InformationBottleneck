beta_values=(
            1
            31.6)

alpha_values=(0.0
            0.01)


label_noise_ratio=(0.05
            0.1
            0.2)


for b in ${beta_values[@]}; do
    for a in ${alpha_values[@]}; do
        for c in ${label_noise_ratio[@]}; do
            cat << EOF > beta_${b}_alpha_${a}_label_noise_ratio${c}.ini
[checkpoints]
base_name = klj_beta_${b}_alpha_${a}_label_noise_ratio${c}
interval_checkpoint = 1000
interval_figure = 1000
live_updates = False

[training]
beta_IB = ${b}
ib_klj = True
alpha_klj = ${a}


[data]
dequantize_uniform = True
ratio_label_noise = ${c}

EOF

done
done
done
