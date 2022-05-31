import argparse
import pathlib
from json import load

from cookiecutter.generate import generate_context, generate_files


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("template", type=pathlib.Path)
    parser.add_argument("--replay-file", type=argparse.FileType("r"), required=True)
    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()

    context = load(args.replay_file)

    print(
        generate_files(
            repo_dir=args.template,
            context=context,
        )
    )
