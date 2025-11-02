import openpyxl
import pytest

def load_tests(file_path):
    wb = openpyxl.load_workbook(file_path)
    sheet = wb.active
    tests = []
    for row in sheet.iter_rows(min_row=2, values_only=True):
        if all(row):
            tests.append(row)
    return tests

test_data = load_tests("test_matrix.xlsx")

@pytest.mark.parametrize("test_id, description, expected, actual", test_data)
def test_cases(test_id, description, expected, actual):
    assert expected == actual, f"Test {test_id} failed: {description}"
