import os
import sys
import logging
import argparse
import subprocess
import multiprocessing
from tqdm import tqdm



parser = argparse.ArgumentParser()
parser.add_argument(
    "benchmarks_dir", type=str,
    help="path to the directory of benchmarks")
parser.add_argument(
    "--ignore_white_list", action="store_true",
    help="ignore white list")
parser.add_argument(
    "--ignore_black_list", action="store_true",
    help="ignore black list")
parser.add_argument(
    "--num_cpus", type=int,
    help="number of CPUs used")
parser.add_argument(
    "--time_out", type=str,
    default="300", help="timeout for running the repairer")
parser.add_argument(
    "--iters", type=int,
    default=5, help="number of repeated iterations")
args = parser.parse_args()

logging.basicConfig(
    level=logging.DEBUG,
    format="%(asctime)s %(levelname)-8s %(message)s",
    datefmt="%m-%d %H:%M",
    filename="log",
    filemode="w")


def clean_plan(plan_file, out_file, negative=False):
    lines = []
    idx = None
    with open(plan_file, "r") as f:
        for i, line in enumerate(f):
            if "-copy" in line:
                continue
            if "turning" in line:
                continue
            if "-stop" in line:
                if negative:
                    idx = i // 2
                continue
            lines.append(line)
    with open(out_file, "w") as f:
        for line in lines:
            f.write(line)
    return idx


def evaluate(root):
    task_names = filter(
        lambda x: os.path.isdir(os.path.join(root, x)) and not x.startswith("."),
        os.listdir(root))

    for task_name in task_names:
        task_dir = os.path.join(root, task_name)
        white_dir = os.path.join(task_dir, "white-list")
        black_dir = os.path.join(task_dir, "black-list")
        _filter = lambda x: ("plan" in x) and ("val-plan" not in x) and ("inval-plan" not in x)
        white_plans = filter(_filter, os.listdir(white_dir))
        for plan in white_plans:
            plan_file = os.path.join(white_dir, plan)
            plan_outfile = os.path.join(white_dir, "val-" + plan)
            _ = clean_plan(plan_file, plan_outfile)
        black_plans = filter(_filter, os.listdir(black_dir))
        for plan in black_plans:
            plan_file = os.path.join(black_dir, plan)
            plan_outfile = os.path.join(black_dir, "inval-" + plan)
            idx = clean_plan(plan_file, plan_outfile, True)
            with open(plan_outfile + ".idx", "w") as f:
                f.write(str(idx))
    for i in range(args.iters):
        # outfile = os.path.join(root, "conflicts.{}".format(i + 1))
        cmd = [
            "time",
            "timeout",
            args.time_out,
            sys.executable,
            "main.py",
            root,
            "--domain_file",
            "domain-modified.pddl",
            # "--outfile",
            # outfile,
            "--iteration",
            str(i+1)]
        if args.ignore_white_list:
            cmd.append("--ignore_white_list")
        elif args.ignore_black_list:
            cmd.append("--ignore_black_list")
        cmd = " ".join(cmd)
        proc = subprocess.Popen(
            cmd,
            executable="/bin/bash",
            shell=True,
            stdin=sys.stdin,
            stdout=sys.stdout,
            stderr=sys.stderr,
            text=True)
        # proc.wait()
        out, errs = proc.communicate()
        print("Captured stdout:", out)
        print("Captured stderr:", errs)
        # if errs:
        #     domain = root.split("/")[-1]
        #     logging.error(domain + ":" + errs)
        #     break
        # times = [e for e in errs.split("\n") if e]
        # wall_time = times[-3].split('\t')[-1]
        # minutes, seconds = wall_time.split("m")[0], wall_time.split("m")[-1][:-1]
        # total_secs = float(minutes) * 60 + float(seconds)
        # time_file = os.path.join(root, "time.{}".format(i + 1))
        # with open(time_file, "w") as f:
        #     f.write(str(total_secs))


if __name__ == '__main__':
    benchmarks = []
    for domain_name in os.listdir(args.benchmarks_dir):
        if domain_name.startswith('.'):
            continue
        if domain_name != "slitherlink-opt23-adl":
            continue
        domain_dir = os.path.join(
            args.benchmarks_dir, domain_name)
        benchmarks.append(domain_dir)
    num_cpus = multiprocessing.cpu_count()
    if args.num_cpus is not None:
        num_cpus = args.num_cpus
    with multiprocessing.Pool(num_cpus) as p:
        _ = list(tqdm(p.imap_unordered(evaluate, benchmarks), total=len(benchmarks)))
