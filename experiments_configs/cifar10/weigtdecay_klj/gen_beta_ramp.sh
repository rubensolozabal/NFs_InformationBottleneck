beta_values=(
            1
            31.6)

alpha_values=(0.0
            0.01
)


weight_decay=(
            0.001)


for b in ${beta_values[@]}; do
    for a in ${alpha_values[@]}; do
        for c in ${weight_decay[@]}; do
            cat << EOF > beta_${b}_alpha_${a}_weight_${c}.ini
[checkpoints]
base_name = klj_beta_${b}_alpha_${a}_weight_${c}
interval_checkpoint = 1000
interval_figure = 1000
live_updates = False

[training]
beta_IB = ${b}
ib_klj = True
alpha_klj = ${a}
weight_decay = ${c}
EOF
done
done
done

