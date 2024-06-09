import json
import tomllib
from pathlib import Path
import pytest
import subprocess

TEST_DIR = Path(__file__).parent
BASE_COMMAND = ["typst", "query", "--root", TEST_DIR.parent, "--one", "--field=value"]

def pytest_generate_tests(metafunc):
    if "testfile" in metafunc.fixturenames:
        items = (file for file in TEST_DIR.iterdir() if file.name.endswith(".query.typ"))
        metafunc.parametrize("testfile", items, ids=lambda x: x.name)

def test_compile(testfile, tmp_path):
    output_path = (tmp_path / testfile.name).with_suffix(".png")
    result = json.loads(subprocess.check_output(BASE_COMMAND + [testfile, "<result>"]))
    expected = json.loads(subprocess.check_output(BASE_COMMAND + [testfile, "<expected>"]))

    assert result == expected
