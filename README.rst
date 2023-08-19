"Robustly train Normalizing Flows via KL Divergence Regularization"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Forked from https://github.com/vislearn/IB-INN

The following code contains the modification in the FreIA blocks required for KL regularization. 

**Requirements:**
::
  git clone https://github.com/VLL-HD/FrEIA.git
  cd FrEIA
  git checkout v0.2
  pip install -r requirements.txt

Install the package:
::
  cd NFs_InformationBottleneck/
  pip install -e .

**Launch experiments:**
See run_benchmarks.sh
::
  ## Training
  python main.py train experiments_configs/cifar10/beta_ramp_klj/beta_1_alpha_0.0.ini
  ## Testing
  python main.py test experiments_configs/cifar10/beta_ramp_klj/beta_1_alpha_0.0.ini
