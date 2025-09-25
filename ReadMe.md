# Deep Reinforcement Learning via Object-Centric Attention: Supplementary Materials

We provide full experimental details to facilitate reproducibility,
including hyperparameter configurations, random seeds, and training scripts.
Each model is trained with three independent seeds (0, 1, 2) to ensure statistical
robustness and account for variance in reinforcement learning training.
Our implementation follows the CleanRL framework (Huang et al. 2022b),
a well-established reinforcement learning library designed for transparency,
simplicity, and ease of replication.

Our masking approaches are implemented as wrappers for the OCAtari/HackAtari environments (Delfosse et al. 2024a, 2025),
as they provide a consistent object extraction that is easy to use for Atari games,
as well as an easy way to adapt and create perturbations.

The code appendix consists of the following two repositories:
* The training repository based on CleanRL: `oc_cleanrl`
* The code for the wrappers constituting our primary method: `occam`

### Installation
Set up a Python 3.9 environment. 

Install the requirements for the training:
```bash
cd oc_cleanrl
pip install -r requirements.txt
cd ..
```
Then install OCCAM:
```bash
cd occam
pip install -r requirements.txt
pip install .
cd ..
```

### Test it yourself!
To test our approach, we provide a small set of models that can be used with the provided run,
print, and evaluation scripts (see scripts folder in the `occam` repository) to visualize the results.
With the scripts, you can measure the performance reported in the paper and test other perturbations and games.
Our training is based on a slight adaptation of the CleanRL framework (Huang et al. 2022b). 

To run the evaluation script with the correct perturbations:


```
python occam/scripts/eval.py -g $GAME -a $MODEL_PATH -m $MODIFICATION_LIST
```


To evaluate a _Binary masks_ Pong agent stored at _occam/models/Pong/0/ppo_binary.cleanrl_model_ on _lazy enemy Pong_ (i.e., the opponent is not always aligned with the ball), this turns into:

```bash
python occam/scripts/eval.py -g Pong -wr binary -a occam/models/Pong/0/ppo_binary.cleanrl_model -m lazy_enemy
```

Due to space constraints, we can only provide agents trained on Pong.

### Training
To start a training run, you can choose from `ppo_arari_occam.py` and `rainbow_atari_occam.py`. 
The observation mode (`--obs-mode`) can be set to any of `dqn`, `occam_binary`, `occam_objects`, `occam_classes`, `occam_planes`, and `obj`, where with `obj`, a `--architecture PPO_OBJ` is necessary instead of `PPO`, e.g.,
```bash
python oc_cleanrl/cleanrl/ppo_atari_occam.py --env-id ALE/Pong-v5 --obs_mode occam_planes --architecture PPO
```

Further details can be found in the respective `README.md` files of the two repositories.

## References
Delfosse, Q.; Blüml, J.; Gregori, B.; Sztwiertnia, S.; and
Kersting, K. 2024a. OCAtari: Object-Centric Atari 2600 Reinforcement Learning Environments. _Reinforcement Learning Journal_.

Delfosse, Q.; Blüml, J.; Tatai, F.; Vincent, T.; Gregori, B.;
Dillies, E.; Peters, J.; Rothkopf, C.; and Kersting, K. 2025.
Deep Reinforcement Learning Agents are not even close to Human Intelligence. arXiv:2505.21731.

Huang, S.; Dossa, R. F. J.; Ye, C.; Braga, J.; Chakraborty, D.;
Mehta, K.; and Ara´ujo, J. G. 2022b. CleanRL: High-quality Single-file Implementations of Deep Reinforcement Learning Algorithms. _Journal of Machine Learning Research_
