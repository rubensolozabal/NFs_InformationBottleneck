
alpha_values=(0
            0.1
)

noise=(0.001
            0.1
            1
            )


for a in ${alpha_values[@]}; do
    for c in ${noise[@]}; do
        cat << EOF > alpha_${a}_noise_${c}.ini

[checkpoints]
base_name = ablation_class_nll_alpha_${a}_noise_${c}

[training]
cnll_klj = True
alpha_klj = ${a}

[ablations]
no_NLL_term = False
class_NLL = True
standard_softmax_loss = False
feed_forward_resnet = False

[data]
noise_amplitde = ${c}
dequantize_uniform = True

EOF
done
done

