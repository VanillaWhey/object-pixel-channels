# Do Object Channels Improve Robustness in Deep Reinforcement Learning?

This is the official repository of [Do Object Channels Improve Robustness in Deep Reinforcement Learning?](https://openreview.net/forum?id=7BFbso4B3R).

You can also read more in our [blog post](https://www.aiml.informatik.tu-darmstadt.de/people/jblueml/blog_occam/OPC_blog.html).

---

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

This repository consists of the following two directories:
* The training repository based on CleanRL: `opc_cleanrl`
* The code for the wrappers constituting the primary method: `opc`

## Installation
Set up a Python 3.9 environment. 

Install the requirements for the training:
```bash
cd opc_cleanrl
pip install -r requirements.txt
cd ..
```
Then install OPC:
```bash
cd opc
pip install -r requirements.txt
pip install .
cd ..
```

## Test it yourself!
To test the approach, we provide a small set of models that can be used with the provided run,
print, and evaluation scripts (see scripts folder in the `opc` repository) to visualize the results.
With the scripts, you can measure the performance reported in the paper and test other perturbations and games.
Our training is based on a slight adaptation of the CleanRL framework (Huang et al. 2022). 

To run the evaluation script with the correct perturbations:


```
python opc/scripts/eval.py -g $GAME -a $MODEL_PATH -m $MODIFICATION_LIST
```


To evaluate an _OPC_ Pong agent stored at _opc/models/Pong/0/ppo_opc.cleanrl_model_ on _lazy enemy Pong_ (i.e., the opponent is not always aligned with the ball), this turns into:

```bash
python opc/scripts/eval.py -g Pong -wr object_channels+pixels -a opc/models/Pong/0/ppo_opc.cleanrl_model -m lazy_enemy
```

Due to space constraints, we can only provide agents trained on Pong.

### Training
To start a training run, you can choose from `ppo_arari_opc.py` and `rainbow_atari_opc.py`. 
The observation mode (`--obs-mode`) can be set to any of `dqn`, `object_channels`, `object_channels+pixels` for OPC, and `obj`, where with `obj`, a `--architecture PPO_OBJ` is necessary instead of `PPO`, e.g.,
```bash
python opc_cleanrl/cleanrl/ppo_atari_opc.py --env-id ALE/Pong-v5 --obs_mode object_channels+pixels --architecture PPO
```

Further details can be found in the respective `README.md` files of the two repositories.

## Citing this work
If you are using _OPC_ for your scientific publications, please cite us:
```bibtex
@article{blueml2026opc,
    title={Do Object Channels Improve Robustness in Deep Reinforcement Learning?},
    author={Jannis Blüml and Cedric Derstroff and Bjarne Gregori and Elisabeth Dillies and Quentin Delfosse and Kristian Kersting},
    journal={Transactions on Machine Learning Research},
    issn={2835-8856},
    year={2026},
    url={https://openreview.net/forum?id=7BFbso4B3R},
}
```

## References
Delfosse, Q.; Blüml, J.; Gregori, B.; Sztwiertnia, S.; and
Kersting, K. 2024. OCAtari: Object-Centric Atari 2600 Reinforcement Learning Environments. _Reinforcement Learning Journal_.

Delfosse, Q.; Blüml, J.; Tatai, F.; Vincent, T.; Gregori, B.;
Dillies, E.; Peters, J.; Rothkopf, C.; and Kersting, K. 2025.
Deep Reinforcement Learning Agents are not even close to Human Intelligence. arXiv:2505.21731.

Huang, S.; Dossa, R. F. J.; Ye, C.; Braga, J.; Chakraborty, D.;
Mehta, K.; and Ara´ujo, J. G. 2022. CleanRL: High-quality Single-file Implementations of Deep Reinforcement Learning Algorithms. _Journal of Machine Learning Research_
