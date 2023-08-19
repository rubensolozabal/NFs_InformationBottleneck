beta_values=( 1.0000
             31.6)

alpha_values=(
            0.01
            )


tv_split=(
            0.2
            0.4
            0.6
            0.8
)

for b in ${beta_values[@]}; do
    for a in ${alpha_values[@]}; do
        for c in ${tv_split[@]}; do
            cat << EOF > beta_${b}_alpha_${a}_split_${c}.ini

[checkpoints]
base_name = beta_${b}_alpha_${a}_split_${c}
interval_checkpoint = 1000
interval_figure = 1000
live_updates = False

[training]
beta_IB = ${b}
ib_klj = True
alpha_klj = ${a}


[data]
tv_split = ${c}


EOF
done
done
done

