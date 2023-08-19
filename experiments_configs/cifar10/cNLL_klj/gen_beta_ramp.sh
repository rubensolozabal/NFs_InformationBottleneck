
alpha_values=(0.0
            0.001
            0.01
            0.1
            1
            10
            100)


for a in ${alpha_values[@]}; do
    cat << EOF > alpha_${a}.ini

[checkpoints]
base_name = ablation_class_nll_alpha_${a}

[training]
cnll_klj = True
alpha_klj = ${a}

[ablations]
no_NLL_term = False
class_NLL = True
standard_softmax_loss = False
feed_forward_resnet = False

[data]
tv_split = ${c}
EOF
done

