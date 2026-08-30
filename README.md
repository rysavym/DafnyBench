# DafnyBench

This is a fork of [DafnyBench](https://github.com/sun-wendy/DafnyBench) for the purpose of 
evaluating the performance of the Boogie TPTP plugin.

The original DafnyBench repository and its contents are distributed under the Apache License, 
Version 2.0. The original `LICENSE` file is retained in this repository.

The following changes were made to the source:

- Deleted Dafny programs containing bitvectors:
  - `DafnyBench/dataset/ground_truth/BinaryAddition.dfy`
  - `DafnyBench/dataset/ground_truth/Clover_swap_bitvector.dfy`
  - `DafnyBench/dataset/ground_truth/Dafny-Practice_tmp_tmphnmt4ovh_Pattern Matching.dfy`
  - `DafnyBench/dataset/ground_truth/Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_from dafny main repo_dafny4_ACL2-extractor.dfy`
  - `DafnyBench/dataset/ground_truth/WrappedEther.dfy`
  - `DafnyBench/dataset/ground_truth/dafl_tmp_tmp_r3_8w3y_dafny_examples_dafny0_SharedDestructorsCompile.dfy`
  - `DafnyBench/dataset/ground_truth/dafny-synthesis_task_id_399.dfy`
  - `DafnyBench/dataset/ground_truth/dafny-synthesis_task_id_799.dfy`
- Edited `groupTheory_tmp_tmppmmxvu8h_assignment1.dfy` such that it verifies under Dafny 4.11.0
- Added the script used to execute the benchmark and measure the performance of the TPTP plugin.
Run with `./run-benchmarks <TPTP Prelude> <TPTP Plugin> DafnyBench/dataset/ground_truth`

The modifications were made by Marek Ryšavý on 30. August 2026, are made available under the same license.

The original benchmark programs are attributed to Chloe Loughridge, Qinyi Sun, Seth Ahrenbach, Federico Cassano, 
Chuyue Sun, Ying Sheng, Anish Mudide, Md Rakib Hossain Misu, Nada Amin and Max Tegmark.

Original work:

> Chloe Loughridge et al., "DafnyBench: A Benchmark for Formal Software Verification", 2024.

Paper: [https://arxiv.org/abs/2406.08467](https://arxiv.org/abs/2406.08467)

Repository: [https://github.com/sun-wendy/DafnyBench](https://github.com/sun-wendy/DafnyBench)

Original README:

# DafnyBench: A Benchmark for Formal Software Verification

Dataset & code for our paper [DafnyBench: A Benchmark for Formal Software Verification](https://arxiv.org/abs/2406.08467)
<br>

Dataset is also available for [download on 🤗 Hugging Face](https://huggingface.co/datasets/wendy-sun/DafnyBench).
<br><br>

## Overview 📊

DafnyBench is the largest benchmark of its kind for training and evaluating machine learning systems for formal software verification, with over 750 Dafny programs.
<br><br>


## Usage 💻

- <b>Dataset</b>: The dataset for DafnyBench (with 782 programs) could be found in the `DafnyBench` directory, which contains the `ground_truth` set & the `hints_removed`set (with compiler hints, i.e. annoataions, removed).
- <b>Evaluation</b>: Evaluate LLMs on DafnyBench by asking models to fill in missing hints in a test file from the `hints_removed` set and checking if the reconstructed program could be verified by Dafny. Please refer to the `eval` directory.
<br>


<p align="center">
  <img src="assets/task_overview.png" width="600px"/>
</p>
<br><br>



## Set Up for Evaluation 🔧

1. Install Dafny on your machine by following [this tutorial](https://dafny.org/dafny/Installation)
2. Clone & `cd` into this repository
3. Set up environment by running the following lines:
```
python -m venv stats
source stats/bin/activate
pip install -r requirements.txt
cd eval
```
4. Set up environment variable for the root directory:
```
export DAFNYBENCH_ROOT=
```
5. Set up environment variable for path to Dafny executable on your machine (for example, `/opt/homebrew/bin/Dafny`):
```
export DAFNY_PATH=
```
6. If you're evaluating an LLM through API access, set up API key. For example:
```
export OPENAI_API_KEY=
```
7. You can choose to evaluate an LLM on a single test program, such as:
```
python fill_hints.py --model "gpt-4o" --test_file "Clover_abs_no_hints.dfy" --feedback_turn 3 --dafny_path "$DAFNY_PATH"
```
or evaluate on the entire dataset:
```
export model_to_eval='gpt-4o'
./run_eval.sh
```
<br>


## Contents 📁

- `DafnyBench`
  - A collection of 782 Dafny programs. Each program has a `ground_truth` version that is fully verified with Dafny & a `hints_removed` version that has hints (i.e. annotations) removed
- `eval`
  - Contains scripts to evaluate LLMs on DafnyBench
- `results`
  - `results_summary` - Dataframes that summarize LLMs' success on every test program
  - `reconstructed_files` - LLM outputs with hints filled back in
  - `analysis` - Contains a notebook for analyzing the results

<br><br>


## Citation 📎

```bibtex
@article{loughridge2024dafnybench,
         title={DafnyBench: A Benchmark for Formal Software Verification}, 
         author={Chloe Loughridge and Qinyi Sun and Seth Ahrenbach and Federico Cassano and Chuyue Sun and Ying Sheng and Anish Mudide and Md Rakib Hossain Misu and Nada Amin and Max Tegmark},
         year={2024},
         journal={arXiv preprint arXiv:2406.08467}
}
```
