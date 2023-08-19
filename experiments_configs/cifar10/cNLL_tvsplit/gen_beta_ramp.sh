
tv_split=(
            0.2
            0.4
            0.6
            0.8
)

for c in ${tv_split[@]}; do
    cat << EOF > cnll_split_${c}.ini

[checkpoints]
base_name = ablation_class_nll_split_${c}


[ablations]
no_NLL_term = False
class_NLL = True
standard_softmax_loss = False
feed_forward_resnet = False

[data]
tv_split = ${c}

EOF
done

