##-------------------------------
## IB KLJ regularization: ./experiments_configs/cifar10/beta_ramp_klj
python main.py train experiments_configs/cifar10/beta_ramp_klj/beta_1_alpha_0.0.ini

## IB KLJ regularization training split: ./experiments_configs/cifar10/tvsplit_klj
python main.py train experiments_configs/cifar10/tvsplit_klj/beta_1.0000_alpha_0.01_split_0.2.ini

## IB KLJ regularization outliers noise: ./experiments_configs/cifar10/rationoise_klj
python main.py train experiments_configs/cifar10/rationoise_klj/beta_1_alpha_0.0_noiseratio_0.1_noise_amplitde_0.2.ini

## IB KLJ regularization label noise: ./experiments_configs/cifar10/label_noise_klj
python main.py train experiments_configs/cifar10/label_noise_klj/beta_1_alpha_0.0_label_noise_ratio0.1.ini

## IB KLJ regularization outliers noise: ./experiments_configs/cifar10/weigtdecay_klj
python main.py train experiments_configs/cifar10/weigtdecay_klj/beta_1_alpha_0.0_weight_0.001.ini
##-------------------------------
## cNLL KLJ regularization: ./experiments_configs/cifar10/cNLL_klj
python main.py train experiments_configs/cifar10/cNLL_klj/alpha_1.ini

## cNLL KLJ regularization training split: ./experiments_configs/cifar10/cNLL_tvsplit_klj
python main.py train experiments_configs/cifar10/cNLL_tvsplit_klj/cnll_alpha_0.1_split_0.2.ini

## cNLL KLJ regularization training split: ./experiments_configs/cifar10/cNLL_klj_noise
python main.py train experiments_configs/cifar10/cNLL_klj_noise/alpha_0.1_noise_1.ini

