from pathlib import Path
import subprocess

TEST_DIR = Path(__file__).parent

def pytest_generate_tests(metafunc):
    if "testfile" in metafunc.fixturenames:
        items = (file.absolute() for file in TEST_DIR.iterdir() if file.name.endswith(".visual.typ"))
        metafunc.parametrize("testfile", items)

def test_compile(testfile, tmp_path):
    output_path = (tmp_path / testfile.name).with_suffix(".png")
    result = subprocess.run(["typst", "compile", "-f", "png", "--root", testfile.parent.parent, testfile, output_path])
    assert result.returncode == 0, "Example didn't compile"

    output_path.unlink(missing_ok=True)
    
