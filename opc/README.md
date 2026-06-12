# OCATARI-Wrappers

This repository includes the wrappers to be used with [OCAtari](https://github.com/k4ntz/OC_Atari)
to generate object channel input representations.

## Install
```bash
pip install "gymnasium[atari, accept-rom-license]"
pip install -r requirements.txt
pip install .
```

## Usage
```python
from ocatari_wrappers import ObjectChannelsWrapper
from ocatari import OCAtari

env = OCAtari("ALE/Frostbite")

env = ObjectChannelsWrapper(env)

obs, info = env.reset()

done = False
while not done:
    action = env.action_space.sample()
    obs, reward, terminated, truncated, info = env.step(action)
    done = terminated or truncated
```

## Test Setup
First, we test if the Backend is set up correctly

```bash
python scripts/run.py -g Pong -hu
```

Now we test if the wrappers are also set up

```bash
python scripts/print_state.py
```

If everything works as intended you should now have an SVG showing you the object channels in the game of Freeway after 100 steps.
