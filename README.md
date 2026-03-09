# Do Object Channels Improve Robustness in Deep Reinforcement Learning?
## Supplementary Materials

We provide full experimental details to facilitate reproducibility,
including hyperparameter configurations, random seeds, and training scripts.
Each model is trained with three independent seeds (0, 1, 2) to ensure statistical
robustness and account for variance in reinforcement learning training.
Our implementation follows the CleanRL framework (Huang et al. 2022),
a well-established reinforcement learning library designed for transparency,
simplicity, and ease of replication.

Our masking approaches are implemented as wrappers for the OCAtari/HackAtari environments (Delfosse et al. 2024, 2025),
as they provide a consistent object extraction that is easy to use for Atari games,
as well as an easy way to adapt and create perturbations.

The code appendix consists of the following two repositories:
* The training repository based on CleanRL: `ocp_cleanrl`
* The code for the wrappers constituting the primary method: `ocp`

### Installation
Set up a Python 3.9 environment. 

Install the requirements for the training:
```bash
cd ocp_cleanrl
pip install -r requirements.txt
cd ..
```
Then install OCP:
```bash
cd ocp
pip install -r requirements.txt
pip install .
cd ..
```

### Test it yourself!
To test the approach, we provide a small set of models that can be used with the provided run,
print, and evaluation scripts (see scripts folder in the `ocp` repository) to visualize the results.
With the scripts, you can measure the performance reported in the paper and test other perturbations and games.
Our training is based on a slight adaptation of the CleanRL framework (Huang et al. 2022). 

To run the evaluation script with the correct perturbations:


```
python ocp/scripts/eval.py -g $GAME -a $MODEL_PATH -m $MODIFICATION_LIST
```


To evaluate an _OCP_ Pong agent stored at _ocp/models/Pong/0/ppo_ocp.cleanrl_model_ on _lazy enemy Pong_ (i.e., the opponent is not always aligned with the ball), this turns into:

```bash
python ocp/scripts/eval.py -g Pong -wr object_channels+pixels -a ocp/models/Pong/0/ppo_ocp.cleanrl_model -m lazy_enemy
```

Due to space constraints, we can only provide agents trained on Pong.

### Training
To start a training run, you can choose from `ppo_arari_ocp.py` and `rainbow_atari_ocp.py`. 
The observation mode (`--obs-mode`) can be set to any of `dqn`, `object_channels`, `object_channels+pixels` for OCP, and `obj`, where with `obj`, a `--architecture PPO_OBJ` is necessary instead of `PPO`, e.g.,
```bash
python ocp_cleanrl/cleanrl/ppo_atari_ocp.py --env-id ALE/Pong-v5 --obs_mode object_channels+pixels --architecture PPO
```

Further details can be found in the respective `README.md` files of the two repositories.

## References
Delfosse, Q.; Blüml, J.; Gregori, B.; Sztwiertnia, S.; and
Kersting, K. 2024. OCAtari: Object-Centric Atari 2600 Reinforcement Learning Environments. _Reinforcement Learning Journal_.

Delfosse, Q.; Blüml, J.; Tatai, F.; Vincent, T.; Gregori, B.;
Dillies, E.; Peters, J.; Rothkopf, C.; and Kersting, K. 2025.
Deep Reinforcement Learning Agents are not even close to Human Intelligence. arXiv:2505.21731.

Huang, S.; Dossa, R. F. J.; Ye, C.; Braga, J.; Chakraborty, D.;
Mehta, K.; and Ara´ujo, J. G. 2022. CleanRL: High-quality Single-file Implementations of Deep Reinforcement Learning Algorithms. _Journal of Machine Learning Research_
