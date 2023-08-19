beta_values=(0.03
            0.17
            1
            5.62
            31.6)

alpha_values=(0.0
            0.001
            0.01
            0.1
            1)

for b in ${beta_values[@]}; do
    for a in ${alpha_values[@]}; do
        cat << EOF > beta_${b}_alpha_${a}.ini
[checkpoints]
base_name = klj_beta_${b}_alpha_${a}
interval_checkpoint = 1000
interval_figure = 1000
live_updates = False

[training]
beta_IB = ${b}
ib_klj = True
alpha_klj = ${a}
EOF
done
done

