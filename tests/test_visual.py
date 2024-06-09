from pathlib import Path
import subprocess
import time

from PIL import Image
from PIL import ImageChops

TEST_DIR = Path(__file__).parent


def pytest_generate_tests(metafunc):
    if "testfile" in metafunc.fixturenames:
        items = (file.absolute() for file in TEST_DIR.iterdir() if file.name.endswith(".visual.typ"))
        metafunc.parametrize("testfile", items, ids=lambda x: x.name)


def test_visual(testfile, tmp_path):
    output_path = (tmp_path / testfile.name).with_suffix(".png")
    status = subprocess.run(["typst", "compile", "-f", "png", "--root", testfile.parent.parent, testfile, output_path])
    assert status.returncode == 0, "Example didn't compile"

    original = Image.open(testfile.with_suffix(".png"))
    result = Image.open(output_path)

    assert original == result

    output_path.unlink(missing_ok=True)
    
